// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 

`timescale 1ns/1ps

module fullchip_tb;

parameter total_cycle = 8;   // how many streamed Q vectors will be processed
parameter bw = 4;            // Q & K vector bit precision
parameter bw_psum = 2*bw+3;  // partial sum bit precision
parameter pr = 8;           // how many products added in each dot product 
parameter col = 8;           // how many dot product units are equipped

integer qk_file ; // file handler
integer qk_scan_file ; // file handler


integer  captured_data;
integer  weight [col*pr-1:0];
`define NULL 0




integer  K[col-1:0][pr-1:0];
integer  Q[total_cycle-1:0][pr-1:0];
integer  result[total_cycle-1:0][col-1:0];
integer  result_new_array[total_cycle-1:0][(col/2)-1:0];

//integer unsigned[pr-1:0]K[col-1:0];
//integer signed[pr-1:0]Q[col-1:0];
//integer unsigned[pr-1:0]result[col-1:0];
//integer unsigned[pr-1:0]K[col-1:0];

integer  sum[total_cycle-1:0];

integer i,j,k,t,p,q,s,u, m;



reg reset = 1;
reg clk = 0;
reg [pr*bw-1:0] mem_in; 
reg ofifo_rd = 0;
wire [16:0] inst; 
reg qmem_rd = 0;
reg qmem_wr = 0; 
reg kmem_rd = 0; 
reg kmem_wr = 0;
reg pmem_rd = 0; 
reg pmem_wr = 0; 
reg execute = 0;
reg load = 0;
reg [3:0] qkmem_add = 0;
reg [3:0] pmem_add = 0;
reg [21:0]result_temp;
reg mode;

assign inst[16] = ofifo_rd;
assign inst[15:12] = qkmem_add;
assign inst[11:8]  = pmem_add;
assign inst[7] = execute;
assign inst[6] = load;
assign inst[5] = qmem_rd;
assign inst[4] = qmem_wr;
assign inst[3] = kmem_rd;
assign inst[2] = kmem_wr;
assign inst[1] = pmem_rd;
assign inst[0] = pmem_wr;



reg [bw_psum-1:0] temp5b;
reg [bw_psum+3:0] temp_sum;
reg [bw_psum*col-1:0] temp16b;

reg [2*bw_psum -1:0] temp5b_new;
reg [bw_psum*col-1:0] temp16b_new;
reg [8*(bw_psum)-1:0]result_new;

wire [bw_psum*col-1:0] out;

fullchip #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) fullchip_instance (
      .reset(reset),
      .clk(clk), 
      .mem_in(mem_in), 
      .inst(inst),
      .mode(mode),
      .out(out)
);


initial begin 

  $dumpfile("fullchip_tb.vcd");
  $dumpvars(0,fullchip_tb);

mode =1 ; // 1 is 8 bit mode and 0 is 4 bits mode. 

///// Q data txt reading /////

