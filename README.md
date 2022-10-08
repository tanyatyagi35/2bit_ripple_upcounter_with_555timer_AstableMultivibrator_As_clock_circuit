Mixed Signal SOC Design Hackathon
# 2bit_ripple_upcounter_with_555timer_AstableMultivibrator_As_clock_circuit
```
• Abstract
  • Reference Circuit Diagram
  • Reference Waveform
  • Circuit Details
  • Software Used
    • esim
    • NgSpice
    • Makerchip
    • Verilator
  • Circuit Diagram in esim
  • Verilog Code
  • Makerchip
  • Makerchip plots
  • Netlists
  • NgSpice Plots
  • Steps to run generate NgVeri Model
  • Steps to run this project
  • Acknowlegdements
  • References
```

Abstract
This paper contains implementation of 2-bit ripple upcounter with 555 timer Astable multivibrator as clock circuit. The most widely used application of ripple up
counter is to act as an frequency divider circuit so that signal's high frequency can be reduced to usable value for low speed circuits.

Reference Circuit Diagram
![image](https://user-images.githubusercontent.com/30209235/194721046-5418b629-2782-410d-918a-50fbf3fc32f4.png)
Fig 1- circuit diagram of the circuit to be implemented
![image](https://user-images.githubusercontent.com/30209235/194721359-7139bf2f-4b5b-4dea-a5b5-32fa0adb0419.png)
Fig 2- 555 timer Astable multivibrator for clock generation

Reference Waveform
![image](https://user-images.githubusercontent.com/30209235/194721382-5be3f34b-d779-4dda-996c-8eff15c8a3d4.png)


Circuit Details
The block diagram of 3-bit Synchronous binary up counter is shown in fig 1. Synchronous counters have common clock pulses which triggers all the flip-flops simultaneously. The J & K inputs of first, second and third flip-flops are 1, QA , (QA.QB) respectively. The output of JKA flip-flop toggles for every negative edge of clock signal .The output of second JK flip-flop toggles for every negative edge of clock if QA is 1 while that of third toggles for every negative edge of clock if both QA & QB are 1. Here, QC & QA are MSB & LSB respectively. The initial status of the JK flip-flops in the absence of clock signal is QCQBQA=000. This is incremented by one for every negative edge of clock signal. This pattern repeats when further negative edges of clock signal are applied.

The astable multivibrator circuit consists of two switching transistors, a cross-coupled feedback network, and two time delay capacitors which allows oscillation between the two states with no external triggering to produce the change in state. The time period is determined by the time constant of the RC networks connected across the base terminals of the transistors. As the transistors are switching both “ON” and “OFF”, the output at either collector will be a square wave with slightly rounded corners because of the current which charges the capacitors. If the value of the capacitor C1 equals the value of the capacitor, C2, C1 = C2 and also the value of the base resistor R2 equals the value of the base resistor, R3, R2 = R3 then the total length of time of the Multivibrators cycle is given below for a symmetrical output waveform. f=1/T=1/(1.38RC). So, for a frequency of 1Hz, we choose the values of R2=R3=100k and C1=C2=7.24µF by the help of the formula.

Software Used
eSim
It is an Open Source EDA developed by FOSSEE, IIT Bombay. It is used for electronic circuit simulation. It is made by the combination of two software namely NgSpice and KiCAD. For more details refer: https://esim.fossee.in/home

NgSpice
It is an Open Source Software for Spice Simulations. For more details refer: http://ngspice.sourceforge.net/docs.html

Makerchip
It is an Online Web Browser IDE for Verilog/System-verilog/TL-Verilog Simulation. Refer https://www.makerchip.com/

Verilator
It is a tool which converts Verilog code to C++ objects. Refer: https://www.veripool.org/verilator/

Circuit Diagram in eSim
image

Verilog Code for 2bit ripple upcounter

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

module tanya_ripple_upcounter2(clk, reset, Q);
	
	input clk, reset; 
	output [1:0] Q;

	tff tO(clk, reset, Q[0]);  //LSB T-flip flop
	tff t1(Q[0], reset, Q[1]);  //MSB T-flip flop  

endmodule






verilog code for RS flip flop of 555 timer

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



Makerchip code for ripple upcounter

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


Makerchip code for 555timer SR flip flop
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



Makerchip plots for ripple upcounter
![image](https://user-images.githubusercontent.com/30209235/194641641-27c4c77e-fd86-4a79-b4ef-8c310f1a2ec4.png)

Makerchip plots for 555timer SR flip flop
![image](https://user-images.githubusercontent.com/30209235/194717483-92fb4e67-ef0b-4a5d-8d36-2072adb66dec.png)


Netlists
* C:\Users\SriRamajayam\eSim-Workspace\3bit_counter\3bit_counter.cir

* EESchema Netlist Version 1.1 (Spice format) creation date: 03/09/22 05:44:26

* To exclude a component from the Spice Netlist add [Spice_Netlist_Enabled] user FIELD set to: N
* To reorder the component spice node sequence add [Spice_Node_Sequence] user FIELD and define sequence: 2,1,0

* Sheet Name: /
U1  Net-_U1-Pad1_ Net-_U1-Pad2_ Net-_U1-Pad3_ Net-_U1-Pad4_ Net-_U1-Pad5_ vinisha_3bit_counter		
Q2  clk Net-_C1-Pad2_ GND eSim_NPN		
Q1  GND Net-_C2-Pad2_ Net-_C1-Pad1_ eSim_NPN		
R1  Net-_R1-Pad1_ Net-_C1-Pad1_ 1k		
R4  Net-_R1-Pad1_ clk 1k		
R2  Net-_R1-Pad1_ Net-_C1-Pad2_ 100k		
R3  Net-_R1-Pad1_ Net-_C2-Pad2_ 100k		
C1  Net-_C1-Pad1_ Net-_C1-Pad2_ 7.24u		
C2  clk Net-_C2-Pad2_ 7.24u		
v1  Net-_R1-Pad1_ GND 5		
U4  clk rst Net-_U1-Pad1_ Net-_U1-Pad2_ adc_bridge_2		
U2  clk plot_v1		
U3  rst plot_v1		
v2  rst GND pulse		
U5  Net-_U1-Pad3_ Net-_U1-Pad4_ Net-_U1-Pad5_ out2 out1 out0 dac_bridge_3		
U6  out2 plot_v1		
U7  out1 plot_v1		
U8  out0 plot_v1		

.end
NgSpice Plots
image
Output waveform of 3bit Counter

image
Output of Astable multivibrator- Clock circuit

Steps to run generate NgVeri Model
1.Open eSim
2.Run NgVeri-Makerchip
3.Add top level verilog file in Makerchip Tab
4.Click on NgVeri tab
5.Add dependency files
6.Click on Run Verilog to NgSpice Converter
7.Debug if any errors
8.Model created successfully

Steps to run this project
1.Open a new terminal
2.Clone this project using the following command: git clone https://github.com/vinisha2410/3bit_Binary_Counter_With_Astable_Multivibrator_As_Clock_Circuit.git

3.Change directory: cd esim_project_files

4.Run ngspice: ngspice 3bit_counter.cir.out

5.To run the project in eSim:
• Run eSim
• Load the project
• Open eeSchema

Acknowlegdements
1.FOSSEE, IIT Bombay
2.Steve Hoover, Founder, Redwood EDA
3.Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd. - kunalpghosh@gmail.com
4.Sumanto Kar, eSim Team, FOSSEE

References
[1] https://www.iitg.ac.in/cseweb/vlab/Digital-System-Lab/up_counter.php?id=13
[2] https://www.electronics-tutorials.ws/waveforms/astable.html
