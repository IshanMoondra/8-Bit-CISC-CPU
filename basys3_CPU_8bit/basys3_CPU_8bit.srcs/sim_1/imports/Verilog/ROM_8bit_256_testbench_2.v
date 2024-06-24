module test();
reg CLK;
reg CSEL;
reg [7:0]ADDR;
wire [7:0]DATA;
integer i;

rom ROM(
.clk(CLK),
.csel(CSEL),
.addr(ADDR),
.data(DATA));

initial
	begin
	//Dump Waves.
	$dumpfile("dump.vcd");
	$dumpvars(1);
	for ( i=0; i<5;i=i+1)
		begin
	    	#10;
	    	CLK <= 0;
	    	CSEL <= 0;
	    	ADDR <= i;
	    	#10;
	    	CLK <= 1;
	    end
	end
endmodule
