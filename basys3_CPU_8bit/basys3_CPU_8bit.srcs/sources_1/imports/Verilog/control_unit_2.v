module control_unit (
  input wire enable,
  input  wire clk,
  output wire [7:0]ipnext,
  output wire [7:0]final,
  output wire [2:0]flag,
  output reg [1:0]status);


//Changes done to accomodate only necessary outputs to BASYS3.
wire [7:0]rdataout1;
wire [7:0]rdataout2;
wire [7:0]ram_dataout;
reg [7:0]ibuf;
reg [7:0]temp;

//16 Control Bits for all Sub Modules.
reg [16:0]opcodes [0:255];
wire [1:0] states;
wire EI;
wire EA;
wire Csel;
wire Read;
wire Ipopsel;
wire [1:0]Ropsel;
wire [2:0]Regsel;
wire [3:0]Asel;
reg [1:0] temp2;
reg [1:0]state;
reg [1:0]next_state;
integer i;

assign {states, EI, EA,Csel, Read, Ipopsel, Ropsel, Regsel, Asel} = opcodes[ibuf];

//Instantiate All Sub Modules.

//RAM_8Bit_256:
ram RAM(
.clk(clk),
.csel(Csel),
.read(Read),
.addr(ipnext),
.datain(rdataout1),
.dataout(ram_dataout));

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

