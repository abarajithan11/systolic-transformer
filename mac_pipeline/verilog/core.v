// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module core (clk, mem_in, out, inst, reset, mode);

parameter col = 8;
parameter bw = 4;
parameter bw_psum = 2*bw+3;
parameter pr = 8;

//output [bw_psum+3:0] sum_out;
output [bw_psum*col-1:0] out;
wire   [bw_psum*col-1:0] pmem_out;
input  [pr*bw-1:0] mem_in;
input  clk;
input  [16:0] inst; 
input  reset;
input mode;
wire  [pr*bw-1:0] mac_in;
wire  [pr*bw-1:0] kmem_out;
wire  [pr*bw-1:0] qmem_out;
wire  [bw_psum*col-1:0] pmem_in;
wire  [bw_psum*col-1:0] fifo_out;
wire  [bw_psum*col-1:0] sfp_out;
wire  [bw_psum*col-1:0] array_out;
wire  [col-1:0] fifo_wr;
wire  ofifo_rd;
wire [3:0] qkmem_add;
wire [3:0] pmem_add;
wire [((bw_psum + 4)*(col/2))-1:0]pre_mux_in1;
wire [bw_psum*col-1:0]mux_out;


wire  qmem_rd;
wire  qmem_wr; 
wire  kmem_rd;
wire  kmem_wr; 
wire  pmem_rd;
wire  pmem_wr; 

assign ofifo_rd = inst[16];
assign qkmem_add = inst[15:12];
assign pmem_add = inst[11:8];

assign qmem_rd = inst[5];
assign qmem_wr = inst[4];
assign kmem_rd = inst[3];
assign kmem_wr = inst[2];
assign pmem_rd = inst[1];
assign pmem_wr = inst[0];

assign mac_in  = inst[6] ? kmem_out : qmem_out;
assign pmem_in = mux_out;


assign out = pmem_out;

genvar i;

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



//(2*bw_psum-(bw_psum + 4);
for (i=1; i < col ; i=i+2) begin : mux_idx
   
   assign pre_mux_in1[ (bw_psum+4)*((i+1)/2) -1 : (bw_psum+4)*(((i+1)/2)-1) ] = { fifo_out[(i)*bw_psum-1: (i-1)*bw_psum ], 4'b0000 } + { { (4){ fifo_out[(i+1)*bw_psum-1] } },fifo_out[(i+1)*bw_psum-1: (i)*bw_psum ]};

   fifo_mux_2_1 #( .bw(2*bw_psum), .simd(1) )  fifo_mux_2_1_inst(
        .in0(fifo_out[(2*((i+1)/2))*bw_psum-1: 2*(((i+1)/2)-1)*bw_psum ]),
        .in1({{(2*bw_psum-(bw_psum + 4)){ pre_mux_in1[(bw_psum+4)*((i+1)/2)-1] }},pre_mux_in1[(bw_psum+4)*((i+1)/2)-1 : (bw_psum+4)*(((i+1)/2)-1)]}),
        .sel(mode),
        .out(mux_out[(2*((i+1)/2))*bw_psum-1: 2*(((i+1)/2)-1)*bw_psum ])
   );
end 

/*
for (i=1; i < col ; i=i+2) begin : mux_idx
   
   assign pre_mux_in1[ (bw_psum+4)*((i+1)/2) -1 : (bw_psum+4)*(((i+1)/2)-1) ] = { fifo_out[(i)*bw_psum-1: (i-1)*bw_psum ], 4'b0000 } + { { 4'b000 },fifo_out[(i+1)*bw_psum-1: (i)*bw_psum ]};

   fifo_mux_2_1 #( .bw(2*bw_psum), .simd(1) )  fifo_mux_2_1_inst(
        .in0(fifo_out[(2*((i+1)/2))*bw_psum-1: 2*(((i+1)/2)-1)*bw_psum ]),
        .in1({7'b0000000,pre_mux_in1[(bw_psum+4)*((i+1)/2)-1 : (bw_psum+4)*(((i+1)/2)-1)]}),
        .sel(mode),
        .out(mux_out[(2*((i+1)/2))*bw_psum-1: 2*(((i+1)/2)-1)*bw_psum ])
   );
end 
*/
sram_w16 #(.sram_bit(pr*bw)) qmem_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(qmem_out),
        .CEN(!(qmem_rd||qmem_wr)),
        .WEN(!qmem_wr), 
        .A(qkmem_add)
);

sram_w16 #(.sram_bit(pr*bw)) kmem_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(kmem_out),
        .CEN(!(kmem_rd||kmem_wr)),
        .WEN(!kmem_wr), 
        .A(qkmem_add)
);

sram_w16 #(.sram_bit(col*bw_psum)) psum_mem_instance (
        .CLK(clk),
        .D(pmem_in),
        .Q(pmem_out),
        .CEN(!(pmem_rd||pmem_wr)),
        .WEN(!pmem_wr), 
        .A(pmem_add)
);



  //////////// For printing purpose ////////////
  always @(posedge clk) begin
      if(pmem_wr)
         $display("Memory write to PSUM mem add %x %x ", pmem_add, pmem_in); 
  end
  



endmodule
