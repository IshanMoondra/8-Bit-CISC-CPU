module test();
reg CLK;
wire [1:0]STATUS;
wire [7:0]FINAL;
wire [2:0]FLAG;
wire [7:0]IPNEXT;
wire [7:0]RDATAOUT1;
wire [7:0]RDATAOUT2;
wire [7:0]RAM_DATAOUT;
wire [7:0]IBUF;
wire [7:0]TEMP;
integer i;

control_unit CU(
.clk(CLK),
.status(STATUS),
.ipnext(IPNEXT),
.rdataout1(RDATAOUT1),
.rdataout2(RDATAOUT2),
.ram_dataout(RAM_DATAOUT),
.final(FINAL),
.flag(FLAG),
.ibuf(IBUF),
.temp(TEMP));

initial
begin 
	$dumpfile("dump.vcd");
	$dumpvars(1);
	for ( i = 0; i < 256; i = i + 1)
	begin
	CLK <= 0;
	#10;
	CLK <= 1;
	#10;
	end
	
end  // Control Unit 

endmodule