module test();
reg CLK;
reg [7:0]IPLOAD;
reg IPOPSEL;
wire [7:0]NEXTIP;
integer i;

IPReg ipreg(
.clk(CLK),
.ipload(IPLOAD),
.ipopsel(IPOPSEL),
.nextip(NEXTIP));

initial
begin
//Dump Waves
$dumpfile("dump.vcd");
$dumpvars(1);

CLK <= 0;
#10;    
IPOPSEL <= 1'bz;
IPLOAD <= 8'bz;
CLK <= 1;
#10;

CLK <= 0;
#10;
IPOPSEL <= 0;
CLK <= 1;
#10;

for (i = 0; i < 5; i = i+1)
begin
CLK <= 0;
#10;
CLK <= 1;
#10;
end

CLK <= 0;    
#10;
IPOPSEL <= 1;
IPLOAD <= 10;
CLK <= 1;

#10;
CLK <= 0;
#10;
IPOPSEL <= 0;
IPLOAD <= 8'bz;
CLK <= 1;

#10;
for (i = 0; i < 5; i = i+1)
begin
CLK <= 0;
#10;
CLK <= 1;
#10;
end

end
endmodule