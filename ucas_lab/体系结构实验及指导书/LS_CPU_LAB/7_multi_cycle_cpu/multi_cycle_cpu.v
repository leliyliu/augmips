`timescale 1ns / 1ps
//*************************************************************************
//   > �ļ���: multi_cycle_cpu.v
//   > ����  :������CPUģ�飬��ʵ��36��ָ��
//   >        ָ��rom������ram��ʵ����xilinx IP�õ���Ϊͬ����д
//   > ����  : LOONGSON
//   > ����  : 2016-04-14
//*************************************************************************
module multi_cycle_cpu(  // ������cpu
    input clk,           // ʱ��
    input resetn,        // ��λ�źţ��͵�ƽ��Ч
    
    //display data
    input  [ 4:0] rf_addr,
    input  [31:0] mem_addr,
    output [31:0] rf_data,
    output [31:0] mem_data,
    output [31:0] IF_pc,
    output [31:0] IF_inst,
    output [31:0] ID_pc,
    output [31:0] EXE_pc,
    output [31:0] MEM_pc,
    output [31:0] WB_pc,
    output [31:0] display_state
    );
//----------------------{���ƶ����ڵ�״̬��}begin------------------------//
    reg [2:0] state;       // ��ǰ״̬
    reg [2:0] next_state;  // ��һ״̬

    //չʾ��ǰ����������ִ���ĸ�ģ��
    assign display_state = {29'd0,state};
    // ״̬��״̬
    parameter IDLE   = 3'd0;  // ��ʼ
    parameter FETCH  = 3'd1;  // ȡָ
    parameter DECODE = 3'd2;  // ����
    parameter EXE    = 3'd3;  // ִ��
    parameter MEM    = 3'd4;  // �ô�
    parameter WB     = 3'd5;  // д��

    always @ (posedge clk)        // ��ǰ״̬
    begin
        if (!resetn) begin        // �����λ�ź���Ч
            state <= IDLE;       // ��ǰ״̬Ϊ ��ʼ
        end
        else begin                // ����
            state <= next_state;  // Ϊ��һ״̬
        end
    end

    wire IF_over;     // IFģ����ִ����
    wire ID_over;     // IDģ����ִ����
    wire EXE_over;    // EXEģ����ִ����
    wire MEM_over;    // MEMģ����ִ����
    wire WB_over;     // WBģ����ִ����
    wire jbr_not_link;//��ָ֧��(��link��)��ֻ��IF��ID��
    always @ (*)                             // ��һ״̬ 
    begin
        case (state)
            IDLE : 
            begin
                next_state = FETCH;    // ��ʼ->ȡָ
            end
            FETCH: 
            begin
                if (IF_over)
                begin
                    next_state = DECODE;   // ȡָ->����
                end
                else
                begin
                    next_state = FETCH;    // ȡָ->����
                end
            end
            DECODE: 
            begin
                if (ID_over)
                begin                      // ����->ִ�л�ȡָ   
                    next_state = jbr_not_link ? FETCH : EXE;
                end
                else
                begin
                    next_state = DECODE;   // ȡָ->����
                end
            end
            EXE: 
            begin
                if (EXE_over)
                begin
                    next_state = MEM;      // ִ��->�ô�
                end
                else
                begin
                    next_state = EXE;   // ȡָ->����
                end
            end
            MEM:
            begin
                if (MEM_over)
                begin
                    next_state = WB;       // �ô�->д��
                end
                else
                begin
                    next_state = MEM;   // ȡָ->����
                end
            end
            WB:
            begin
                if (WB_over)
                begin
                    next_state = FETCH;    // д��->ȡָ
                end
                else
                begin
                    next_state = WB;   // ȡָ->����
                end
            end
            default : next_state = IDLE;
        endcase
    end
    //5ģ���valid�ź�
    wire IF_valid;
    wire ID_valid;
    wire EXE_valid;
    wire MEM_valid;
    wire WB_valid;
    assign  IF_valid = (state == FETCH );  // ��ǰ״̬Ϊȡָʱ��IF����Ч
    assign  ID_valid = (state == DECODE);  // ��ǰ״̬Ϊ����ʱ��ID����Ч
    assign EXE_valid = (state == EXE   );  // ��ǰ״̬Ϊִ��ʱ��EXE����Ч
    assign MEM_valid = (state == MEM   );  // ��ǰ״̬Ϊ�ô�ʱ��MEM����Ч
    assign  WB_valid = (state == WB    );  // ��ǰ״̬Ϊд��ʱ��WB����Ч
//-----------------------{���ƶ����ڵ�״̬��}end-------------------------//

//--------------------------{5���������}begin---------------------------//
    wire [ 63:0] IF_ID_bus;   // IF->ID������
    wire [149:0] ID_EXE_bus;  // ID->EXE������
    wire [105:0] EXE_MEM_bus; // EXE->MEM������
    wire [ 69:0] MEM_WB_bus;  // MEM->WB������
    
    //�������������ź�
    reg [ 63:0] IF_ID_bus_r;
    reg [149:0] ID_EXE_bus_r;
    reg [105:0] EXE_MEM_bus_r;
    reg [ 69:0] MEM_WB_bus_r;
    
    //IF��ID�������ź�
    always @(posedge clk)
    begin
        if(IF_over)
        begin
            IF_ID_bus_r <= IF_ID_bus;
        end
    end
    //ID��EXE�������ź�
    always @(posedge clk)
    begin
        if(ID_over)
        begin
            ID_EXE_bus_r <= ID_EXE_bus;
        end
    end
    //EXE��MEM�������ź�
    always @(posedge clk)
    begin
        if(EXE_over)
        begin
            EXE_MEM_bus_r <= EXE_MEM_bus;
        end
    end    
    //MEM��WB�������ź�
    always @(posedge clk)
    begin
        if(MEM_over)
        begin
            MEM_WB_bus_r <= MEM_WB_bus;
        end
    end
//---------------------------{5���������}end----------------------------//

//--------------------------{���������ź�}begin--------------------------//
    //��ת����
    wire [ 32:0] jbr_bus;    

    //IF��inst_rom����
    wire [31:0] inst_addr;
    wire [31:0] inst;

    //MEM��data_ram����    
    wire [ 3:0] dm_wen;
    wire [31:0] dm_addr;
    wire [31:0] dm_wdata;
    wire [31:0] dm_rdata;

    //ID��regfile����
    wire [ 4:0] rs;
    wire [ 4:0] rt;   
    wire [31:0] rs_value;
    wire [31:0] rt_value;
    
    //WB��regfile����
    wire        rf_wen;
    wire [ 4:0] rf_wdest;
    wire [31:0] rf_wdata;    
//---------------------------{���������ź�}end---------------------------//

//-------------------------{��ģ��ʵ����}begin---------------------------//
    wire next_fetch; //��������ȡָģ�飬��Ҫ������PCֵ
    //��ǰ״̬Ϊdecode����ָ��Ϊ��ת��ָ֧��(��link��)����decodeִ�����
    //���ߣ���ǰ״̬Ϊwb����wbִ����ɣ��򼴽�����fetch״̬
    assign next_fetch = (state==DECODE & ID_over & jbr_not_link)
                      | (state==WB     & WB_over);
    fetch IF_module(             // ȡָ��
        .clk       (clk       ),  // I, 1
        .resetn    (resetn    ),  // I, 1
        .IF_valid  (IF_valid  ),  // I, 1
        .next_fetch(next_fetch),  // I, 1
        .inst      (inst      ),  // I, 32
        .jbr_bus   (jbr_bus   ),  // I, 33
        .inst_addr (inst_addr ),  // O, 32
        .IF_over   (IF_over   ),  // O, 1
        .IF_ID_bus (IF_ID_bus ),  // O, 64
        
        //չʾPC��ȡ����ָ��
        .IF_pc     (IF_pc     ),
        .IF_inst   (IF_inst   )
    );

    decode ID_module(               // ���뼶
        .ID_valid    (ID_valid    ),  // I, 1
        .IF_ID_bus_r (IF_ID_bus_r ),  // I, 64
        .rs_value    (rs_value    ),  // I, 32
        .rt_value    (rt_value    ),  // I, 32
        .rs          (rs          ),  // O, 5
        .rt          (rt          ),  // O, 5
        .jbr_bus     (jbr_bus     ),  // O, 33
        .jbr_not_link(jbr_not_link),  // O, 1
        .ID_over     (ID_over     ),  // O, 1
        .ID_EXE_bus  (ID_EXE_bus  ),  // O, 150
        
        //չʾPC
        .ID_pc      (ID_pc      )
    );

    exe EXE_module(                   // ִ�м�
        .EXE_valid   (EXE_valid   ),  // I, 1
        .ID_EXE_bus_r(ID_EXE_bus_r),  // I, 150
        .EXE_over    (EXE_over    ),  // O, 1 
        .EXE_MEM_bus (EXE_MEM_bus ),  // O, 106
        
        //չʾPC
        .EXE_pc      (EXE_pc      )
    );

    mem MEM_module(                     // �ô漶
        .clk          (clk          ),  // I, 1 
        .MEM_valid    (MEM_valid    ),  // I, 1
        .EXE_MEM_bus_r(EXE_MEM_bus_r),  // I, 106
        .dm_rdata     (dm_rdata     ),  // I, 32
        .dm_addr      (dm_addr      ),  // O, 32
        .dm_wen       (dm_wen       ),  // O, 4 
        .dm_wdata     (dm_wdata     ),  // O, 32
        .MEM_over     (MEM_over     ),  // O, 1
        .MEM_WB_bus   (MEM_WB_bus   ),  // O, 70
        
        //չʾPC
        .MEM_pc       (MEM_pc       )
    );          
 
    wb WB_module(                     // д�ؼ�
        .WB_valid    (WB_valid    ),  // I, 1
        .MEM_WB_bus_r(MEM_WB_bus_r),  // I, 70
        .rf_wen      (rf_wen      ),  // O, 1
        .rf_wdest    (rf_wdest    ),  // O, 5
        .rf_wdata    (rf_wdata    ),  // O, 32
        .WB_over     (WB_over     ),  // O, 1
        
        //չʾPC
        .WB_pc       (WB_pc       )
    );

    inst_rom inst_rom_module(         // ָ��洢��
        .clka       (clk           ),  // I, 1 ,ʱ��
        .addra    (inst_addr[9:2]),  // I, 8 ,ָ���ַ
        .douta    (inst          )   // O, 32,ָ��
    );

    regfile rf_module(        // �Ĵ�����ģ��
        .clk    (clk      ),  // I, 1
        .wen    (rf_wen   ),  // I, 1
        .raddr1 (rs       ),  // I, 5
        .raddr2 (rt       ),  // I, 5
        .waddr  (rf_wdest ),  // I, 5
        .wdata  (rf_wdata ),  // I, 32
        .rdata1 (rs_value ),  // O, 32
        .rdata2 (rt_value ),  // O, 32

        //display rf
        .test_addr(rf_addr),
        .test_data(rf_data)
    );
    
    data_ram data_ram_module(   // ���ݴ洢ģ��
        .clka   (clk         ),  // I, 1,  ʱ��
        .wea    (dm_wen      ),  // I, 1,  дʹ��
        .addra  (dm_addr[9:2]),  // I, 8,  ����ַ
        .dina   (dm_wdata    ),  // I, 32, д����
        .douta  (dm_rdata    ),  // O, 32, ������

        //display mem
        .clkb   (clk          ),
        .web    (4'd0         ),
        .addrb  (mem_addr[9:2]),
        .doutb  (mem_data     ),
        .dinb   (32'd0        )
    );
//--------------------------{��ģ��ʵ����}end----------------------------//
endmodule
