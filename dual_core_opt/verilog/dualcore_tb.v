`timescale 1ns/1ps

module dualcore_tb;
   localparam total_cycle = 8;
   localparam bw = 4;
   localparam pr = 8;
   localparam col = 2 * 8;
   localparam bw_psum = 2 * bw + $clog2(pr);
   localparam bw_mode2_psum = 8 + 4 + $clog2(pr);

   integer qk_file;
   integer qk_scan_file;

   integer captured_data;
   integer weight [col * pr - 1 : 0];
   integer K [col-1:0][pr-1:0];
   integer N [col-1:0][pr-1:0];
   integer V [total_cycle-1:0][pr-1:0];
   integer Q [total_cycle-1:0][pr-1:0];
   integer sum [total_cycle-1:0];  
   integer result [total_cycle-1:0][col-1:0];

   reg rst1 = 1;
   reg rst2 = 1;
   reg clk1 = 0;
   reg clk2 = 0;
   reg [pr*bw-1:0] mem_in_core1;
   reg [pr*bw-1:0] mem_in_core2; 
   wire [pr*bw-1:0] mem_in_core1_w;
   wire [16:0] inst_core1, inst_core2; 
   reg ofifo_rd_core1 = 0;
   reg qmem_rd_core1 = 0;
   reg qmem_wr_core1 = 0; 
   reg kmem_rd_core1 = 0; 
   reg kmem_wr_core1 = 0;
   reg pmem_rd_core1 = 0; 
   reg pmem_wr_core1 = 0; 
   reg execute_core1 = 0;
   reg load_core1 = 0;
   reg [3:0] qkmem_add_core1 = 0;
   reg [3:0] pmem_add_core1  = 0;
   wire [bw_psum*(col / 2)-1:0] out_core1;
   reg ofifo_rd_core2 = 0;
   reg qmem_rd_core2 = 0;
   reg qmem_wr_core2 = 0; 
   reg kmem_rd_core2 = 0; 
   reg kmem_wr_core2 = 0;
   reg pmem_rd_core2 = 0; 
   reg pmem_wr_core2 = 0; 
   reg execute_core2 = 0;
   reg load_core2 = 0;
   reg [3:0] qkmem_add_core2 = 0;
   reg [3:0] pmem_add_core2  = 0;
   wire [bw_psum*(col / 2)-1:0] out_core2;
   reg norm_en = 1;
   reg s_valid1, s_valid2;
   wire [bw_psum-1:0] psum_norm_1, psum_norm_2;
   wire norm_valid;

   reg [bw_psum - 1 : 0] result_col;
   reg [bw_psum * col - 1 : 0] result_array;
   reg [bw_mode2_psum * (col / 4) - 1 : 0] core0_8x4_mult_prod, core1_8x4_mult_prod;

   reg data_init_done  = 0;
   reg core0_exec_done = 0;
   reg core1_exec_done = 0;
   reg norm_start = 0;

   assign inst_core1[16] = ofifo_rd_core1;
   assign inst_core1[15:12] = qkmem_add_core1;
   assign inst_core1[11:8]  = pmem_add_core1;
   assign inst_core1[7] = execute_core1;
   assign inst_core1[6] = load_core1;
   assign inst_core1[5] = qmem_rd_core1;
   assign inst_core1[4] = qmem_wr_core1;
   assign inst_core1[3] = kmem_rd_core1;
   assign inst_core1[2] = kmem_wr_core1;
   assign inst_core1[1] = pmem_rd_core1;
   assign inst_core1[0] = pmem_wr_core1;

   assign inst_core2[16] = ofifo_rd_core2;
   assign inst_core2[15:12] = qkmem_add_core2;
   assign inst_core2[11:8]  = pmem_add_core2;
   assign inst_core2[7] = execute_core2;
   assign inst_core2[6] = load_core2;
   assign inst_core2[5] = qmem_rd_core2;
   assign inst_core2[4] = qmem_wr_core2;
   assign inst_core2[3] = kmem_rd_core2;
   assign inst_core2[2] = kmem_wr_core2;
   assign inst_core2[1] = pmem_rd_core2;
   assign inst_core2[0] = pmem_wr_core2;

   dualcore #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) dut (
      .rst1(rst1),
      .clk1(clk1), 
      .mem_in_core1(mem_in_core1), 
      .inst_core1(inst_core1),
      .out_core1(out_core1),
      .rst2(rst2),
      .clk2(clk2), 
      .mem_in_core2(mem_in_core2), 
      .inst_core2(inst_core2),
      .out_core2(out_core2),
      .norm_gate(norm_en),
      .s_valid1(s_valid1),
      .s_valid2(s_valid2),
      .psum_norm_1(psum_norm_1),
      .psum_norm_2(psum_norm_2),
      .norm_valid(norm_valid));

   always #10 clk1 = ~clk1;
   always #10 clk2 = ~clk2;

   initial begin 
      $dumpfile("dualcore_tb.vcd");
      $dumpvars(0, dualcore_tb);
   end

   initial begin : data_load
      integer i, j, k;
      $display("##### Q data txt reading #####");
      qk_file = $fopen("qdata.txt", "r");
      for (i=0; i<total_cycle; i=i+1) begin
         for (j=0; j<pr; j=j+1) begin
            qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
            Q[i][j] = captured_data;
            //$display("%d\n", K[q][j]);
         end
      end

      $display("##### K data txt reading #####");
      qk_file = $fopen("kdata_core0.txt", "r");
      for (i=0; i<col; i=i+1) begin
         for (j=0; j<pr; j=j+1) begin
            qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
            K[i][j] = captured_data;
            //$display("##### %d\n", K[q][j]);
         end
      end

      qk_file = $fopen("kdata_core1.txt", "r");
      for (i=0; i<col; i=i+1) begin
         for (j=0; j<pr; j=j+1) begin
            qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
            K[i + 8][j] = captured_data;
            //$display("##### %d\n", K[q][j]);
         end
      end

      $display("##### V data txt reading #####");
      qk_file = $fopen("vdata.txt", "r");
      for (i=0; i<total_cycle; i=i+1) begin
         for (j=0; j<pr; j=j+1) begin
            qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
            V[i][j] = captured_data;
            //$display("%d\n", K[q][j]);
         end
      end

      $display("##### N data txt reading #####");
      qk_file = $fopen("ndata_core0.txt", "r");
      for (i=0; i<col; i=i+1) begin
         for (j=0; j<pr; j=j+1) begin
            qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
            N[i][j] = captured_data;
            //$display("##### %d\n", K[q][j]);
         end
      end

      qk_file = $fopen("ndata_core1.txt", "r");
      for (i=0; i<col; i=i+1) begin
         for (j=0; j<pr; j=j+1) begin
            qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
            N[i + 8][j] = captured_data;
            //$display("##### %d\n", K[q][j]);
         end
      end

      $display("##### Estimated multiplication result #####");

      for (i=0; i<total_cycle; i=i+1) begin
         for (j=0; j<col; j=j+1) begin
            result[i][j] = 0;
         end
      end

      for (i=0; i<total_cycle; i=i+1) begin
         for (j=0; j<col; j=j+1) begin
            for (k=0; k<pr; k=k+1) begin
               result[i][j] = result[i][j] + Q[i][k] * K[j][k];
            end

            result_col = result[i][j];
            result_array = {result_array[bw_psum * (col - 1) - 1 : 0], result_col};
         end

         //$display("%d %d %d %d %d %d %d %d", result[t][0], result[t][1], result[t][2], result[t][3], result[t][4], result[t][5], result[t][6], result[t][7]);
         $display("prd @cycle%2d: %40h", i, result_array);
      end

      data_init_done = 1;
   end

   //------------------------------------------CORE 0------------------------------------------//
   initial begin : core1_execute
      integer i, j, k;
      wait (data_init_done == 1);

      repeat (10) @(posedge clk1);
      #1 rst1 = 0; 
      @(posedge clk1);
      #1 norm_en = 0;

      $display("##### Qmem writing core0 #####");
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 qmem_wr_core1 = 1;  if (i>0) qkmem_add_core1 = qkmem_add_core1 + 1; 
         for (j = 0; j < pr; j = j + 1) begin
            mem_in_core1[bw * j +: bw] = Q[i][j];
         end
      end

      @(posedge clk1);
      #1 qmem_wr_core1 = 0; qkmem_add_core1 = 0;

      $display("##### Kmem writing core0 #####");
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 kmem_wr_core1 = 1;  if (i>0) qkmem_add_core1 = qkmem_add_core1 + 1; 
         for (j = 0; j < pr; j = j + 1) begin
            mem_in_core1[bw * j +: bw] = K[i][j];
         end
      end

      @(posedge clk1);
      #1 kmem_wr_core1 = 0; qkmem_add_core1 = 0;

      // repeat (2) @(posedge clk1);

      $display("##### K data loading to core0 #####");
      for (i = 0; i < col + 1; i = i + 1) begin
         @(posedge clk1);
         #1 load_core1 = 1;
         if (i == 1) kmem_rd_core1 = 1;
         if (i > 1)  qkmem_add_core1 = qkmem_add_core1 + 1; 
      end

      @(posedge clk1);
      #1 kmem_rd_core1 = 0; qkmem_add_core1 = 0;

      @(posedge clk1);
      #1 load_core1 = 0;

      repeat (10) @(posedge clk1);

      $display("##### core0 execute #####");

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 execute_core1 = 1; qmem_rd_core1 = 1;
         if (i > 0) qkmem_add_core1 = qkmem_add_core1 + 1;
      end

      @(posedge clk1);
      #1 qmem_rd_core1 = 0; qkmem_add_core1 = 0; execute_core1 = 0;

      repeat (10) @(posedge clk1);

      $display("##### move core0 ofifo to core0 pmem #####");

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 ofifo_rd_core1 = 1; pmem_wr_core1 = 1; 
         if (i > 0) pmem_add_core1 = pmem_add_core1 + 1;
      end

      @(posedge clk1);
      #1 pmem_wr_core1 = 0; pmem_add_core1 = 0; ofifo_rd_core1 = 0;

      repeat (10) @(posedge clk1);
      core0_exec_done = 1;

      wait (norm_start == 1);
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 pmem_rd_core1 = 1; if (i > 0) pmem_add_core1 = pmem_add_core1 + 1; 
         @(posedge clk1) #1;
         s_valid1 = 1;
         @(posedge clk1) #1;
         s_valid1 = 0;
         wait (norm_valid == 1);
         wait (norm_valid == 0);
      end

      @(posedge clk1);
      #1 pmem_wr_core1 = 0; pmem_add_core1 = 0; ofifo_rd_core1 = 0;

      repeat (10) @(posedge clk1);

      // 8bit x 4bit MULTIPLICATION

      $display("##### Qmem writing core0 (V) #####");
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 qmem_wr_core1 = 1;  if (i>0) qkmem_add_core1 = qkmem_add_core1 + 1; 
         for (j = 0; j < pr; j = j + 1) begin
            mem_in_core1[bw * j +: bw] = V[i][j];
         end
      end

      @(posedge clk1);
      #1 qmem_wr_core1 = 0; qkmem_add_core1 = 0;

      $display("##### Kmem writing core0 (N) #####");
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 kmem_wr_core1 = 1;  if (i>0) qkmem_add_core1 = qkmem_add_core1 + 1; 
         for (j = 0; j < pr; j = j + 1) begin
            mem_in_core1[bw * j +: bw] = N[i][j];
         end
      end

      @(posedge clk1);
      #1 kmem_wr_core1 = 0; qkmem_add_core1 = 0;

      // repeat (2) @(posedge clk1);

      $display("##### N data loading to core0 #####");
      for (i = 0; i < col + 1; i = i + 1) begin
         @(posedge clk1);
         #1 load_core1 = 1;
         if (i == 1) kmem_rd_core1 = 1;
         if (i > 1)  qkmem_add_core1 = qkmem_add_core1 + 1; 
      end

      @(posedge clk1);
      #1 kmem_rd_core1 = 0; qkmem_add_core1 = 0;

      @(posedge clk1);
      #1 load_core1 = 0;

      repeat (10) @(posedge clk1);

      $display("##### core0 execute #####");

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 execute_core1 = 1; qmem_rd_core1 = 1;
         if (i > 0) qkmem_add_core1 = qkmem_add_core1 + 1;
      end

      @(posedge clk1);
      #1 qmem_rd_core1 = 0; qkmem_add_core1 = 0; execute_core1 = 0;

      repeat (10) @(posedge clk1);

      $display("##### move core0 ofifo to core0 pmem #####");

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 ofifo_rd_core1 = 1; pmem_wr_core1 = 1; 
         if (i > 0) pmem_add_core1 = pmem_add_core1 + 1;
      end

      @(posedge clk1);
      #1 pmem_wr_core1 = 0; pmem_add_core1 = 0; ofifo_rd_core1 = 0;

      repeat (10) @(posedge clk1);

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 pmem_rd_core1 = 1;  if (i > 0) pmem_add_core1 = pmem_add_core1 + 1; 
         if (i > 0) begin
            for (j = 0; j < col / 2; j = j + 2) begin
               $display("8bit x 4bit %d product core 1: %x, %x, %x", i, out_core1, out_core1[bw_psum * (j + 1) +: bw_psum] << 4, out_core1[bw_psum * (j) +: bw_psum]);
               core0_8x4_mult_prod[bw_mode2_psum * (j / 2) +: bw_mode2_psum] = (out_core1[bw_psum * (j + 1) +: bw_psum] << 4) + out_core1[bw_psum * (j) +: bw_psum];
            end
               $display("%x\n", core0_8x4_mult_prod);
         end
      end

      @(posedge clk1);
      #1 pmem_rd_core1 = 0; pmem_add_core1 = 0;

      $finish;
   end
   //------------------------------------------------------------------------------------------//
   
   //------------------------------------------CORE 1------------------------------------------//
   initial begin : core2_execute
      integer i, j, k;
      wait (data_init_done == 1);

      repeat (10) @(posedge clk2);
      #1 rst2 = 0;

      $display("##### Qmem writing core1 #####");
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 qmem_wr_core2 = 1;  if (i>0) qkmem_add_core2 = qkmem_add_core2 + 1; 
         for (j = 0; j < pr; j = j + 1) begin
            mem_in_core2[bw * j +: bw] = Q[i][j];
         end
      end

      @(posedge clk2);
      #1 qmem_wr_core2 = 0; qkmem_add_core2 = 0;

      $display("##### Kmem writing core1 #####");
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 kmem_wr_core2 = 1;  if (i>0) qkmem_add_core2 = qkmem_add_core2 + 1; 
         for (j = 0; j < pr; j = j + 1) begin
            mem_in_core2[bw * j +: bw] = K[i + 8][j];
         end
      end

      @(posedge clk2);
      #1 kmem_wr_core2 = 0; qkmem_add_core2 = 0;

      // repeat (2) @(posedge clk2);

      $display("##### K data loading to core1 #####");
      for (i = 0; i < col + 1; i = i + 1) begin
         @(posedge clk2);
         #1 load_core2 = 1;
         if (i == 1) kmem_rd_core2 = 1;
         if (i > 1)  qkmem_add_core2 = qkmem_add_core2 + 1; 
      end

      @(posedge clk2);
      #1 kmem_rd_core2 = 0; qkmem_add_core2 = 0;

      @(posedge clk2);
      #1 load_core2 = 0;

      repeat (10) @(posedge clk2);

      $display("##### core1 execute #####");

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 execute_core2 = 1; qmem_rd_core2 = 1;
         if (i > 0) qkmem_add_core2 = qkmem_add_core2 + 1;
      end

      @(posedge clk2);
      #1 qmem_rd_core2 = 0; qkmem_add_core2 = 0; execute_core2 = 0;

      repeat (10) @(posedge clk2);

      $display("##### move core1 ofifo to core1 pmem #####");

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 ofifo_rd_core2 = 1; pmem_wr_core2 = 1; 
         if (i > 0) pmem_add_core2 = pmem_add_core2 + 1;
      end

      @(posedge clk2);
      #1 pmem_wr_core2 = 0; pmem_add_core2 = 0; ofifo_rd_core2 = 0;

      repeat (10) @(posedge clk2);
      core1_exec_done = 1;

      wait(norm_start == 1);
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 pmem_rd_core2 = 1;  if (i > 0) pmem_add_core2 = pmem_add_core2 + 1; 
         @(posedge clk2) #1;
         s_valid2 = 1;
         @(posedge clk2) #1;
         s_valid2 = 0;
         wait (norm_valid == 1);
         wait (norm_valid == 0);
         //repeat(8) @(posedge clk2);
      end

      @(posedge clk2);
      #1 pmem_wr_core2 = 0; pmem_add_core2 = 0; ofifo_rd_core2 = 0;

      repeat (10) @(posedge clk2);

      // 8bit x 4bit MULTIPLICATION

      $display("##### Qmem writing core1 #####");
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 qmem_wr_core2 = 1;  if (i>0) qkmem_add_core2 = qkmem_add_core2 + 1; 
         for (j = 0; j < pr; j = j + 1) begin
            mem_in_core2[bw * j +: bw] = V[i][j];
         end
      end

      @(posedge clk2);
      #1 qmem_wr_core2 = 0; qkmem_add_core2 = 0;

      $display("##### Kmem writing core1 #####");
      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 kmem_wr_core2 = 1;  if (i>0) qkmem_add_core2 = qkmem_add_core2 + 1; 
         for (j = 0; j < pr; j = j + 1) begin
            mem_in_core2[bw * j +: bw] = N[i + 8][j];
         end
      end

      @(posedge clk2);
      #1 kmem_wr_core2 = 0; qkmem_add_core2 = 0;

      // repeat (2) @(posedge clk2);

      $display("##### K data loading to core1 #####");
      for (i = 0; i < col + 1; i = i + 1) begin
         @(posedge clk2);
         #1 load_core2 = 1;
         if (i == 1) kmem_rd_core2 = 1;
         if (i > 1)  qkmem_add_core2 = qkmem_add_core2 + 1; 
      end

      @(posedge clk2);
      #1 kmem_rd_core2 = 0; qkmem_add_core2 = 0;

      @(posedge clk2);
      #1 load_core2 = 0;

      repeat (10) @(posedge clk2);

      $display("##### core1 execute #####");

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 execute_core2 = 1; qmem_rd_core2 = 1;
         if (i > 0) qkmem_add_core2 = qkmem_add_core2 + 1;
      end

      @(posedge clk2);
      #1 qmem_rd_core2 = 0; qkmem_add_core2 = 0; execute_core2 = 0;

      repeat (10) @(posedge clk2);

      $display("##### move core1 ofifo to core1 pmem #####");

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 ofifo_rd_core2 = 1; pmem_wr_core2 = 1; 
         if (i > 0) pmem_add_core2 = pmem_add_core2 + 1;
      end

      @(posedge clk2);
      #1 pmem_wr_core2 = 0; pmem_add_core2 = 0; ofifo_rd_core2 = 0;

      repeat (10) @(posedge clk2);

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk2);
         #1 pmem_rd_core2 = 1;  if (i > 0) pmem_add_core2 = pmem_add_core2 + 1; 
         if (i > 0) begin
            for (j = 0; j < col / 2; j = j + 2) begin
               $display("8bit x 4bit %d product core 2: %x, %x, %x, %x; j = %d", i, out_core2, out_core2[bw_psum * (j + 1) +: bw_psum] << 4, out_core2[bw_psum * (j) +: bw_psum], (out_core2[bw_psum * (j + 1) +: bw_psum] << 4) + out_core2[bw_psum * (j) +: bw_psum], j);
               core1_8x4_mult_prod[bw_mode2_psum * (j / 2) +: bw_mode2_psum] = (out_core2[bw_psum * (j + 1) +: bw_psum] << 4) + out_core2[bw_psum * (j) +: bw_psum];
            end
               $display("%x\n", core1_8x4_mult_prod);
         end
      end

      @(posedge clk2);
      #1 pmem_rd_core2 = 0; pmem_add_core2 = 0;

      repeat (30) @(posedge clk2);
      $finish;
   end
   //------------------------------------------------------------------------------------------//

   //---------------------------------------NORMALIZATION--------------------------------------//
   initial begin : norm_compute
      wait (core0_exec_done == 1 && core1_exec_done == 1);
      norm_en = 1;
      norm_start = 1;
      repeat(20000) @(posedge clk1);
   end
   //------------------------------------------------------------------------------------------//


endmodule