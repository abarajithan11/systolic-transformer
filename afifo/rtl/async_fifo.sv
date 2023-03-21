module afifo #(
   parameter C_DEPTH = 64,
   parameter C_WIDTH = 32
)(
   input  i_wclk, i_wrst,

   input  i_wen,
   input  [C_WIDTH - 1 : 0] i_wr_data,
   output o_full,

   input  i_rclk, i_rrst,

   input  i_ren,
   output o_empty,
   output [C_WIDTH - 1 : 0] o_rd_data
);

localparam COUNTER_WIDTH = (C_DEPTH == 1) ? 1 
                                          : $clog2(C_DEPTH) + 1;


function [COUNTER_WIDTH - 1 : 0] bin2gray;
   input [COUNTER_WIDTH - 1 : 0] bin_ip;
   begin
      bin2gray = (bin_ip >> 1) ^ bin_ip;
   end
endfunction

function [COUNTER_WIDTH - 1 : 0] gray2bin;
   input [COUNTER_WIDTH - 1 : 0] gray_ip;
   integer i;
   begin
      for (i = 0; i < COUNTER_WIDTH; i = i + 1) begin
         gray2bin[i] = ^(gray_ip >> i);
      end
   end
endfunction

reg [C_WIDTH - 1 : 0] fifo_mem_arr [C_DEPTH - 1 : 0];

reg [COUNTER_WIDTH - 1 : 0] wr_addr, rd_addr;

wire [COUNTER_WIDTH - 1 : 0] wr_ptr_gray, rd_ptr_gray;
wire [COUNTER_WIDTH - 1 : 0] wr_ptr_gray_synced;
wire [COUNTER_WIDTH - 1 : 0] rd_ptr_gray_synced;

genvar i;

assign wr_ptr_gray = bin2gray(wr_addr);
assign rd_ptr_gray = bin2gray(rd_addr);


//---------Initialize Synchronizers-------------
for (i = 0; i < COUNTER_WIDTH; i = i + 1) begin
   synchronizer wr_ptr_gray_synchronizer (
      .i_clk(i_rclk),
      .i_rst(i_rrst),
      .i_data(wr_ptr_gray[i]),
      .o_data(wr_ptr_gray_synced[i])
   );
end

for (i = 0; i < COUNTER_WIDTH; i = i + 1) begin
   synchronizer rd_ptr_synchronizer (
      .i_clk(i_wclk),
      .i_rst(i_wrst),
      .i_data(rd_ptr_gray[i]),
      .o_data(rd_ptr_gray_synced[i])
   );
end
//----------------------------------------------

//--------Read Pointer and Empty Logic----------
always @(posedge i_rclk) begin
   if (i_rrst) begin
      rd_addr <= 'd0;
   end 
   else begin
      if (i_ren && !o_empty) begin
         rd_addr <= rd_addr + 1;   
      end
   end
end

assign o_empty = rd_ptr_gray == wr_ptr_gray_synced;
//----------------------------------------------

//--------Write Pointer and Full Logic----------
always @(posedge i_wclk) begin
   if (i_wrst) begin
      wr_addr <= 'd0;
   end 
   else begin
      if (i_wen && !o_full) begin
         wr_addr <= wr_addr + 1;   
      end
   end
end

generate
   if (C_DEPTH == 1) begin
      assign o_full =  wr_ptr_gray[0] != rd_ptr_gray_synced[0];
   end
   else if (C_DEPTH > 2) begin
      assign o_full = (wr_ptr_gray[COUNTER_WIDTH - 1] != rd_ptr_gray_synced[COUNTER_WIDTH - 1]) && (wr_ptr_gray[COUNTER_WIDTH - 2] == ~rd_ptr_gray_synced[COUNTER_WIDTH - 2]) && (wr_ptr_gray[COUNTER_WIDTH - 3 : 0] == rd_ptr_gray_synced[COUNTER_WIDTH - 3 : 0]);   
   end
endgenerate
//----------------------------------------------

//-------------FIFO MEMORY FUNCTIONS------------
// Write
always @(posedge i_wclk) begin
   if (i_wen && !o_full) begin
      if (C_DEPTH == 1)
         fifo_mem_arr[0] <= i_wr_data;
      else
         fifo_mem_arr[wr_addr] <= i_wr_data;
   end
end

// Read
generate
   if (C_DEPTH == 1)
      assign o_rd_data = fifo_mem_arr[0];
   else
      assign o_rd_data = fifo_mem_arr[rd_addr];
endgenerate
//----------------------------------------------

endmodule