`timescale 1ns/1ps

module pipelined_single_core_tb;
   localparam total_cycle = 32;
   localparam bw = 4;
   localparam pr = 8;
   localparam col = 8;
   localparam bw_psum = 2 * bw + $clog2(pr);

   localparam sram_depth = 16;

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
   reg clk1 = 0;
   reg [pr*bw-1:0] mem_in_core1;
   wire [pr*bw-1:0] mem_in_core1_w;
   wire [25:0] inst_core1; 
   reg ofifo_rd_core1 = 0;
   reg qmem_rd_core1 = 0;
   reg qmem_wr_core1 = 0; 
   reg kmem_rd_core1 = 0; 
   reg kmem_wr_core1 = 0;
   reg pmem_rd_core1 = 0; 
   reg pmem_wr_core1 = 0; 
   reg execute_core1 = 0;
   reg load_core1 = 0;
   wire qmem_buffer_sel_core0;
   reg qmem_wr_buffer_sel_core0 = 0;
   reg [3:0] qmem_wr_addr_core0 = 0;
   reg [3:0] qmem_rd_addr_core0 = 0;
   reg [3:0] kmem_addr_core0 = 0;
   reg [3:0] pmem_add_core1  = 0;
   wire [bw_psum*(col)-1:0] out_core1 = 0;

   reg [bw_psum - 1 : 0] result_col;
   reg [bw_psum * col - 1 : 0] result_array;

   reg data_init_done  = 0;
   reg core0_load_k_done = 0;
   reg core0_exec_start = 0;
   reg core0_exec_done = 0;

   assign qmem_buffer_sel_core0 = ~qmem_wr_buffer_sel_core0;
   //assign inst_core1[25] = qmem_buffer_sel_core0;
   assign inst_core1[25] = ~qmem_wr_buffer_sel_core0;
   assign inst_core1[24:21] = qmem_wr_addr_core0;
   assign inst_core1[20:17] = qmem_rd_addr_core0;
   assign inst_core1[16:13] = kmem_addr_core0;
   assign inst_core1[12] = ofifo_rd_core1;
   assign inst_core1[11:8]  = pmem_add_core1;
   assign inst_core1[7] = execute_core1;
   assign inst_core1[6] = load_core1;
   assign inst_core1[5] = qmem_rd_core1;
   assign inst_core1[4] = qmem_wr_core1;
   assign inst_core1[3] = kmem_rd_core1;
   assign inst_core1[2] = kmem_wr_core1;
   assign inst_core1[1] = pmem_rd_core1;
   assign inst_core1[0] = pmem_wr_core1;

   fullchip #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) dut (
      .reset(rst1),
      .clk(clk1), 
      .mem_in(mem_in_core1), 
      .inst(inst_core1),
      .out(out_core1));

   always #10 clk1 = ~clk1;

   initial begin 
      $dumpfile("dualcore_tb.vcd");
      $dumpvars(0, pipelined_single_core_tb);
   end

   initial begin : data_load
      integer i, j, k;
      $display("##### Q data txt reading #####");
      qk_file = $fopen("../qdata.txt", "r");
      for (i=0; i<total_cycle; i=i+1) begin
         for (j=0; j<pr; j=j+1) begin
            qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
            Q[i][j] = captured_data;
            //$display("%d\n", K[q][j]);
         end
      end

      $display("##### K data txt reading #####");
      qk_file = $fopen("../kdata.txt", "r");
      for (i=0; i<col; i=i+1) begin
         for (j=0; j<pr; j=j+1) begin
            qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
            K[i][j] = captured_data;
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
   initial begin : core0_load_k
      integer i, j, k, num_batch;
      wait (data_init_done == 1);

      repeat (10) @(posedge clk1);
      #1 rst1 = 0;

      $display("##### Kmem writing core0 #####");
      for (i = 0; i < col; i = i + 1) begin
         @(posedge clk1);
         #1 kmem_wr_core1 = 1;  if (i>0) kmem_addr_core0 = kmem_addr_core0 + 1; 
         for (j = 0; j < pr; j = j + 1) begin
            mem_in_core1[bw * j +: bw] = K[i][j];
         end
      end

      @(posedge clk1);
      #1 kmem_wr_core1 = 0; kmem_addr_core0 = 0;

      //repeat (2) @(posedge clk1);

      for (i = 0; i < col + 2; i = i + 1) begin
         @(posedge clk1);
         #1 load_core1 = 1;
         if (i == 2) kmem_rd_core1 = 1;
         if (i > 2)  kmem_addr_core0 = kmem_addr_core0 + 1; 
      end

      @(posedge clk1);
      #1 kmem_rd_core1 = 0; kmem_addr_core0 = 0;

      @(posedge clk1);
      #1 load_core1 = 0;

      core0_load_k_done = 1;
   end
   
   initial begin : core0_load_q
      integer i, j, k, num_batch;
      wait (core0_load_k_done == 1);

      num_batch = total_cycle / sram_depth;

      for (i = 0; i < num_batch; i = i + 1) begin
         for (j = 0; j < sram_depth; j = j + 1) begin
            @(posedge clk1);
            /*if (j == 0) begin
               if(i > 0) #1 core0_exec_start = 1; 
               #1 qmem_wr_addr_core0 = 0;
               qmem_wr_buffer_sel_core0 = ~qmem_wr_buffer_sel_core0;
               if (i == 1) repeat (1) @(posedge clk1);
            end*/
            #1 qmem_wr_core1 = 1;  if (j>0) qmem_wr_addr_core0 = qmem_wr_addr_core0 + 1; 
            for (k = 0; k < pr; k = k + 1) begin
               mem_in_core1[bw * k +: bw] = Q[(i * sram_depth) + j][k];
            end
            //$display("j = %d, mem_in_core1 = %x ", j, mem_in_core1); 
         end
         @(posedge clk1);
         #1 qmem_wr_addr_core0 = 0;
         qmem_wr_core1 = 0;
         @(posedge clk1);
         #1 core0_exec_start = 1;
         qmem_wr_buffer_sel_core0 = ~qmem_wr_buffer_sel_core0;
      end

   end
   
   initial begin : core0_execute
      integer i, j, k;
      wait (core0_exec_start == 1);

      $display("##### core0 execute #####");
      for (j = 0; j < 2; j = j + 1) begin
         for (i = 0; i < 16; i = i + 1) begin
            @(posedge clk1);
            #1 execute_core1 = 1; qmem_rd_core1 = 1;
            if (i > 0) qmem_rd_addr_core0 = qmem_rd_addr_core0 + 1;
         end

         @(posedge clk1);
         #1 qmem_rd_core1 = 0; execute_core1 = 0;
         if (j == 2) begin
            qmem_rd_addr_core0 = 0;
         end

         repeat (10) @(posedge clk1);

         $display("##### move core0 ofifo to core0 pmem #####");

         for (i = 0; i < total_cycle; i = i + 1) begin
            @(posedge clk1);
            #1 ofifo_rd_core1 = 1; pmem_wr_core1 = 1; 
            if (i > 0) pmem_add_core1 = pmem_add_core1 + 1;
         end

         @(posedge clk1);
         #1 pmem_wr_core1 = 0; ofifo_rd_core1 = 0;
            pmem_add_core1 = 0;
            $finish; // Add wait signal to continue with the next 16 batches
      end    

      //repeat (10) @(posedge clk1);
   end

   /*initial begin : core0_rd_ofifo
      integer i, j, k;
      wait(pipelined_single_core_tb.dut.core_instance.ofifo_inst.o_valid == 1);

      for (i = 0; i < total_cycle; i = i + 1) begin
         @(posedge clk1);
         #1 ofifo_rd_core1 = 1; pmem_wr_core1 = 1; 
         if (i > 0) pmem_add_core1 = pmem_add_core1 + 1;
      end

   end*/
   //------------------------------------------------------------------------------------------//
   
endmodule