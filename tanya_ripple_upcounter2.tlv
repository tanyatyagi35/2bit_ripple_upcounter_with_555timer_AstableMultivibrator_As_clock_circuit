\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/    /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/    /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/    

//Your Verilog/System Verilog Code Starts Here:
//verilog code for T-flip flop module
module tff(input clk_n, input reset_p, output Q);

	wire D;
	dff d0(D, clk_n, reset_p, Q);
	not n1(D, Q);  // where D is the output and Q is the input
endmodule
   input D, clk_n, reset_p;
   output reg Q;
​
   always @(posedge reset_p or negedge clk_n)
   if (reset_p)
      Q<=1'b0;
   else
      Q<=D;
​
endmodule
​
​
​
//verilog code for 2bit ripple upcounter module 
module tanya_ripple_upcounter2(clk, reset, Q);






















0
10
20
30
clk
1
reset
0
 - 
TLV
          TLV    
 - 
SV
          SV    
Q
0
0
1
2
3
0
1
2
3
0
1
2
3
0
1
2
3
0
1
2
3
0
1
2
3
0
1
2
3
0
1
2
3
0
1
2
3
0
1
clk
1
cyc_cnt
*01
*1
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
failed
0
passed
0
reset
0
 + 
  tanya_ripple_upcounter2
          SV.tanya_ripple_upcounter2    



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



//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  [1:0] Q;//output
//The $random() can be replaced if user wants to assign values
		tanya_ripple_upcounter2 tanya_ripple_upcounter2(.clk(clk), .reset(reset), .Q(Q));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

