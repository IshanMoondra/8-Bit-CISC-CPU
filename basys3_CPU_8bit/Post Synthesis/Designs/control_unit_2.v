module control_unit
	(
		//Universal Signals
		//input wire enable,
		input  wire clk,
		input wire rst_n,
		//Signals to Memory: Vonn Nuemann Style
		output wire Csel,
		output wire read_enable,
		output wire [7:0]ipnext,
		//input wire [7:0] ram_dataout,
		output wire [7:0] ram_write_data,
		//Signals from Micro OP Code Module
		//input wire [15:0] control_signals,
		input wire [7:0] ibuf,
		//CPU outputs
		output wire [7:0]final,
		output wire [2:0]flag,
		output reg [1:0]status
	);


//Changes done to accomodate only necessary outputs to BASYS3.
wire [7:0]rdataout1;
wire [7:0]rdataout2;
reg [7:0]temp;

//16 Control Bits for all Sub Modules.
wire [1:0] states;
wire EI;
wire EA;
wire Ipopsel;
wire [1:0]Ropsel;
wire [2:0]Regsel;
wire [3:0]Asel;
//reg [1:0] temp2;
reg [1:0]state;
reg [1:0]next_state;

assign {states, EI, EA,Csel, read_enable, Ipopsel, Ropsel, Regsel, Asel} = control_signals;

//Instantiate All Sub Modules.

/*
//RAM_8Bit_256:
ram RAM(
.clk(clk),
.csel(Csel),
.read(Read),
.addr(ipnext),
.datain(rdataout1),
.dataout(ram_dataout));
*/

//Register_Stack:
register_stack REG(
.clk(clk),
.rst_n(rst_n),
.ropsel(Ropsel),
.regsel(Regsel),
.rdatain(temp),
.rdataout1(rdataout1),
.rdataout2(rdataout2),
.aluin(final),
.alufin(flag));

//IP_Register_2:
ipreg IPReg(
.clk(clk),
.rst_n(rst_n),
.enable(EI),
.ipload(temp),
.ipopsel(Ipopsel),
.nextip(ipnext));

//ALU_8bit:
alu ALU(
.clk(clk),
.rst_n(rst_n),
.enable(EA),
.op1(rdataout1),
.op2(rdataout2),
.opi(temp),
.sel(Asel),
.flag(flag),
.res(final));

assign ram_write_data = rdataout1;

//Micro OP Code table moved to a new module.
//New Micro OP Code Table available as a combinational blob.

wire [15:0] control_signals;

uOP_code iuOP
	(
		.instruction(ibuf),
		.control_signals(control_signals)
	);

//{status, EI, EA, Csel, Read, Ipopsel, [1:0]Ropsel, [2:0]Regsel, [3:0]Asel}
//opcodes[0] = {1'b0, 1'b0, 1'b0, 2'd2, 3'b0, 4'bz};

always @(posedge clk, negedge rst_n)
begin
  if (!rst_n)
	begin
		state <= 0;
	end
  else
      begin
		state <= next_state;
		status <= state;
  	end
end

//Seperated the State Machine into a Combinational Block
always @(*)
begin
	next_state <= state;
	temp <= 0;
	case (state)
	0:
		begin
			if (control_signals[15:14] == 1)
				next_state <= 1;
			else if (control_signals[15:14] == 0)
				next_state <= 0;
			//Need to add more logic to complete the state machine.
			else
				next_state <= 0;
		end
	1:
		begin
			temp <= ibuf;
			next_state <= 0;
		end
	2:
		begin
			temp <= ibuf; //Address for RAM Chip to write Data held in Register_Stack.
			next_state <= 0;
		end
	3:
		begin
			next_state <= 0;
		end
	endcase
end
endmodule // control_unit