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
