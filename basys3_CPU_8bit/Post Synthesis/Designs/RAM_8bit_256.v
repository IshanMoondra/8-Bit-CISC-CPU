module ram
  (
    input clk,
    input csel,
    input read,
    input [7:0]addr,
    input [7:0]datain,
    output reg[7:0]dataout
  );

//Chip Select, csel is Active Low Logic.
//Memory Read, read is Active Low Logic.

reg [7:0]ramdata [255:0];  
integer i;

initial
begin
  //Demo Program
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
  //Padded with NOPs
  for (i = 128; i < 256; i = i+1)
    ramdata[i] <= 255;
end


always @(posedge clk)
begin
  if (csel)
    dataout <= 8'bz;
  else
      if (read == 0)
        dataout <= ramdata[addr];
      else
        ramdata[addr] <= datain;
end
endmodule