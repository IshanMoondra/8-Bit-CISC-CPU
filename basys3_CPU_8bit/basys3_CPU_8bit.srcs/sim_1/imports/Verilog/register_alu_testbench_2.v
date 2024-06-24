/*
Attempt to calculate Fibonacci numbers upto 233.
RES <= RS0 + RS1; RS0 > RS1.
RS2 <= RES;
RS1 <= RS0;
*/

module test();
  reg CLK;
  reg [7:0]OPI;
  wire [2:0]FLAG;
  wire [7:0]RES;
  reg [1:0]ROPSEL;
  reg [2:0]REGSEL;
  reg [7:0]RDATAIN;
  wire [7:0]RDATAOUT1;
  wire [7:0]RDATAOUT2;
  reg [3:0]ASEL;
  integer i;
  
  register_stack RS (
  .clk(CLK),
  .ropsel(ROPSEL),
  .regsel(REGSEL),
  .rdatain(RDATAIN),
  .rdataout1(RDATAOUT1),
  .rdataout2(RDATAOUT2));
  
  alu ALU (
  .clk(CLK),
  .op1(RDATAOUT1),
  .op2(RDATAOUT2),
  .opi(OPI),
  .sel(ASEL),
  .res(RES),
  .flag(FLAG));

initial
begin

//Dump Waves.
$dumpfile("dump.vcd");
$dumpvars(1);

CLK <= 1'bz;
OPI <= 8'bz;
ROPSEL <= 2'bz;
REGSEL <= 3'bz;
RDATAIN <= 8'bz;
ASEL <= 4'bz;
#10;

CLK <= 0;
#10;
ROPSEL <= 0;
REGSEL <= 0;
RDATAIN <= 1;
CLK <= 1;
#10;

CLK <= 0;
#10;
ROPSEL <= 0;
REGSEL <= 1;
RDATAIN <= 0;
CLK <= 1;
#10;

CLK <= 0;
#10;
ROPSEL <= 2;
REGSEL <= 0;
ASEL <= 4'bz;
RDATAIN <= 8'bz;
CLK <= 1;
#10;

for ( i = 0; i < 12; i = i + 1)
begin
CLK <= 0;
#10;
ASEL <= 0;
CLK <= 1;
#10;

CLK <= 0;
#10;
ASEL <= 4'bz;
ROPSEL <= 0;
REGSEL <= 2;
RDATAIN <= RES;
CLK <= 1;
#10;

CLK <= 0;
#10;
RDATAIN <= 8'bz;
ROPSEL <= 3;
REGSEL <= 4;
CLK <= 1;
#10;

CLK <= 0;
#10;
ROPSEL <= 3;
REGSEL <= 1;
CLK <= 1;
#10;

CLK <= 0;
#10;
REGSEL <= 0;
ROPSEL <= 2;
CLK <= 1;
#10;
end

#10;

end

endmodule // test