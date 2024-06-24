module ipreg (
  input  wire clk,
  input  wire enable,
  input  wire [7:0]ipload,
  input  wire ipopsel,
  output reg  [7:0]nextip);

reg [7:0]temp;

initial
begin
nextip <= 0;
end

always @(posedge clk)
begin
  // put clocked assignments here
  	if (enable)
  	begin
  		case (ipopsel)
		  0: nextip <= nextip + 1;
		  1: nextip <= ipload;
		  default: nextip <= nextip;
		  endcase
	end
  end

endmodule // ipreg 