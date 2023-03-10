// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module mac_8in (a, b, product0, product1, product2, product3, product4, product5, product6, product7);

parameter bw = 4;
parameter bw_psum = 2*bw+3;
parameter pr = 8; // parallel factor: number of inputs = 64

//output [bw_psum-1:0] out;
input  [pr*bw-1:0] a;
input  [pr*bw-1:0] b;


output		[2*bw-1:0]	product0	;
output		[2*bw-1:0]	product1	;
output		[2*bw-1:0]	product2	;
output		[2*bw-1:0]	product3	;
output		[2*bw-1:0]	product4	;
output		[2*bw-1:0]	product5	;
output		[2*bw-1:0]	product6	;
output		[2*bw-1:0]	product7	;



genvar i;


assign	product0	=	{{(bw){a[bw*	1	-1]}},	a[bw*	1	-1:bw*	0	]}	*	{{(bw){b[bw*	1	-1]}},	b[bw*	1	-1:	bw*	0	]};
assign	product1	=	{{(bw){a[bw*	2	-1]}},	a[bw*	2	-1:bw*	1	]}	*	{{(bw){b[bw*	2	-1]}},	b[bw*	2	-1:	bw*	1	]};
assign	product2	=	{{(bw){a[bw*	3	-1]}},	a[bw*	3	-1:bw*	2	]}	*	{{(bw){b[bw*	3	-1]}},	b[bw*	3	-1:	bw*	2	]};
assign	product3	=	{{(bw){a[bw*	4	-1]}},	a[bw*	4	-1:bw*	3	]}	*	{{(bw){b[bw*	4	-1]}},	b[bw*	4	-1:	bw*	3	]};
assign	product4	=	{{(bw){a[bw*	5	-1]}},	a[bw*	5	-1:bw*	4	]}	*	{{(bw){b[bw*	5	-1]}},	b[bw*	5	-1:	bw*	4	]};
assign	product5	=	{{(bw){a[bw*	6	-1]}},	a[bw*	6	-1:bw*	5	]}	*	{{(bw){b[bw*	6	-1]}},	b[bw*	6	-1:	bw*	5	]};
assign	product6	=	{{(bw){a[bw*	7	-1]}},	a[bw*	7	-1:bw*	6	]}	*	{{(bw){b[bw*	7	-1]}},	b[bw*	7	-1:	bw*	6	]};
assign	product7	=	{{(bw){a[bw*	8	-1]}},	a[bw*	8	-1:bw*	7	]}	*	{{(bw){b[bw*	8	-1]}},	b[bw*	8	-1:	bw*	7	]};

/*
assign out = 
                {{(5){product0[2*bw-1]}},product0	}
	+	{{(5){product1[2*bw-1]}},product1	}
	+	{{(5){product2[2*bw-1]}},product2	}
	+	{{(5){product3[2*bw-1]}},product3	}
	+	{{(5){product4[2*bw-1]}},product4	}
	+	{{(5){product5[2*bw-1]}},product5	}
	+	{{(5){product6[2*bw-1]}},product6	}
	+	{{(5){product7[2*bw-1]}},product7	};
                

*/
endmodule
