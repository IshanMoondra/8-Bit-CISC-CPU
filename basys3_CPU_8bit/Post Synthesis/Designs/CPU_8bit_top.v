/*
CPU_8bit_top.v
Top level module for 8 Bit CISC CPU, created for synthesis using Design Vision.
Max speed is 194.X MHz, at clock period of 5.143 ns. Power is 93 mW. 
*/

module CPU_8bit_top
    (
        //Universal Signals
        input  wire clk,
        input  wire rst_n,
        //input  wire enable,
        //Signals to Memory: Vonn Nuemann Style 
        output wire Csel,
		output wire read_enable,
		output wire [7:0] ipnext,
		input  wire [7:0] ram_dataout,
		output wire [7:0] ram_write_data,
		//CPU outputs
		output wire [7:0] final,
		output wire [2:0] flag,
		output wire [1:0] status                
    );

//Signals for the Micro OP Code Module
//wire [7:0] ibuf;
//wire [15:0] uop_code;

//Instantiating all the modules
/*
//Micro OP Code Module
uOP_code iUOP
    (
        .clk(clk),
        .rst_n(rst_n),

        .instruction(ram_dataout),

        .control_signals(uop_code),
        .ibuf(ibuf)
    );
*/
//CPU Control Unit (Instantiating everything else internally)
control_unit iControl
    (
        .clk(clk),
        .rst_n(rst_n),
        //.enable(enable),

        //.ibuf(ibuf),
        .ibuf(ram_dataout),
        //.control_signals(uop_code),

        .flag(flag),
        .final(final),
        .status(status),
        
        .Csel(Csel),
        .read_enable(read_enable),
        .ipnext(ipnext),
        //.ram_dataout(ram_dataout),
        .ram_write_data(ram_write_data)
    );

endmodule