$display("##### Q data txt reading #####");


  if ( mode == 0)
    qk_file = $fopen("qdata.txt", "r"); 
  else
    qk_file = $fopen("vdata.txt", "r"); 

  //// To get rid of first 3 lines in data file ////
  //qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  //qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  //qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  //qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);


  for (q=0; q<total_cycle; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
          Q[q][j] = captured_data;
          //$display("%d\n", Q[q][j]);
    end
  end
/////////////////////////////////




  for (q=0; q<2; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
  end




///// K data txt reading /////

$display("##### K data txt reading #####");

  for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
  end
  reset = 0;

  qk_file = $fopen("kdata.txt", "r");

  //// To get rid of first 4 lines in data file ////
  //qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  //qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  //qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  //qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);




  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
          K[q][j] = captured_data;
          //$display("##### %d\n", K[q][j]);
    end
  end
/////////////////////////////////

///// K data txt reading /////







/////////////// Estimated result printing /////////////////
if ( mode == 0)begin
// 4 bit Mode ( set mode = 0 initially)
$display("##### Estimated multiplication result #####");

  for (t=0; t<total_cycle; t=t+1) begin
     for (q=0; q<col; q=q+1) begin
       result[t][q] = 0;
     end
  end

  for (t=0; t<total_cycle; t=t+1) begin
     for (q=0; q<col; q=q+1) begin
         for (k=0; k<pr; k=k+1) begin
            result[t][q] = result[t][q] + Q[t][k] * K[q][k];
         end

         temp5b = result[t][q];
         temp16b = {temp16b[76:0], temp5b};
     end

     //$display("%d %d %d %d %d %d %d %d", result[t][0], result[t][1], result[t][2], result[t][3], result[t][4], result[t][5], result[t][6], result[t][7]);
     $display("prd @cycle%2d: %40h", t, temp16b);
  end
end
//////////////////////////////////////////////




/////////////// Estimated result printing /////////////////
// 8 bit Mode ( set mode = 1 initially)

if ( mode == 1) begin
result_new = 0;
$display("##### Estimated multiplication result #####");

  for (t=0; t<total_cycle; t=t+1) begin
     for (q=0; q<col; q=q+1) begin
       result[t][q] = 0;
     end
  end

  for (t=0; t<total_cycle; t=t+1) begin
     for (q=0; q<(col); q=q+1) begin
         for (k=0; k<pr; k=k+1) begin
            result[t][q] = result[t][q] + Q[t][k] * K[q][k];
         end
     end
     //$display("%h %h %h %h %h %h %h %h", result[t][0], result[t][1], result[t][2], result[t][3], result[t][4], result[t][5], result[t][6], result[t][7]);
     //$display("prd @cycle%2d: %40h", result[t][q]);
     
     for (q=0; q<(col); q=q+2) begin

          result_temp = result[t][q] + result[t][q+1]*16;
          result_new_array[t][q/2] = result_temp;
          //$display( "%x,%x,%x \n",result[t][q]*16, result[t][q+1], result_temp );
          result_new = {result_new[65:0], result_temp};
     end
    
    //$display("%h , %h , %h , %h ", result_new_array[t][0], result_new_array[t][1], result_new_array[t][2], result_new_array[t][3] );
    
    $display("prd @cycle%2d: %40h", t, result_new);
     
  end
//////////////////////////////////////////////
end


///// Qmem writing  /////

$display("##### Qmem writing  #####");

  for (q=0; q<total_cycle; q=q+1) begin

    #0.5 clk = 1'b0;  
    qmem_wr = 1;  if (q>0) qkmem_add = qkmem_add + 1; 
    
    mem_in[1*bw-1:0*bw] = Q[q][0];
    mem_in[2*bw-1:1*bw] = Q[q][1];
    mem_in[3*bw-1:2*bw] = Q[q][2];
    mem_in[4*bw-1:3*bw] = Q[q][3];
    mem_in[5*bw-1:4*bw] = Q[q][4];
    mem_in[6*bw-1:5*bw] = Q[q][5];
    mem_in[7*bw-1:6*bw] = Q[q][6];
    mem_in[8*bw-1:7*bw] = Q[q][7];
    mem_in[9*bw-1:8*bw] = Q[q][8];
    mem_in[10*bw-1:9*bw] = Q[q][9];
    mem_in[11*bw-1:10*bw] = Q[q][10];
    mem_in[12*bw-1:11*bw] = Q[q][11];
    mem_in[13*bw-1:12*bw] = Q[q][12];
    mem_in[14*bw-1:13*bw] = Q[q][13];
    mem_in[15*bw-1:14*bw] = Q[q][14];
    mem_in[16*bw-1:15*bw] = Q[q][15];

    #0.5 clk = 1'b1;  

  end


  #0.5 clk = 1'b0;  
  qmem_wr = 0; 
  qkmem_add = 0;
  #0.5 clk = 1'b1;  
///////////////////////////////////////////





///// Kmem writing  /////

$display("##### Kmem writing #####");

  for (q=0; q<col; q=q+1) begin

    #0.5 clk = 1'b0;  
    kmem_wr = 1; if (q>0) qkmem_add = qkmem_add + 1; 
    
    mem_in[1*bw-1:0*bw] = K[q][0];
    mem_in[2*bw-1:1*bw] = K[q][1];
    mem_in[3*bw-1:2*bw] = K[q][2];
    mem_in[4*bw-1:3*bw] = K[q][3];
    mem_in[5*bw-1:4*bw] = K[q][4];
    mem_in[6*bw-1:5*bw] = K[q][5];
    mem_in[7*bw-1:6*bw] = K[q][6];
    mem_in[8*bw-1:7*bw] = K[q][7];
    mem_in[9*bw-1:8*bw] = K[q][8];
    mem_in[10*bw-1:9*bw] = K[q][9];
    mem_in[11*bw-1:10*bw] = K[q][10];
    mem_in[12*bw-1:11*bw] = K[q][11];
    mem_in[13*bw-1:12*bw] = K[q][12];
    mem_in[14*bw-1:13*bw] = K[q][13];
    mem_in[15*bw-1:14*bw] = K[q][14];
    mem_in[16*bw-1:15*bw] = K[q][15];

    #0.5 clk = 1'b1;  

  end

  #0.5 clk = 1'b0;  
  kmem_wr = 0;  
  qkmem_add = 0;
  #0.5 clk = 1'b1;  
///////////////////////////////////////////



  for (q=0; q<2; q=q+1) begin
    #0.5 clk = 1'b0;  
    #0.5 clk = 1'b1;   
  end




/////  K data loading  /////
$display("##### K data loading to processor #####");

  for (q=0; q<col+2; q=q+1) begin
    #0.5 clk = 1'b0;  
    load = 1; 
    if (q==2) kmem_rd = 1;
    if (q>2) begin
       qkmem_add = qkmem_add + 1;
    end

    #0.5 clk = 1'b1;  
  end

  #0.5 clk = 1'b0;  
  kmem_rd = 0; qkmem_add = 0;
  #0.5 clk = 1'b1;  

  #0.5 clk = 1'b0;  
  load = 0; 
  #0.5 clk = 1'b1;  

///////////////////////////////////////////

 for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
 end





///// execution  /////
$display("##### execute #####");

  for (q=0; q<total_cycle+1; q=q+1) begin
    #0.5 clk = 1'b0;  
    execute = 1; 
    qmem_rd = 1;

    if (q>1) begin
       qkmem_add = qkmem_add + 1;
    end

    #0.5 clk = 1'b1;  
  end

  #0.5 clk = 1'b0;  
  qmem_rd = 0; qkmem_add = 0; execute = 0;
  #0.5 clk = 1'b1;  


///////////////////////////////////////////

 for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
 end


////////////// output fifo rd and wb to psum mem ///////////////////

$display("##### move ofifo to pmem #####");

  for (q=0; q<total_cycle; q=q+1) begin
    #0.5 clk = 1'b0;  
    ofifo_rd = 1; 
    pmem_wr = 1; 

    if (q>0) begin
       pmem_add = pmem_add + 1;
    end
    #0.5 clk = 1'b1;  
  end

  #0.5 clk = 1'b0;  
  pmem_wr = 0; pmem_add = 0; ofifo_rd = 0;
  #0.5 clk = 1'b1;  

///////////////////////////////////////////


////////////// output psum mem ///////////////////

$display("##### read from memory  #####");

  for (q=0; q<total_cycle; q=q+1) begin
    #0.5 clk = 1'b0;  
    ofifo_rd = 0; 
    pmem_wr = 0; 
    pmem_rd = 1; 

    if (q>0) begin
       pmem_add = pmem_add + 1;
    end

    #0.5 clk = 1'b1;  
  end

  #0.5 clk = 1'b0;  
  pmem_wr = 0; pmem_add = 0; ofifo_rd = 0;pmem_rd = 0; 
  #0.5 clk = 1'b1;  
///////////////////////////////////////////

  #10 $finish;


end

endmodule




