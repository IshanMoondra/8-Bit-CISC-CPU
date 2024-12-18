`timescale 1ns/1ns

module alu 
	(
		input  wire clk,
		input  wire rst_n,
		input  wire enable,
		input  wire [7:0]op1,
		input  wire [7:0]op2,
		input  wire [7:0]opi,
		input  wire [3:0]sel,
		output reg [2:0]flag,
		output reg  [7:0]res
	);
   
always @(posedge clk, negedge rst_n)
	begin
		if (!rst_n)
			begin
				res <= 8'h00;
				flag <= 3'h0;
			end
		else if (enable)
			begin	
				case (sel)
				0 : {flag[2], res} <= op1 + op2;
				1 : {flag[2], res} <= op1 - op2;
				2 : {flag[2], res} <= op1 + op2 + flag[2];
				3 : {flag[2], res} <= op1 - op2 - flag [2];
				4 : {flag[2], res} <= op1 + 1;
				5 : {flag[2], res} <= op1 - 1;
				6 : res <= ~(op1&op2);
				7 : res <= ~op1;
				8 : {flag[2], res} <= op1 + opi;
				9 : {flag[2], res} <= op1 - opi;
				10 : {flag[2], res} <= op1 + opi + flag[2];
				11 : {flag[2], res} <= op1 - opi - flag [2];
				12 : {flag[2], res} <= opi + 1;
				13 : {flag[2], res} <= opi - 1;
				14 : res <= ~(op1&opi);
				15 : res <= ~opi;
				endcase
				//Zero Flag
				flag[0] <= ~(|res);
				//Parity Flag
				flag[1] <= ^res;
			end
	end
endmodule // alu