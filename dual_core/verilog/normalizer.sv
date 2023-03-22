module normalizer #(
  parameter BW_PSUM = 16,
            COL = 8,
            W_OUT = BW_PSUM
)(
  input  logic clk, clk_2, reset, reset_2,
  input  logic s_valid_1, s_valid_2,
  input  logic [COL-1:0][BW_PSUM-1:0] psum_1,
  input  logic [COL-1:0][BW_PSUM-1:0] psum_2,
  output logic [W_OUT-1:0] psum_norm_1,
  output logic [W_OUT-1:0] psum_norm_2,
  output logic norm_valid
);


  // Stream 2: Synchronize
  logic empty;
  logic [COL-1:0][BW_PSUM-1:0] psum_2_sync;

  afifo #(.C_DEPTH(1), .C_WIDTH (COL*BW_PSUM)) AFIFO (

    .i_wclk    (clk_2    ), 
    .i_wrst    (reset_2  ),
    .i_wen     (s_valid_2),
    .i_wr_data (psum_2   ),
    // .o_full    (afifo_full),

    .i_rclk    (clk      ), 
    .i_rrst    (reset    ),
    .i_ren     (!empty   ), // keep only 1 value
    .o_empty   (empty    ),
    .o_rd_data (psum_2_sync)
  );

  // shifters
  logic [1:0][COL-1:0][BW_PSUM-1:0] shift;
  logic [$clog2(COL)-1:0] count;
  enum {IDLE, SUM, DIV} state;

  always_ff @(posedge clk)
    if (reset) begin
      shift <= 0;
      state <= IDLE;
      count <= 0;
    end else
      unique case (state)
        IDLE: begin 
                if (s_valid_1) 
                  shift[0] <= psum_1;
                if (!empty) begin
                  shift[1] <= psum_2_sync; 
                  state <= SUM;
                end
              end
        SUM:  begin
                if (count == COL-1) begin
                  count <= 0;
                  state <= DIV;
                end else
                  count    <= count + 1;
                shift[0] <= {shift[0], shift[0]} >> BW_PSUM; // rotate
                shift[1] <= {shift[1], shift[1]} >> BW_PSUM; // rotate
              end
        DIV:  begin
                if (count == COL-1) begin
                  count <= 0;
                  state <= IDLE;
                end else
                  count <= count + 1;
                shift[0] <= {shift[0], shift[0]} >> BW_PSUM; // rotate
                shift[1] <= {shift[1], shift[1]} >> BW_PSUM; // rotate
              end
      endcase

  wire [BW_PSUM-1:0] data_1 = shift[0][0];
  wire [BW_PSUM-1:0] data_2 = shift[1][0];

  logic sum_clear;
  logic [BW_PSUM + $clog2(COL) -1:0] sum;
  always_ff @(posedge clk) begin
    sum_clear <= state==IDLE;
    if      (state==SUM)  sum <= $signed(sum) + $signed(data_1) + $signed(data_2);
    else if (sum_clear )  sum <= 0;
  end

  wire div_sel = count[0];
  logic div_sel_1, div_sel_2, div_sel_3, state_div_1, state_div_2;
  logic [1:0][BW_PSUM-1:0] div_in_1, div_in_2;
  logic [1:0][W_OUT  -1:0] div_out_1, div_out_2;

  always_ff @(posedge clk) begin

    // input demux
    if (state == DIV && div_sel==0) div_in_1[0] <= data_1;
    if (state == DIV && div_sel==1) div_in_1[1] <= data_1;

    if (state == DIV && div_sel==0) div_in_2[0] <= data_2;
    if (state == DIV && div_sel==1) div_in_2[1] <= data_2;
    

    // dividers
    div_out_1[0] <= (256 * div_in_1[0]) / sum;
    div_out_1[1] <= (256 * div_in_1[1]) / sum;
    div_out_2[0] <= (256 * div_in_2[0]) / sum;
    div_out_2[1] <= (256 * div_in_2[1]) / sum;

    {div_sel_3, div_sel_2, div_sel_1} <= {div_sel_2, div_sel_1, div_sel};
    {norm_valid, state_div_2, state_div_1} <=  {state_div_2, state_div_1, state==DIV};
  end

  // Output mux

  assign psum_norm_1 = div_sel_3 ? div_out_1[1] : div_out_1[0];
  assign psum_norm_2 = div_sel_3 ? div_out_2[1] : div_out_2[0];

endmodule