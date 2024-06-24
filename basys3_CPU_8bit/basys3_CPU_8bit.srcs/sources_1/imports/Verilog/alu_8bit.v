`timescale 1ns/1ns

module alu (
  input  wire clk,
  input  wire enable,
  input  wire [7:0]op1,
  input  wire [7:0]op2,
  input  wire [7:0]opi,
  input  wire [3:0]sel,
  output reg [2:0]flag,
  output reg  [7:0]res);

//reg [2:0]flag;
initial
begin
res <= 0;
flag <= 0;
end
   
always @(negedge clk)
begin
  // put clocked assignments here
  if (enable)
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
	  end
  
  if (res == 0)
  begin
  flag[0] <= 1;
  end
  else
  begin
  flag[0] <= 0;
  end
  
  flag[1] <= ^res;
  
end
   
endmodule // alu