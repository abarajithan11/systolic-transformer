`include "../rtl/async_fifo.sv"
`default_nettype none

module tb_afifo;
localparam CLK_PERIOD_W = 10;
localparam CLK_PERIOD_R = 15;

localparam WIDTH = 32;
localparam DEPTH = 64;

reg w_clk, r_clk, w_rst, r_rst;
reg w_en, r_en;
wire w_full, r_empty;
reg [WIDTH - 1 : 0] w_data_in;
wire [WIDTH - 1 : 0] r_data_out;

afifo #(.C_DEPTH(DEPTH), .C_WIDTH(WIDTH)) dut (
      .i_wclk(w_clk),
      .i_wrst(w_rst),
      .i_wen(w_en),
      .i_wr_data(w_data_in),
      .o_full(w_full),
      .i_rclk(r_clk),
      .i_rrst(r_rst),
      .i_ren(r_en),
      .o_empty(r_empty),
      .o_rd_data(r_data_out)
   );

initial begin 
   w_clk = 0;
   r_clk = 0;
end

always #(CLK_PERIOD_W/2) w_clk =~ w_clk;
always #(CLK_PERIOD_R/2) r_clk =~ r_clk;

initial begin
   $dumpfile("tb_afifo.vcd");
   $dumpvars(0, tb_afifo);
end

initial begin
   @(posedge r_clk);
   #1 r_rst <= 1'b1;
   @(posedge r_clk);
   #1 r_rst <= 1'b0;
   #1 r_en = 0;
   wait (r_empty == 0);
   wait (w_full == 1);
   @(posedge r_clk);
   #1 r_en = 1;
   wait (r_empty == 1);
   $finish;
end

initial begin
   @(posedge w_clk);
   #1 w_rst = 1'b1;
   @(posedge w_clk);
   #1 w_rst = 1'b0; 
   repeat(2) @(posedge w_clk);
   #1 w_en = 1;
   repeat (64) begin
      #1 w_data_in = $urandom();
      #1 $display("Input = %d\n", w_data_in);
      @(posedge w_clk);
   end
   #1 w_en = 0;
end

endmodule
`default_nettype wire