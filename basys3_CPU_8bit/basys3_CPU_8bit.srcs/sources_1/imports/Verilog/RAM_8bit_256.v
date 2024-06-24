module ram (
input clk,
input csel,
input read,
input [7:0]addr,
input [7:0]datain,
output reg[7:0]dataout);
//Chip Select, csel is Active Low Logic.
//Memory Read, read is Active Low Logic.
reg [7:0]ramdata [255:0];  
integer i;

initial
begin

for (i = 0; i < 256; i = i+1)
begin
ramdata[i] <= i;
end

ramdata[0] <= 0;
ramdata[1] <= 05;
ramdata[2] <= 8;
ramdata[3] <= 64;
ramdata[4] <= 16;
ramdata[5] <= 15;
ramdata[6] <= 120;
ramdata[7] <= 16;
ramdata[8] <= 120;
ramdata[9] <= 16;
ramdata[10] <= 128;
ramdata[11] <= 5;
ramdata[12] <= 254;

for (i = 128; i < 256; i = i+1)
begin
ramdata[i] <= 255;
end

end


always @(negedge clk)
begin
  // put statements here
  if (csel)
  begin
  dataout <= 8'bz;
  end
  else
  begin
  if (read == 0)
  begin
    dataout <= ramdata[addr];
  end
  else
  begin
  	ramdata[addr] <= datain;
  end
  end
end
endmodule