module synchronizer #(
   parameter C_NUM_LEVELS = 2
) (
   input  i_clk, i_rst,
   input  i_data,
   output o_data
);
   reg q_sync_regs [C_NUM_LEVELS - 1 : 0];

   genvar i;

   assign o_data = q_sync_regs[C_NUM_LEVELS - 1];

   for (i = 0; i < C_NUM_LEVELS; i = i + 1) begin
      always@(posedge i_clk) begin
         if (i_rst)
            q_sync_regs[i] <= 0;
         else
            if (i == 0)
               q_sync_regs[i] <= i_data;
            else
               q_sync_regs[i] <= q_sync_regs[i - 1];
      end
   end
endmodule