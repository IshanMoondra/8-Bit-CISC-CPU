module rom(
input clk,
input csel,
input [7:0]addr,
output [7:0]data);

reg [7:0]romdata [255:0];
always @(posedge clk)
begin
  // put clocked assignments here
  romdata[4'd0] <= 1;
  romdata[4'd1] <= 2;
  romdata[4'd2] <= 4;
  romdata[4'd3] <= 8;
  romdata[4'd4] <= 16;
  romdata[4'd5] <= 32;
  romdata[4'd6] <= 64;
  romdata[4'd7] <= 128;
end

assign data = romdata[addr];
endmodule