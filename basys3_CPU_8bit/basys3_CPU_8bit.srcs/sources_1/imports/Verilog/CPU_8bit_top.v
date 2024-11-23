/*
CPU_8bit_top.v
Top level module for 8 Bit CISC CPU, created for synthesis using Design Vision.
*/

module CPU_8bit_top
    (
        //Universal Signals
        input  wire clk,
        input  wire rst_n,
        input  wire enable,
        //Signals to Memory: Vonn Nuemann Style 
        input  wire [7:0] instruction,
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
wire [7:0] ibuf;
wire [15:0] uop_code;

//Instantiating all the modules

//Micro OP Code Module
uOP_code
    (
        .clk(clk),
        .rst_n(rst_n),

        .instruction(instruction),

        .control_signals(uop_code),
        .ibuf(ibuf)
    );

//CPU Control Unit (Instantiating everything else internally)
control_unit
    (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),

        .ibuf(ibuf),
        .control_signals(uop_code),

        .flag(flag),
        .final(final),
        .status(status),
        
        .Csel(Csel),
        .read_enable(read_enable),
        .ipnext(ipnext),
        .ram_dataout(ram_dataout),
        .ram_write_data(ram_write_data)
    );

endmodule