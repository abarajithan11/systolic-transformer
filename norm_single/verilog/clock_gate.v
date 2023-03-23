module clk_gate(
   input clk,
   input rst,
   input gate,
   output gclk
);
   reg gate_en;

   always @(negedge clk) begin
      gate_en <= gate;
   end

   assign gclk = clk && gate_en;
endmodule