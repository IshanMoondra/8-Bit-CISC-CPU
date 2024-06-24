module test();
reg CLK;
reg CSEL;
reg READ;
reg [7:0]ADDR;
reg [7:0]DATAIN;
wire [7:0]DATAOUT;
integer i;
integer j;

ram RAM(
.clk(CLK),
.csel(CSEL),
.read(READ),
.addr(ADDR),
.datain(DATAIN),
.dataout(DATAOUT));

initial
begin
	//Dump Waves.
	$dumpfile("dump.vcd");
	$dumpvars(1);
	for ( i=0; i < 128; i=i+1)
		begin
			#10;
			CLK <= 0;
			CSEL <= 0;
			READ <= 1;
			//READ <= 0;
			ADDR <= i;
			DATAIN <= i;
			#10;
			CLK <= 1;
		end
	
	for ( i=0; i < 128; i=i+1)
		begin
			#10;
			CLK <= 0;
			CSEL <= 0;
			READ <= 0;
			DATAIN <= 0;
			ADDR <= i;
			#10;
			CLK <= 1;
		end
	#20;
	CLK <= 0;
	CSEL <= 1;
	READ <= 0;
	DATAIN <= 0;
	ADDR <= 0;
	#10;
	CLK <= 1;
	#10;	
end
endmodule