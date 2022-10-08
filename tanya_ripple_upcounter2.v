//verilog code for T-flip flop module
module tff(input clk_n, input reset_p, output Q);

	wire D;
	dff d0(D, clk_n, reset_p, Q);
	not n1(D, Q);  // where D is the output and Q is the input
endmodule



// verilog code for D-flip flop module 
module dff(D, clk_n, reset_p, Q);
	
	input D, clk_n, reset_p;
	output reg Q;

	always @(posedge reset_p or negedge clk_n)
	if (reset_p)
		Q<=1'b0;
	else
		Q<=D;

endmodule



//verilog code for 2bit ripple upcounter module 
module tanya_ripple_upcounter2(clk, reset, Q);
	
	input clk, reset; 
	output [1:0] Q;

	tff tO(clk, reset, Q[0]);  //LSB T-flip flop
	tff t1(Q[0], reset, Q[1]);  //MSB T-flip flop  

endmodule

