module dualcore #(
   parameter col = 16,
   parameter bw = 4,
   parameter bw_psum = 2*bw+3,
   parameter pr = 8)(
   input clk1, 
   input rst1,
   input [pr*bw-1:0] mem_in_core1, 
   input [16:0] inst_core1, 
   output [bw_psum*(col/2)-1:0] out_core1,
   input clk2, 
   input rst2,
   input [pr*bw-1:0] mem_in_core2, 
   input [16:0] inst_core2, 
   output [bw_psum*(col/2)-1:0] out_core2,
   input norm_gate,
   input s_valid1, s_valid2, 
   output [bw_psum-1:0] psum_norm_1,
   output [bw_psum-1:0] psum_norm_2,
   output norm_valid);

   wire gclk;

   clk_gate gclk_inst1 (
      .clk (clk1),
      .rst (rst1),
      .gate (norm_gate),
      .gclk (gclk));

   core #(.bw(bw), .bw_psum(bw_psum), .col(col / 2), .pr(pr)) core1_inst (
         .reset(rst1),
         .clk(clk1), 
         .mem_in(mem_in_core1), 
         .inst(inst_core1),
         .out(out_core1));

   core #(.bw(bw), .bw_psum(bw_psum), .col(col / 2), .pr(pr)) core2_inst (
      .reset(rst2),
      .clk(clk2), 
      .mem_in(mem_in_core2), 
      .inst(inst_core2),
      .out(out_core2));

   normalizer #(.BW_PSUM(bw_psum), .COL(col / 2), .W_OUT(bw_psum)) normalizer_inst (
      .clk(gclk),
      .clk_2(clk2),
      .reset(rst1),
      .reset_2(rst2),
      .s_valid_1(s_valid1),
      .s_valid_2(s_valid2),
      .psum_1(out_core1),
      .psum_2(out_core2),
      .psum_norm_1(psum_norm_1),
      .psum_norm_2(psum_norm_2),
      .norm_valid(norm_valid));

endmodule