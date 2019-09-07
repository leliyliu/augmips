`timescale 1ns / 1ps
//*************************************************************************
//   > ÎÄ¼þÃû: pipeline_cpu.v
//   > ÃèÊö  :Îå¼¶Á÷Ë®CPUÄ£¿é£¬¹²ÊµÏÖXXÌõÖ¸Áî
//   >        Ö¸ÁîromºÍÊý¾Ýram¾ùÊµÀý»¯xilinx IPµÃµ½£¬ÎªÍ¬²½¶ÁÐ´
//   > ×÷Õß  : LOONGSON
//   > ÈÕÆÚ  : 2016-04-14
//*************************************************************************
module cpu(
	input         clk,//时钟
	input         resetn,//复位信号
//ram  指令
	input [31:0]  inst_sram_rdata,//ram 读数据  -> inst(所得到的指令)
	output        inst_sram_en,//ram 使能信号   (需要自己添加这一信号的赋值)    ---->还未修改
	output [3:0]  inst_sram_wen,//ram 字节写使能信号 (在机组的流水线中，并未实现)  ---> 还未修改
	output [31:0] inst_sram_addr,//ram 读写地址，字节寻址  -> pc  (inst_addr)   
	output [31:0] inst_sram_wdata,//ram 写数据  (所需要修改的数据指令)    ---> 还未修改
//ram  数据    ->类似于inst_sram   可以直接在mem.v阶段使用
	input [31:0]  data_sram_rdata,//ram 读数据
	output        data_sram_en,//ram 使能信号，高电平有效    ----> 还未修改
	output [3:0]  data_sram_wen,//ram 字节写使能信号
	output [31:0] data_sram_addr,//ram 读写地址
	output [31:0] data_sram_wdata,//ram 写数据 

	output [31:0] debug_wb_pc,//wb级的PC，因而需要mycpu 的PC 一路带到写回级
	output [3:0]  debug_wb_rf_wen,// 写回级写寄存器堆(regfiles) 的写使能，为字节写使能
	output [4:0]  debug_wb_rf_wnum,// 写回级写regfiles的目的寄存器号
	output [31:0] debug_wb_rf_wdata// 写回级写regfiles的写数据
	);

	wire [31:0] IF_pc;
	wire [31:0] IF_inst;
	wire [31:0] ID_pc;
	wire [31:0] EXE_pc;
	wire [31:0] MEM_pc;
    wire [31:0] cpu_5_valid;
    wire [31:0] HI_data,
    wire [31:0] LO_data
//------------------------{5¼¶Á÷Ë®¿ØÖÆÐÅºÅ}begin-------------------------//
    //5Ä£¿éµÄvalidÐÅºÅ
    reg IF_valid;
    reg ID_valid;
    reg EXE_valid;
    reg MEM_valid;
    reg WB_valid;
    //5Ä£¿éÖ´ÐÐÍê³ÉÐÅºÅ,À´×Ô¸÷Ä£¿éµÄÊä³ö
    wire IF_over;
    wire ID_over;
    wire EXE_over;
    wire MEM_over;
    wire WB_over;
    //5Ä£¿éÔÊÐíÏÂÒ»¼¶Ö¸Áî½øÈë
    wire IF_allow_in;
    wire ID_allow_in;
    wire EXE_allow_in;
    wire MEM_allow_in;
    wire WB_allow_in;
    
    // syscallºÍeretµ½´ïÐ´»Ø¼¶Ê±»á·¢³öcancelÐÅºÅ£¬
    wire cancel;    // È¡ÏûÒÑ¾­È¡³öµÄÕýÔÚÆäËûÁ÷Ë®¼¶Ö´ÐÐµÄÖ¸Áî
    
    //¸÷¼¶ÔÊÐí½øÈëÐÅºÅ:±¾¼¶ÎÞÐ§£¬»ò±¾¼¶Ö´ÐÐÍê³ÉÇÒÏÂ¼¶ÔÊÐí½øÈë
    assign IF_allow_in  = (IF_over & ID_allow_in) | cancel;
    assign ID_allow_in  = ~ID_valid  | (ID_over  & EXE_allow_in);
    assign EXE_allow_in = ~EXE_valid | (EXE_over & MEM_allow_in);
    assign MEM_allow_in = ~MEM_valid | (MEM_over & WB_allow_in );
    assign WB_allow_in  = ~WB_valid  | WB_over;
   
    //IF_valid£¬ÔÚ¸´Î»ºó£¬Ò»Ö±ÓÐÐ§
   always @(posedge clk)
    begin
        if (!resetn)
        begin
            IF_valid <= 1'b0;
        end
        else
        begin
            IF_valid <= 1'b1;
        end
    end
    
    //ID_valid
    always @(posedge clk)
    begin
        if (!resetn || cancel)
        begin
            ID_valid <= 1'b0;
        end
        else if (ID_allow_in)
        begin
            ID_valid <= IF_over;
        end
    end
    
    //EXE_valid
    always @(posedge clk)
    begin
        if (!resetn || cancel)
        begin
            EXE_valid <= 1'b0;
        end
        else if (EXE_allow_in)
        begin
            EXE_valid <= ID_over;
        end
    end
    
    //MEM_valid
    always @(posedge clk)
    begin
        if (!resetn || cancel)
        begin
            MEM_valid <= 1'b0;
        end
        else if (MEM_allow_in)
        begin
            MEM_valid <= EXE_over;
        end
    end
    
    //WB_valid
    always @(posedge clk)
    begin
        if (!resetn || cancel)
        begin
            WB_valid <= 1'b0;
        end
        else if (WB_allow_in)
        begin
            WB_valid <= MEM_over;
        end
    end
    
    //Õ¹Ê¾5¼¶µÄvalidÐÅºÅ
    assign cpu_5_valid = {12'd0         ,{4{IF_valid }},{4{ID_valid}},
                          {4{EXE_valid}},{4{MEM_valid}},{4{WB_valid}}};
//-------------------------{5¼¶Á÷Ë®¿ØÖÆÐÅºÅ}end--------------------------//

//--------------------------{5¼¶¼äµÄ×ÜÏß}begin---------------------------//
    wire [ 63:0] IF_ID_bus;   // IF->ID¼¶×ÜÏß
    wire [166:0] ID_EXE_bus;  // ID->EXE¼¶×ÜÏß
    wire [153:0] EXE_MEM_bus; // EXE->MEM¼¶×ÜÏß
    wire [117:0] MEM_WB_bus;  // MEM->WB¼¶×ÜÏß
    
    //Ëø´æÒÔÉÏ×ÜÏßÐÅºÅ
    reg [ 63:0] IF_ID_bus_r;
    reg [166:0] ID_EXE_bus_r;
    reg [153:0] EXE_MEM_bus_r;
    reg [117:0] MEM_WB_bus_r;
    
    //IFµ½IDµÄËø´æÐÅºÅ
    always @(posedge clk)
    begin
        if(IF_over && ID_allow_in)
        begin
            IF_ID_bus_r <= IF_ID_bus;
        end
    end
    //IDµ½EXEµÄËø´æÐÅºÅ
    always @(posedge clk)
    begin
        if(ID_over && EXE_allow_in)
        begin
            ID_EXE_bus_r <= ID_EXE_bus;
        end
    end
    //EXEµ½MEMµÄËø´æÐÅºÅ
    always @(posedge clk)
    begin
        if(EXE_over && MEM_allow_in)
        begin
            EXE_MEM_bus_r <= EXE_MEM_bus;
        end
    end    
    //MEMµ½WBµÄËø´æÐÅºÅ
    always @(posedge clk)
    begin
        if(MEM_over && WB_allow_in)
        begin
            MEM_WB_bus_r <= MEM_WB_bus;
        end
    end
//---------------------------{5¼¶¼äµÄ×ÜÏß}end----------------------------//

//--------------------------{ÆäËû½»»¥ÐÅºÅ}begin--------------------------//
    //Ìø×ª×ÜÏß
    wire [ 32:0] jbr_bus;    

    //IFÓëinst_rom½»»¥
    wire [31:0] inst_addr;
    wire [31:0] inst;

    //IDÓëEXE¡¢MEM¡¢WB½»»¥
    wire [ 4:0] EXE_wdest;
    wire [ 4:0] MEM_wdest;
    wire [ 4:0] WB_wdest;
    
    //MEMÓëdata_ram½»»¥    
    wire [ 3:0] dm_wen;
    wire [31:0] dm_addr;
    wire [31:0] dm_wdata;
    wire [31:0] dm_rdata;

    //IDÓëregfile½»»¥
    wire [ 4:0] rs;
    wire [ 4:0] rt;   
    wire [31:0] rs_value;
    wire [31:0] rt_value;
    
    //WBÓëregfile½»»¥
    wire        rf_wen;
    wire [ 4:0] rf_wdest;
    wire [31:0] rf_wdata;    
    
    //WBÓëIF¼äµÄ½»»¥ÐÅºÅ
    wire [32:0] exc_bus;
//---------------------------{ÆäËû½»»¥ÐÅºÅ}end---------------------------//

//-------------------------{¸÷Ä£¿éÊµÀý»¯}begin---------------------------//
    wire next_fetch; //¼´½«ÔËÐÐÈ¡Ö¸Ä£¿é£¬ÐèÒªÏÈËø´æPCÖµ
    assign next_fetch = IF_allow_in;
    fetch IF_module(             // È¡Ö¸¼¶
        .clk       (clk       ),  // I, 1
        .resetn    (resetn    ),  // I, 1
        .IF_valid  (IF_valid  ),  // I, 1
        .next_fetch(next_fetch),  // I, 1
        .inst      (inst_sram_rdata),  // I, 32
        .jbr_bus   (jbr_bus   ),  // I, 33
        .inst_addr (inst_sram_addr ),  // O, 32
        .IF_over   (IF_over   ),  // O, 1
        .IF_ID_bus (IF_ID_bus ),  // O, 64
        
        //5¼¶Á÷Ë®ÐÂÔö½Ó¿Ú
        .exc_bus   (exc_bus   ),  // I, 32
        
        //Õ¹Ê¾PCºÍÈ¡³öµÄÖ¸Áî
        .IF_pc     (IF_pc     ),  // O, 32
        .IF_inst   (IF_inst   )   // O, 32
    );

    decode ID_module(               // ÒëÂë¼¶
        .ID_valid   (ID_valid   ),  // I, 1
        .IF_ID_bus_r(IF_ID_bus_r),  // I, 64
        .rs_value   (rs_value   ),  // I, 32
        .rt_value   (rt_value   ),  // I, 32
        .rs         (rs         ),  // O, 5
        .rt         (rt         ),  // O, 5
        .jbr_bus    (jbr_bus    ),  // O, 33
//        .inst_jbr   (inst_jbr   ),  // O, 1
        .ID_over    (ID_over    ),  // O, 1
        .ID_EXE_bus (ID_EXE_bus ),  // O, 167
        
        //5¼¶Á÷Ë®ÐÂÔö
        .IF_over     (IF_over     ),// I, 1
        .EXE_wdest   (EXE_wdest   ),// I, 5
        .MEM_wdest   (MEM_wdest   ),// I, 5
        .WB_wdest    (WB_wdest    ),// I, 5
        
        //Õ¹Ê¾PC
        .ID_pc       (ID_pc       ) // O, 32
    ); 

    exe EXE_module(                   // Ö´ÐÐ¼¶
        .EXE_valid   (EXE_valid   ),  // I, 1
        .ID_EXE_bus_r(ID_EXE_bus_r),  // I, 167
        .EXE_over    (EXE_over    ),  // O, 1 
        .EXE_MEM_bus (EXE_MEM_bus ),  // O, 154
        
        //5¼¶Á÷Ë®ÐÂÔö
        .clk         (clk         ),  // I, 1
        .EXE_wdest   (EXE_wdest   ),  // O, 5
        
        //Õ¹Ê¾PC
        .EXE_pc      (EXE_pc      )   // O, 32
    );

    mem MEM_module(                     // ·Ã´æ¼¶
        .clk          (clk          ),  // I, 1 
        .MEM_valid    (MEM_valid    ),  // I, 1
        .EXE_MEM_bus_r(EXE_MEM_bus_r),  // I, 154
        .dm_rdata     (data_sram_rdata     ),  // I, 32
        .dm_addr      (data_sram_addr      ),  // O, 32
        .dm_wen       (data_sram_wen      ),  // O, 4 
        .dm_wdata     (data_sram_wdata     ),  // O, 32
        .MEM_over     (MEM_over     ),  // O, 1
        .MEM_WB_bus   (MEM_WB_bus   ),  // O, 118
        
        //5¼¶Á÷Ë®ÐÂÔö½Ó¿Ú
        .MEM_allow_in (MEM_allow_in ),  // I, 1
        .MEM_wdest    (MEM_wdest    ),  // O, 5
        
        //Õ¹Ê¾PC
        .MEM_pc       (MEM_pc       )   // O, 32
    );          
 
    wb WB_module(                     // Ð´»Ø¼¶
        .WB_valid    (WB_valid    ),  // I, 1
        .MEM_WB_bus_r(MEM_WB_bus_r),  // I, 118
        .rf_wen      (debug_wb_rf_wen      ),  // O, 1
        .rf_wdest    (debug_wb_rf_wnum    ),  // O, 5
        .rf_wdata    (debug_wb_rf_wdata    ),  // O, 32
        .WB_over     (WB_over     ),  // O, 1
        
        //5¼¶Á÷Ë®ÐÂÔö½Ó¿Ú
        .clk         (clk         ),  // I, 1
      .resetn      (resetn      ),  // I, 1
        .exc_bus     (exc_bus     ),  // O, 32
        .WB_wdest    (WB_wdest    ),  // O, 5
        .cancel      (cancel      ),  // O, 1
        
        //Õ¹Ê¾PCºÍHI/LOÖµ
        .WB_pc       (debug_wb_pc ),  // O, 32
        .HI_data     (HI_data     ),  // O, 32
        .LO_data     (LO_data     )   // O, 32
    );

    regfile rf_module(        // ¼Ä´æÆ÷¶ÑÄ£¿é
        .clk    (clk      ),  // I, 1
        .wen    (rf_wen   ),  // I, 1
        .raddr1 (rs       ),  // I, 5
        .raddr2 (rt       ),  // I, 5
        .waddr  (rf_wdest ),  // I, 5
        .wdata  (rf_wdata ),  // I, 32
        .rdata1 (rs_value ),  // O, 32
        .rdata2 (rt_value ),  // O, 32

        //display rf
    );
//--------------------------{¸÷Ä£¿éÊµÀý»¯}end----------------------------//
endmodule
