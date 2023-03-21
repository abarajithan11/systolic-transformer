// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module core (clk, mem_in, out, inst, reset);

parameter col = 8;
parameter bw = 4;
parameter bw_psum = 2*bw+3;
parameter pr = 8;

//output [bw_psum+3:0] sum_out;
output [bw_psum*col-1:0] out;
wire   [bw_psum*col-1:0] pmem_out;
input  [pr*bw-1:0] mem_in;
input  clk;
input  [25:0] inst; 
input  reset;

wire  [pr*bw-1:0] mac_in;
wire  [pr*bw-1:0] kmem_out;
wire  [pr*bw-1:0] qmem_out;
wire  [pr*bw-1:0] qmem0_out;
wire  [pr*bw-1:0] qmem1_out;
wire  [bw_psum*col-1:0] pmem_in;
wire  [bw_psum*col-1:0] fifo_out;
wire  [bw_psum*col-1:0] sfp_out;
wire  [bw_psum*col-1:0] array_out;
wire  [col-1:0] fifo_wr;
wire  ofifo_rd;

wire [3:0] qmem_wr_addr;
wire [3:0] qmem_rd_addr;
wire [3:0] qmem0_addr;
wire [3:0] qmem1_addr;
wire [3:0] kmem_addr;
wire [3:0] pmem_add;

wire qmem_buffer_sel;
wire qmem0_cen;
wire qmem1_cen;

wire  qmem0_wen;
wire  qmem1_wen;
wire  qmem_rd;
wire  qmem_wr; 
wire  kmem_rd;
wire  kmem_wr; 
wire  pmem_rd;
wire  pmem_wr; 

assign qmem_buffer_sel = inst[25];
assign qmem_wr_addr = inst[24:21];
assign qmem_rd_addr = inst[20:17];
assign kmem_addr = inst[16:13]; 
assign ofifo_rd = inst[12];
assign pmem_add = inst[11:8];

assign qmem_rd = inst[5];
assign qmem_wr = inst[4];
assign kmem_rd = inst[3];
assign kmem_wr = inst[2];
assign pmem_rd = inst[1];
assign pmem_wr = inst[0];

assign mac_in  = inst[6] ? kmem_out : qmem_out;
assign pmem_in = fifo_out;

assign qmem0_cen = ~qmem_buffer_sel && (!(qmem_rd||qmem_wr)) ? 1 : 0;
assign qmem1_cen =  qmem_buffer_sel && (!(qmem_rd||qmem_wr)) ? 1 : 0;

assign out = pmem_out;

mac_array #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) mac_array_instance (
        .in(mac_in), 
        .clk(clk), 
        .reset(reset), 
        .inst(inst[7:6]),     
        .fifo_wr(fifo_wr),     
	.out(array_out)
);

ofifo #(.bw(bw_psum), .col(col))  ofifo_inst (
        .reset(reset),
        .clk(clk),
        .in(array_out),
        .wr(fifo_wr),
        .rd(ofifo_rd),
        .o_valid(fifo_valid),
        .out(fifo_out)
);

assign qmem_out = ~qmem_buffer_sel ? qmem0_out : qmem1_out;
assign qmem0_addr = ~qmem_buffer_sel ? qmem_rd_addr : qmem_wr_addr;
assign qmem0_wen = qmem_buffer_sel && qmem_wr ? 0 : 1;
sram_w16 #(.sram_bit(pr*bw)) qmem0_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(qmem0_out),
        .CEN(qmem0_cen),
        .WEN(qmem0_wen), 
        .A(qmem0_addr)
);

assign qmem1_addr = qmem_buffer_sel ? qmem_rd_addr : qmem_wr_addr;
assign qmem1_wen = ~qmem_buffer_sel && qmem_wr ? 0 : 1;
sram_w16 #(.sram_bit(pr*bw)) qmem1_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(qmem1_out),
        .CEN(qmem1_cen),
        .WEN(qmem1_wen), 
        .A(qmem1_addr)
);

sram_w16 #(.sram_bit(pr*bw)) kmem_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(kmem_out),
        .CEN(!(kmem_rd||kmem_wr)),
        .WEN(!kmem_wr), 
        .A(kmem_addr)
);

sram_w16 #(.sram_bit(col*bw_psum)) psum_mem_instance (
        .CLK(clk),
        .D(pmem_in),
        .Q(pmem_out),
        .CEN(!(pmem_rd||pmem_wr)),
        .WEN(!pmem_wr), 
        .A(pmem_add)
);

/*assign pmem_out = ~pmem_buffer_sel ? pmem0_out : pmem1_out;
assign pmem0_addr = ~pmem_buffer_sel ? pmem_rd_addr : pmem_wr_addr;
assign pmem0_wen = pmem_buffer_sel && pmem_wr ? 0 : 1;
sram_w16 #(.sram_bit(pr*bw)) psum_mem0_instance (
        .CLK(clk),
        .D(pmem_in),
        .Q(pmem0_out),
        .CEN(pmem0_cen),
        .WEN(pmem0_wen), 
        .A(pmem0_addr)
);

assign pmem1_addr = pmem_buffer_sel ? pmem_rd_addr : pmem_wr_addr;
assign pmem1_wen = ~pmem_buffer_sel && pmem_wr ? 0 : 1;
sram_w16 #(.sram_bit(pr*bw)) psum_mem1_instance (
        .CLK(clk),
        .D(pmem_in),
        .Q(pmem1_out),
        .CEN(pmem1_cen),
        .WEN(pmem1_wen), 
        .A(pmem1_addr)
);*/


  //////////// For printing purpose ////////////
  always @(posedge clk) begin
      if(pmem_wr)
         $display("Memory write to PSUM mem add %x %x ", pmem_add, pmem_in); 
  end



endmodule