initial
begin //Look Up Table for Instructions
//{status, EI, EA, Csel, Read, Ipopsel, [1:0]Ropsel, [2:0]Regsel, [3:0]Asel}	
	//opcodes[0] = {1'b0, 1'b0, 1'b0, 2'd2, 3'b0, 4'bz};
	 temp <= 0;
	 ibuf <= 255;
	 state <= 0;
	 next_state <= 0;
	 //Set of Instructions to load Registers with Immediate Data.
	 opcodes[0] = 16'b011000000000zzzz;
	 opcodes[1] = 16'b011000000001zzzz;
	 opcodes[2] = 16'b011000000010zzzz;
	 opcodes[3] = 16'b011000000011zzzz;
	 opcodes[4] = 16'b011000000100zzzz;
	 opcodes[5] = 16'b011000000101zzzz;
	 opcodes[6] = 16'b011000000110zzzz;
	 opcodes[7] = 16'b011000000111zzzz;
	 //Set of Instructions to Write Contents of Register to Disk. (No Provision of Disk at Current Time.)
	 opcodes[8] = 16'b001000001000zzzz;
	 opcodes[9] = 16'b001000001001zzzz;
	opcodes[10] = 16'b001000001010zzzz;
	opcodes[11] = 16'b001000001011zzzz;
	opcodes[12] = 16'b001000001100zzzz;
	opcodes[13] = 16'b001000001101zzzz;
	opcodes[14] = 16'b001000001110zzzz;
	opcodes[15] = 16'b001000001111zzzz;
	//Set of Instructions to Swap Contents of Registers.
	//Note: Only R0 and R1 can be destinations for the Swap.
	opcodes[16] = 16'b001100010000zzzz;
	opcodes[17] = 16'b001100010001zzzz;
	opcodes[18] = 16'b001100010010zzzz;
	opcodes[19] = 16'b001100010011zzzz;
	opcodes[20] = 16'b001100010100zzzz;
	opcodes[21] = 16'b001100010101zzzz;
	opcodes[22] = 16'b001100010110zzzz;
	opcodes[23] = 16'b001100010111zzzz;
	//Set of Instructions to Display Contents of Registers in Pairs.
	//Note: Only First 4 Instructions are defined.
	opcodes[24] = 16'b001000011000zzzz;
	opcodes[25] = 16'b001000011001zzzz;
	opcodes[26] = 16'b001000011010zzzz;
	opcodes[27] = 16'b001000011011zzzz;
	opcodes[28] = 16'b001000011100zzzz;
	opcodes[29] = 16'b001000011101zzzz;
	opcodes[30] = 16'b001000011110zzzz;
	opcodes[31] = 16'b001000011111zzzz;
	//Set of Instructions to Operate on Register Pairs with ALU operations.
	//Set of Instructions for all 8 ALU Operations on R0 & R1.
	opcodes[32] = 16'b0011000100000000;
	opcodes[33] = 16'b0011000100000001;
	opcodes[34] = 16'b0011000100000010;
	opcodes[35] = 16'b0011000100000011;
	opcodes[36] = 16'b0011000100000100;
	opcodes[37] = 16'b0011000100000101;
	opcodes[38] = 16'b0011000100000110;
	opcodes[39] = 16'b0011000100000111;
	//Set of Instructions for all 8 ALU Operations on R2 & R3.
	opcodes[40] = 16'b0111000100010000;
	opcodes[41] = 16'b0111000100010001;
	opcodes[42] = 16'b0111000100010010;
	opcodes[43] = 16'b0111000100010011;
	opcodes[44] = 16'b0111000100010100;
	opcodes[45] = 16'b0111000100010101;
	opcodes[46] = 16'b0111000100010110;
	opcodes[47] = 16'b0111000100010111;
	//Set of Instructions for all 8 ALU Operations on R4 & R5.
	opcodes[48] = 16'b0111000100100000;
	opcodes[49] = 16'b0111000100100001;
	opcodes[50] = 16'b0111000100100010;
	opcodes[51] = 16'b0111000100100011;
	opcodes[52] = 16'b0111000100100100;
	opcodes[53] = 16'b0111000100100101;
	opcodes[54] = 16'b0111000100100110;
	opcodes[55] = 16'b0111000100100111;
	//Set of Instructions for all 8 ALU Operations on R6 & R7.
	opcodes[56] = 16'b0111000100110000;
	opcodes[57] = 16'b0111000100110001;
	opcodes[58] = 16'b0111000100110010;
	opcodes[59] = 16'b0111000100110011;
	opcodes[60] = 16'b0111000100110100;
	opcodes[61] = 16'b0111000100110101;
	opcodes[62] = 16'b0111000100110110;
	opcodes[63] = 16'b0111000100110111;
	//Set of Instructions for all 8 ALU Operations on R0 and Immediate Data.
	opcodes[64] = 16'b0111000010001000;
	opcodes[65] = 16'b0111000010001001;
	opcodes[66] = 16'b0111000010001010;
	opcodes[67] = 16'b0111000010001011;
	opcodes[68] = 16'b0111000010001100;
	opcodes[69] = 16'b0111000010001101;
	opcodes[70] = 16'b0111000010001110;
	opcodes[71] = 16'b0111000010001111;
	//Set of Instructions for all 8 ALU Operations on R1 and Immediate Data.
	opcodes[72] = 16'b0111000010011000;
	opcodes[73] = 16'b0111000010011001;
	opcodes[74] = 16'b0111000010011010;
	opcodes[75] = 16'b0111000010011011;
	opcodes[76] = 16'b0111000010011100;
	opcodes[77] = 16'b0111000010011101;
	opcodes[78] = 16'b0111000010011110;
	opcodes[79] = 16'b0111000010011111;
	//Set of Instructions for all 8 ALU Operations on R2 and Immediate Data.
	opcodes[80] = 16'b0111000010101000;
	opcodes[81] = 16'b0111000010101001;
	opcodes[82] = 16'b0111000010101010;
	opcodes[83] = 16'b0111000010101011;
	opcodes[84] = 16'b0111000010101100;
	opcodes[85] = 16'b0111000010101101;
	opcodes[86] = 16'b0111000010101110;
	opcodes[87] = 16'b0111000010101111;
	//Set of Instructions for all 8 ALU Operations on R3 and Immediate Data.
	opcodes[88] = 16'b0111000010111000;
	opcodes[89] = 16'b0111000010111001;
	opcodes[90] = 16'b0111000010111010;
	opcodes[91] = 16'b0111000010111011;
	opcodes[92] = 16'b0111000010111100;
	opcodes[93] = 16'b0111000010111101;
	opcodes[94] = 16'b0111000010111110;
	opcodes[95] = 16'b0111000010111111;
	//Set of Instructions for all 8 ALU Operations on R4 and Immediate Data.
	opcodes[96] = 16'b0111000011001000;
	opcodes[97] = 16'b0111000011001001;
	opcodes[98] = 16'b0111000011001010;
	opcodes[99] = 16'b0111000011001011;
	opcodes[100] = 16'b0111000011001100;
	opcodes[101] = 16'b0111000011001101;
	opcodes[102] = 16'b0111000011001110;
	opcodes[103] = 16'b0111000011001111;
	//Set of Instructions for all 8 ALU Operations on R5 and Immediate Data.
	opcodes[104] = 16'b0111000011011000;
	opcodes[105] = 16'b0111000011011001;
	opcodes[106] = 16'b0111000011011010;
	opcodes[107] = 16'b0111000011011011;
	opcodes[108] = 16'b0111000011011100;
	opcodes[109] = 16'b0111000011011101;
	opcodes[110] = 16'b0111000011011110;
	opcodes[111] = 16'b0111000011011111;
	//Set of Instructions for all 8 ALU Operations on R6 and Immediate Data.
	opcodes[112] = 16'b0111000011101000;
	opcodes[113] = 16'b0111000011101001;
	opcodes[114] = 16'b0111000011101010;
	opcodes[115] = 16'b0111000011101011;
	opcodes[116] = 16'b0111000011101100;
	opcodes[117] = 16'b0111000011101101;
	opcodes[118] = 16'b0111000011101110;
	opcodes[119] = 16'b0111000011101111;
	//Set of Instructions for all 8 ALU Operations on R7 and Immediate Data.
	opcodes[120] = 16'b0111000011111000;
	opcodes[121] = 16'b0111000011111001;
	opcodes[112] = 16'b0111000011111010;
	opcodes[123] = 16'b0111000011111011;
	opcodes[124] = 16'b0111000011111100;
	opcodes[125] = 16'b0111000011111101;
	opcodes[126] = 16'b0111000011111110;
	opcodes[127] = 16'b0111000011111111;
	//Instruction for Loading new IP with Immediate Data.
	opcodes[128] = 16'b011000101000zzzz;
	opcodes[254] = 16'b0000100zzzzzzzzz;
	//Instruction for NOP.
	opcodes[255] = 16'b0011000zzzzzzzzz;
end  // Look Up Table for Instructions

always @(posedge clk)
begin
  // put clocked assignments here  
  if (enable)
      begin
      state = next_state;
      //status <= state;
      case (state)
      0:
      begin
      ibuf = ram_dataout;
      if (opcodes[ibuf][15:14] == 1)
      begin
      next_state = 1;
      end
      if (opcodes[ibuf][15:14] == 0)
      begin
      next_state = 0;
      end
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