// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module mac_col (clk, reset, out, q_in, q_out, i_inst, fifo_wr, o_inst);

parameter bw = 4;
parameter bw_psum = 2*bw+3;
parameter pr = 8;
parameter col_id = 0;

output signed [bw_psum-1:0] out;
input  signed [pr*bw-1:0] q_in;
output signed [pr*bw-1:0] q_out;
input  clk, reset;
input  [1:0] i_inst; // [1]: execute, [0]: load 
output [1:0] o_inst; // [1]: execute, [0]: load 
output fifo_wr;
reg    load_ready_q;
reg    [3:0] cnt_q;
reg    [1:0] inst_q;
reg    [1:0] inst_2q;



reg   signed [pr*bw-1:0] query_q;
reg   signed [pr*bw-1:0] key_q;
//wire  signed [bw_psum-1:0] psum;


wire		[2*bw-1:0]	product0	;
wire		[2*bw-1:0]	product1	;
wire	  [2*bw-1:0]	product2	;
wire		[2*bw-1:0]	product3	;
wire		[2*bw-1:0]	product4	;
wire		[2*bw-1:0]	product5	;
wire		[2*bw-1:0]	product6	;
wire		[2*bw-1:0]	product7	;

assign o_inst = inst_q;
//assign fifo_wr = inst_4q[1] & inst_3q[1];
assign fifo_wr = inst_2q[1];
assign q_out  = query_q;

mac_8in #(.bw(bw), .bw_psum(bw_psum), .pr(pr)) mac_8in_instance (
        .a(query_q), 
        .b(key_q),
	.product1(product1),
  .product2(product2),
  .product3(product3),
  .product4(product4),
  .product5(product5),
  .product6(product6),
  .product7(product7),
  .product0(product0)
); 
/*
assign out = 
                {{(5){product0_reg[2*bw-1]}},product0_reg	}
	+	{{(5){product1_reg[2*bw-1]}},product1_reg	}
	+	{{(5){product2_reg[2*bw-1]}},product2_reg	}
	+	{{(5){product3_reg[2*bw-1]}},product3_reg	}
	+	{{(5){product4_reg[2*bw-1]}},product4_reg	}
	+	{{(5){product5_reg[2*bw-1]}},product5_reg	}
	+	{{(5){product6_reg[2*bw-1]}},product6_reg	}
	+	{{(5){product7_reg[2*bw-1]}},product7_reg	};
*/
assign out = 
                {{(5){product0[2*bw-1]}},product0	}
	+	{{(5){product1[2*bw-1]}},product1	}
	+	{{(5){product2[2*bw-1]}},product2	}
	+	{{(5){product3[2*bw-1]}},product3	}
	+	{{(5){product4[2*bw-1]}},product4	}
	+	{{(5){product5[2*bw-1]}},product5	}
	+	{{(5){product6[2*bw-1]}},product6	}
	+	{{(5){product7[2*bw-1]}},product7	};
                

always @ (posedge clk or posedge reset) begin
  if (reset) begin
    cnt_q <= 0;
    load_ready_q <= 1;
    inst_q <= 0;
    inst_2q <= 0;
  end
  else begin
    inst_q <= i_inst;
    inst_2q <= inst_q;

    if (inst_q[0]) begin
       query_q <= q_in;
       if (cnt_q == 9-col_id)begin
         cnt_q <= 0;
         key_q <= q_in;
         load_ready_q <= 0;
       end
       else if (load_ready_q)
         cnt_q <= cnt_q + 1;
    end
    else if(inst_q[1]) begin
      //out     <= psum;
      query_q <= q_in;
    end
  end
end

endmodule
