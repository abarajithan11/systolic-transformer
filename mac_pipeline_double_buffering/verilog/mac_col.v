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
reg    [1:0] inst_3q;
reg    [1:0] inst_4q;
reg    [1:0] inst_5q;
reg    [1:0] inst_6q;

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

//ADDED 
reg		[2*bw-1:0]	product0_reg	;
reg		[2*bw-1:0]	product1_reg	;
reg		[2*bw-1:0]	product2_reg	;
reg		[2*bw-1:0]	product3_reg	;
reg		[2*bw-1:0]	product4_reg	;
reg		[2*bw-1:0]	product5_reg	;
reg		[2*bw-1:0]	product6_reg	;
reg		[2*bw-1:0]	product7_reg	;

reg		[2*bw+1-1:0]	add0_reg_l1	;
reg		[2*bw+1-1:0]	add1_reg_l1	;
reg		[2*bw+1-1:0]	add2_reg_l1	;
reg		[2*bw+1-1:0]	add3_reg_l1	;

reg		[2*bw+2-1:0]	add0_reg_l2	;
reg		[2*bw+2-1:0]	add1_reg_l2	;


assign o_inst = inst_q;
assign fifo_wr = inst_5q[1];//inst_6q[1] & inst_5q[1];
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

always@(posedge clk)
begin
  product0_reg <= product0;
  product1_reg <= product1;
  product2_reg <= product2;
  product3_reg <= product3;
  product4_reg <= product4;
  product5_reg <= product5;
  product6_reg <= product6;
  product7_reg <= product7;
end
/*
assign out = 
                {{(3){product0_reg[2*bw-1]}},product0_reg	}
	+	{{(3){product1_reg[2*bw-1]}},product1_reg	}
	+	{{(3){product2_reg[2*bw-1]}},product2_reg	}
	+	{{(3){product3_reg[2*bw-1]}},product3_reg	}
	+	{{(3){product4_reg[2*bw-1]}},product4_reg	}
	+	{{(3){product5_reg[2*bw-1]}},product5_reg	}
	+	{{(3){product6_reg[2*bw-1]}},product6_reg	}
	+	{{(3){product7_reg[2*bw-1]}},product7_reg	};
*/
assign out = 
                {{(1){add0_reg_l2[2*bw+2-1]}},add0_reg_l2	}
	+	{{(1){add1_reg_l2[2*bw+2-1]}},add1_reg_l2	};

always @ (posedge clk) begin
  if (reset) begin
    cnt_q <= 0;
    load_ready_q <= 1;
    inst_q <= 0;
    inst_2q <= 0;
    inst_3q <= 0;
    inst_4q <= 0;
    inst_5q <= 0;
    inst_6q <= 0;
  end
  else begin
    inst_q <= i_inst;
    inst_2q <= inst_q;
    inst_3q <= inst_2q;
    inst_4q <= inst_3q;
    inst_5q <= inst_4q;
    inst_6q <= inst_5q;

    add0_reg_l1 <= {{(1){product0_reg[2*bw-1]}},product0_reg} +	{{(1){product1_reg[2*bw-1]}},product1_reg	};
    add1_reg_l1 <= {{(1){product2_reg[2*bw-1]}},product2_reg	} +	{{(1){product3_reg[2*bw-1]}},product3_reg	}; 
    add2_reg_l1 <= {{(1){product4_reg[2*bw-1]}},product4_reg	} +	{{(1){product5_reg[2*bw-1]}},product5_reg	}; 
    add3_reg_l1 <= {{(1){product6_reg[2*bw-1]}},product6_reg	} +	{{(1){product7_reg[2*bw-1]}},product7_reg	}; 

    add0_reg_l2 <= {{(1){add0_reg_l1[2*bw+1-1]}},add0_reg_l1	} + {{(1){add1_reg_l1[2*bw+1-1]}},add1_reg_l1	};
    add1_reg_l2 <= {{(1){add2_reg_l1[2*bw+1-1]}},add2_reg_l1	} + {{(1){add3_reg_l1[2*bw+1-1]}},add3_reg_l1	};

    if (inst_2q[0]) begin
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
