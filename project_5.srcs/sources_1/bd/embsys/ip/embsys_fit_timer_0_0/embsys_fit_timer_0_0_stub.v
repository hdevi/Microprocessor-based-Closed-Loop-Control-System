// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3.1 (win64) Build 2035080 Fri Oct 20 14:20:01 MDT 2017
// Date        : Wed Feb 14 23:20:42 2018
// Host        : HP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               h:/Practice/project_5/project_5.srcs/sources_1/bd/embsys/ip/embsys_fit_timer_0_0/embsys_fit_timer_0_0_stub.v
// Design      : embsys_fit_timer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fit_timer,Vivado 2017.3.1" *)
module embsys_fit_timer_0_0(Clk, Rst, Interrupt)
/* synthesis syn_black_box black_box_pad_pin="Clk,Rst,Interrupt" */;
  input Clk;
  input Rst;
  output Interrupt;
endmodule
