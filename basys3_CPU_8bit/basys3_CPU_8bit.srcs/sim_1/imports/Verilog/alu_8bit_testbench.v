`timescale 1ns/1ns

module test();

reg CLK;
reg ENABLE;
reg [7:0]OP1;
reg [7:0]OP2;
reg [7:0]OPI;
reg [3:0]SEL;
wire [7:0]RES;
wire [2:0]FLAG;  
integer i;

alu ALU(
.clk(CLK),
.enable(ENABLE),
.op1(OP1),
.op2(OP2),
.opi(OPI),
.sel(SEL),
.res(RES),
.flag(FLAG));

initial
begin

//Dump Waves.
$dumpfile("dump.vcd");
$dumpvars(1);
ENABLE <= 1;
OP1 <= 65;
OP2 <= 33;
OPI <= 32;
SEL <= 0;

//Setup Time

for ( i = 0; i < 4; i = i + 1)
begin
#20;
end

for ( i = 0; i < 16; i = i+1)
begin
#20;
CLK <= 0;
#20;
SEL <= i;
CLK <= 1;
end

OP1 <= 127;
OP2 <= 255;

for ( i = 0; i < 16; i = i+1)
begin
#20;
CLK <= 0;
#20;
SEL <= i;
CLK <= 1;
end

#20;
CLK <= 0;
#20;
SEL <= 0;
OP1 <= 0;
OP2 <= 0;
CLK <= 1;

#20;
CLK <= 0;
#20;
SEL <= 0;
OP1 <= 128;
OP2 <= 128;
CLK <= 1;

#20;
CLK <= 0;
#20;
SEL <= 2;
OP1 <= 0;
OP2 <= 0;
CLK <= 1;

#20;
CLK <= 0;
#10;
SEL <= 0;
OP1 <= 0;
OP2 <= 0;
CLK <= 1;


end

endmodule // test