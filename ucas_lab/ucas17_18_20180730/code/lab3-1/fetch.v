`timescale 1ns / 1ps
//*************************************************************************
//   > ÎÄ¼þÃû: fetch.v
//   > ÃèÊö  :Îå¼¶Á÷Ë®CPUµÄÈ¡Ö¸Ä£¿é
//   > ×÷Õß  : LOONGSON
//   > ÈÕÆÚ  : 2016-04-14
//*************************************************************************
// input 中，只有inst 是需要重点关注的点，而这个inst，实际上是inst_sram_rdata
`define STARTADDR 32'H00000034   // ³ÌÐòÆðÊ¼µØÖ·Îª34H
module fetch(                    // È¡Ö¸¼¶
    input             clk,       // Ê±ÖÓ
    input             resetn,    // ¸´Î»ÐÅºÅ£¬µÍµçÆ½ÓÐÐ§
    input             IF_valid,  // È¡Ö¸¼¶ÓÐÐ§ÐÅºÅ
    input             next_fetch,// È¡ÏÂÒ»ÌõÖ¸Áî£¬ÓÃÀ´Ëø´æPCÖµ
    input      [31:0] inst,      // inst_romÈ¡³öµÄÖ¸Áî
    input      [32:0] jbr_bus,   // 跳转总线，来自decode，注意此处的理解
    output     [31:0] inst_addr, // 实际上是pc，需要继续传递下去，在wb端接收并debug
    output reg        IF_over,   // some signal
    output     [63:0] IF_ID_bus, // 总线
    
    //5¼¶Á÷Ë®ÐÂÔö½Ó¿Ú
    input      [32:0] exc_bus,   // Exception pc×ÜÏß
        
    //Õ¹Ê¾PCºÍÈ¡³öµÄÖ¸Áî
    output     [31:0] IF_pc,//得到pc值，用于取指令
    output     [31:0] IF_inst//用于展示，实际上并没有什么效果
);

//-----{³ÌÐò¼ÆÊýÆ÷PC}begin
    wire [31:0] next_pc;
    wire [31:0] seq_pc;
    reg  [31:0] pc;
    
    //Ìø×ªpc
    wire        jbr_taken;
    wire [31:0] jbr_target;
    assign {jbr_taken, jbr_target} = jbr_bus;  // Ìø×ª×ÜÏß´«ÊÇ·ñÌø×ªºÍÄ¿±êµØÖ·
    
    //Exception PC
    wire        exc_valid;
    wire [31:0] exc_pc;
    assign {exc_valid,exc_pc} = exc_bus;
    
    //pc+4
    assign seq_pc[31:2]    = pc[31:2] + 1'b1;  // ÏÂÒ»Ö¸ÁîµØÖ·£ºPC=PC+4
    assign seq_pc[1:0]     = pc[1:0];

    // ÐÂÖ¸Áî£ºÈôÓÐException,ÔòPCÎªExceptioÈë¿ÚµØÖ·
    //         ÈôÖ¸ÁîÌø×ª£¬ÔòPCÎªÌø×ªµØÖ·£»·ñÔòÎªpc+4
    assign next_pc = exc_valid ? exc_pc : 
                     jbr_taken ? jbr_target : seq_pc;
    always @(posedge clk)    // PC³ÌÐò¼ÆÊýÆ÷
    begin
        if (!resetn)
        begin
            pc <= `STARTADDR; // ¸´Î»£¬È¡³ÌÐòÆðÊ¼µØÖ·
        end
        else if (next_fetch)
        begin
            pc <= next_pc;    // ²»¸´Î»£¬È¡ÐÂÖ¸Áî
        end
    end
//-----{³ÌÐò¼ÆÊýÆ÷PC}end

//-----{·¢Íùinst_romµÄÈ¡Ö¸µØÖ·}begin
    assign inst_addr = pc;
//-----{·¢Íùinst_romµÄÈ¡Ö¸µØÖ·}end

//-----{IFÖ´ÐÐÍê³É}begin
    //ÓÉÓÚÖ¸ÁîromÎªÍ¬²½¶ÁÐ´µÄ,
    //È¡Êý¾ÝÊ±£¬ÓÐÒ»ÅÄÑÓÊ±
    //¼´·¢µØÖ·µÄÏÂÒ»ÅÄÊ±ÖÓ²ÅÄÜµÃµ½¶ÔÓ¦µÄÖ¸Áî
    //¹ÊÈ¡Ö¸Ä£¿éÐèÒªÁ½ÅÄÊ±¼ä
    //¹ÊÃ¿´ÎPCË¢ÐÂ£¬IF_over¶¼ÒªÖÃ0
    //È»ºó½«IF_validËø´æÒ»ÅÄ¼´ÊÇIF_overÐÅºÅ
    always @(posedge clk)
    begin
        if (!resetn || next_fetch)
        begin
            IF_over <= 1'b0;
        end
        else
        begin
            IF_over <= IF_valid;
        end
    end
    //Èç¹ûÖ¸ÁîromÎªÒì²½¶ÁµÄ£¬ÔòIF_valid¼´ÊÇIF_overÐÅºÅ£¬
    //¼´È¡Ö¸Ò»ÅÄÍê³É
//-----{IFÖ´ÐÐÍê³É}end

//-----{IF->ID×ÜÏß}begin
    assign IF_ID_bus = {pc, inst};  // È¡Ö¸¼¶ÓÐÐ§Ê±£¬Ëø´æPCºÍÖ¸Áî
//-----{IF->ID×ÜÏß}end

//-----{Õ¹Ê¾IFÄ£¿éµÄPCÖµºÍÖ¸Áî}begin
    assign IF_pc   = pc;
    assign IF_inst = inst;
//-----{Õ¹Ê¾IFÄ£¿éµÄPCÖµºÍÖ¸Áî}end
endmodule