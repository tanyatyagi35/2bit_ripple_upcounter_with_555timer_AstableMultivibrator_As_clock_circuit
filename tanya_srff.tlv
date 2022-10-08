\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/    /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/   /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  
//Your Verilog/System Verilog Code Starts Here:
//verilog code for SR flip flop

module tanya_srff(S, R, reset, Q, Qbar);

	input S, R, reset;
	output reg Q, Qbar;

	always @(*)
	begin
		if (reset) 
		begin
			Q<=1'b0;
			Qbar<=1'b1;
		end 	
	
		else 
		begin
			if(S==0 && R==0)	
			begin
				Q<=Q;
				Qbar<=Qbar;
			end
			else if(S==0 && R==1)	
			begin
				Q<=1'b0;
				Qbar<=1'b1;
			end
			else if(S==1 && R==0)	
			begin
				Q<=1'b1;
				Qbar<=1'b0;
			end
			else	
			begin
				Q<=1'bx;
				Qbar<=1'bx;
			end
		end
	end
endmodule


//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  S;//input
		logic  R;//input
		logic  Q;//output
		logic  Qbar;//output
//The $random() can be replaced if user wants to assign values
		assign S = 1'b1;
		assign R = 1'b0;
		tanya_srff tanya_srff(.S(S), .R(R), .reset(reset), .Q(Q), .Qbar(Qbar));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

