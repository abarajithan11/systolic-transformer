module normalizer_tb;
  timeunit 1ns/1ps;

  parameter BW_PSUM = 16,
            COL = 8,
            W_OUT = BW_PSUM;

  logic clk=0, clk_2=0, reset=1, reset_2=1;
  logic s_valid_1=0, s_valid_2=0;
  logic [COL-1:0][BW_PSUM-1:0] psum_1;
  logic [COL-1:0][BW_PSUM-1:0] psum_2;
  logic [W_OUT-1:0] psum_norm_1;
  logic [W_OUT-1:0] psum_norm_2;
  logic norm_valid;

  logic gate_en=1, gate=1, gclk;
  always @(negedge clk)
    gate_en <= gate;
  assign gclk = clk && gate_en;

  normalizer #(.BW_PSUM(BW_PSUM), .COL(COL), .W_OUT(W_OUT)) dut (.clk(gclk), .*);


  initial forever #5  clk   <= !clk;
  initial forever #10 clk_2 <= !clk_2;

  initial begin
    reset <= 1; reset_2 <= 1;
    repeat (2) @(posedge clk_2);
    reset <= 0; reset_2 <= 0;

    // Write data 1
    @(posedge clk) #1;
    s_valid_1 <= 1;
    for (int i=0; i<COL; i++)
      psum_1[i] <= i+10;

    @(posedge clk) #1;
    s_valid_1 <= 1;

    @(posedge clk) #1 gate <= 0; 

    repeat(20) @(posedge clk) #1;
    gate <= 1; 

    // Write data 2
    @(posedge clk_2) #1;
    s_valid_2 <= 1;
    for (int i=0; i<COL; i++)
      psum_2[i] <= i;

    @(posedge clk_2) #1;
    s_valid_2 <= 0;

    wait (norm_valid);
    wait (!norm_valid);
    repeat (2) @(posedge clk_2);

    $finish;
  end

endmodule