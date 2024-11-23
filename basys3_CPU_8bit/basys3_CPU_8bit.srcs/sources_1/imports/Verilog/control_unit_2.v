module control_unit
	(
		//Universal Signals
		input wire enable,
		input  wire clk,
		input wire rst_n,
		//Signals to Memory: Vonn Nuemann Style
		output wire Csel,
		output wire read_enable,
		output wire [7:0]ipnext,
		input wire [7:0] ram_dataout,
		output wire [7:0] ram_write_data,
		//Signals from Micro OP Code Module
		input wire [15:0] control_signals,
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
wire Read;
wire Ipopsel;
wire [1:0]Ropsel;
wire [2:0]Regsel;
wire [3:0]Asel;
reg [1:0] temp2;
reg [1:0]state;
reg [1:0]next_state;
integer i;

assign {states, EI, EA,Csel, Read, Ipopsel, Ropsel, Regsel, Asel} = control_signals;

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
.enable(EI),
.ipload(temp),
.ipopsel(Ipopsel),
.nextip(ipnext));

//ALU_8bit:
alu ALU(
.clk(clk),
.enable(EA),
.op1(rdataout1),
.op2(rdataout2),
.opi(temp),
.sel(Asel),
.flag(flag),
.res(final));

assign ram_write_data = rdataout1;

//Micro OP Code table moved to a new module.

//{status, EI, EA, Csel, Read, Ipopsel, [1:0]Ropsel, [2:0]Regsel, [3:0]Asel}
//opcodes[0] = {1'b0, 1'b0, 1'b0, 2'd2, 3'b0, 4'bz};

always @(posedge clk, negedege rst_n)
begin
  if (!rst_n)
	begin
		temp <= 0;
		state <= 0;
		next_state <= 0;
	end
  if (enable)
      begin
		state <= next_state;
		status <= state;
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
				temp = ram_dataout;
				next_state = 0;
			end
		2:
			begin
				temp <= ram_dataout; //Address for RAM Chip to write Data held in Register_Stack.
				next_state = 0;
			end
		3:
			begin
				next_state = 0;
			end
		endcase
  	end
end
endmodule // control_unit