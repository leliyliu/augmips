// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_3,Vivado 2016.2" *)
module inst_rom(clka, addra, douta);
  input clka;
  input [7:0]addra;
  output [31:0]douta;
endmodule
