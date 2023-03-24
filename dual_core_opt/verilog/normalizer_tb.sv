module normalizer_tb;
  timeunit 1ns/1ps;

  parameter BW_PSUM = 16,
            COL = 8,
            W_OUT = BW_PSUM;

  logic clk=0, clk_2=0, reset=1, reset_2=1;
  logic s_valid_1=0, s_valid_2=0;
  logic [COL-1:0][BW_PSUM-1:0] psum_1, psum_2, psum_1_out, psum_2_out;
  logic [W_OUT-1:0] psum_norm_1, psum_norm_2, psum_norm_1_exp, psum_norm_2_exp;
  logic norm_valid;

  logic gate_en=1, gate=1, gclk;
  always @(negedge clk)
    gate_en <= gate;
  assign gclk = clk && gate_en;

  normalizer #(.BW_PSUM(BW_PSUM), .COL(COL), .W_OUT(W_OUT)) dut (.clk(gclk), .*);


  initial forever #5  clk   <= !clk;
  initial forever #10 clk_2 <= !clk_2;

  logic [COL*BW_PSUM-1:0] queue_in_1 [$];
  logic [COL*BW_PSUM-1:0] queue_in_2 [$];

  localparam NUM_EXP = 100;

  // Drive random psum 2 after random wait
  initial begin
    reset_2 <= 1;
    repeat (2) @(posedge clk_2);
    reset_2 <= 0;

    repeat (NUM_EXP) begin
    repeat ($urandom_range(2,20)) @(posedge clk_2);

      @(posedge clk_2) #1;

      s_valid_2 <= 1;
      for (int i=0; i<COL; i++)
        psum_2[i] <= i;//$urandom_range(0,2**BW_PSUM);

      @(posedge clk_2) #1;
      queue_in_2.push_front(psum_2);
      s_valid_2 <= 0;
      wait(norm_valid);
      wait(!norm_valid);
    end
  end

  // Drive random psum 1 after random wait
  initial begin
    reset <= 1;
    repeat (2) @(posedge clk);
    reset <= 0;
    repeat ($urandom_range(0,20)) @(posedge clk);

    repeat (NUM_EXP) begin

      @(posedge clk) #1;

      s_valid_1 <= 1;
      for (int i=0; i<COL; i++)
        psum_1[i] <= i; //$urandom_range(0,2**BW_PSUM);

      @(posedge clk) #1;
      queue_in_1.push_front(psum_1);
      s_valid_1 <= 0;
      wait(norm_valid);
      wait(!norm_valid);

      repeat(2) @(posedge clk) #1;
    end
  end

  // Monitor
  int sum;
  initial begin
    repeat (NUM_EXP) begin
      wait(norm_valid);
      #1
      psum_1_out = queue_in_1.pop_back();
      psum_2_out = queue_in_2.pop_back();
      
      sum = 0;
      foreach (psum_1_out[i])
        sum += $signed(psum_1_out[i]) + $signed(psum_2_out[i]);

      for (int i=0; i<COL; i++) begin
        @(posedge clk);
        psum_norm_1_exp = (256 * psum_1_out[i]) / sum;
        psum_norm_2_exp = (256 * psum_2_out[i]) / sum;

        // $display("q1: %p", psum_1_out);
        // $display("q2: %p", psum_2_out);
        
        assert (psum_norm_1_exp == psum_norm_1) $display("Output matched: %d", psum_norm_1);
        else $error("Error Norm 1:%d, expected: %d  got: %d", i, psum_norm_1_exp, psum_norm_1);

        assert (psum_norm_2_exp == psum_norm_2) $display("Output matched: %d", psum_norm_2);
        else $error("Error Norm 2:%d, expected: %d  got: %d", i, psum_norm_2_exp, psum_norm_2);
      end
      @(posedge clk);
    end
    repeat(5) @(posedge clk);
    $finish;
  end

  // initial begin
  //   reset <= 1; reset_2 <= 1;
  //   repeat (2) @(posedge clk_2);
  //   reset <= 0; reset_2 <= 0;

  //   // Write data 1
  //   @(posedge clk) #1;
  //   s_valid_1 <= 1;
  //   for (int i=0; i<COL; i++)
  //     psum_1[i] <= i+10;

  //   @(posedge clk) #1;
  //   s_valid_1 <= 1;

  //   @(posedge clk) #1 gate <= 0; 

  //   repeat(20) @(posedge clk) #1;
  //   gate <= 1; 

  //   // Write data 2
  //   @(posedge clk_2) #1;
  //   s_valid_2 <= 1;
  //   for (int i=0; i<COL; i++)
  //     psum_2[i] <= i;

  //   @(posedge clk_2) #1;
  //   s_valid_2 <= 0;

  //   wait (norm_valid);
  //   wait (!norm_valid);
  //   repeat (2) @(posedge clk_2);

  //   $finish;
  // end

endmodule