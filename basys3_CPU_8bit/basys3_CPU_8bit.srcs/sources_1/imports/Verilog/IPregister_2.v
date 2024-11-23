module ipreg
	(
		input  wire clk,
		input  wire enable,
		input  wire rst_n,
		input  wire [7:0]ipload,
		input  wire ipopsel,
		output reg  [7:0]nextip
  	);

//reg [7:0]temp;
always @(posedge clk, negedege rst_n)
begin
	if (!rst_n)
		nextip <= 8'h00;
	else if (enable)
  	begin
  		case (ipopsel)
		  0: nextip <= nextip + 1;
		  1: nextip <= ipload;
		  default: nextip <= nextip;
		endcase
	end
  end
endmodule // ipreg 