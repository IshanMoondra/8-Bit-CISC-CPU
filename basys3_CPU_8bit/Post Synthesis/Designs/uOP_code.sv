/*
uOP_code.sv
Design file for the micro op code table/collection for Synthesis.
*/

module uOP_code
    (
        input wire clk,
        input wire rst_n,
        input wire [7:0] instruction,
		output reg [7:0] ibuf,
        output reg [15:0] control_signals
    );

reg [15:0]opcodes[0:255];

 //Set of Instructions to load Registers with Immediate Data.
	 assign opcodes[0] = 16'b011000000000XXXX;
	 assign opcodes[1] = 16'b011000000001XXXX;
	 assign opcodes[2] = 16'b011000000010XXXX;
	 assign opcodes[3] = 16'b011000000011XXXX;
	 assign opcodes[4] = 16'b011000000100XXXX;
	 assign opcodes[5] = 16'b011000000101XXXX;
	 assign opcodes[6] = 16'b011000000110XXXX;
	 assign opcodes[7] = 16'b011000000111XXXX;
	 //Set of Instructions to Write Contents of Register to Disk. (No Provision of Disk at Current Time.)
	 assign opcodes[8] = 16'b001000001000XXXX;
	 assign opcodes[9] = 16'b001000001001XXXX;
	assign opcodes[10] = 16'b001000001010XXXX;
	assign opcodes[11] = 16'b001000001011XXXX;
	assign opcodes[12] = 16'b001000001100XXXX;
	assign opcodes[13] = 16'b001000001101XXXX;
	assign opcodes[14] = 16'b001000001110XXXX;
	assign opcodes[15] = 16'b001000001111XXXX;
	//Set of Instructions to Swap Contents of Registers.
	//Note: Only R0 and R1 can be destinations for the Swap.
	assign opcodes[16] = 16'b001100010000XXXX;
	assign opcodes[17] = 16'b001100010001XXXX;
	assign opcodes[18] = 16'b001100010010XXXX;
	assign opcodes[19] = 16'b001100010011XXXX;
	assign opcodes[20] = 16'b001100010100XXXX;
	assign opcodes[21] = 16'b001100010101XXXX;
	assign opcodes[22] = 16'b001100010110XXXX;
	assign opcodes[23] = 16'b001100010111XXXX;
	//Set of Instructions to Display Contents of Registers in Pairs.
	//Note: Only First 4 Instructions are defined.
	assign opcodes[24] = 16'b001000011000XXXX;
	assign opcodes[25] = 16'b001000011001XXXX;
	assign opcodes[26] = 16'b001000011010XXXX;
	assign opcodes[27] = 16'b001000011011XXXX;
	assign opcodes[28] = 16'b001000011100XXXX;
	assign opcodes[29] = 16'b001000011101XXXX;
	assign opcodes[30] = 16'b001000011110XXXX;
	assign opcodes[31] = 16'b001000011111XXXX;
	//Set of Instructions to Operate on Register Pairs with ALU operations.
	//Set of Instructions for all 8 ALU Operations on R0 & R1.
	assign opcodes[32] = 16'b0011000100000000;
	assign opcodes[33] = 16'b0011000100000001;
	assign opcodes[34] = 16'b0011000100000010;
	assign opcodes[35] = 16'b0011000100000011;
	assign opcodes[36] = 16'b0011000100000100;
	assign opcodes[37] = 16'b0011000100000101;
	assign opcodes[38] = 16'b0011000100000110;
	assign opcodes[39] = 16'b0011000100000111;
	//Set of Instructions for all 8 ALU Operations on R2 & R3.
	assign opcodes[40] = 16'b0111000100010000;
	assign opcodes[41] = 16'b0111000100010001;
	assign opcodes[42] = 16'b0111000100010010;
	assign opcodes[43] = 16'b0111000100010011;
	assign opcodes[44] = 16'b0111000100010100;
	assign opcodes[45] = 16'b0111000100010101;
	assign opcodes[46] = 16'b0111000100010110;
	assign opcodes[47] = 16'b0111000100010111;
	//Set of Instructions for all 8 ALU Operations on R4 & R5.
	assign opcodes[48] = 16'b0111000100100000;
	assign opcodes[49] = 16'b0111000100100001;
	assign opcodes[50] = 16'b0111000100100010;
	assign opcodes[51] = 16'b0111000100100011;
	assign opcodes[52] = 16'b0111000100100100;
	assign opcodes[53] = 16'b0111000100100101;
	assign opcodes[54] = 16'b0111000100100110;
	assign opcodes[55] = 16'b0111000100100111;
	//Set of Instructions for all 8 ALU Operations on R6 & R7.
	assign opcodes[56] = 16'b0111000100110000;
	assign opcodes[57] = 16'b0111000100110001;
	assign opcodes[58] = 16'b0111000100110010;
	assign opcodes[59] = 16'b0111000100110011;
	assign opcodes[60] = 16'b0111000100110100;
	assign opcodes[61] = 16'b0111000100110101;
	assign opcodes[62] = 16'b0111000100110110;
	assign opcodes[63] = 16'b0111000100110111;
	//Set of Instructions for all 8 ALU Operations on R0 and Immediate Data.
	assign opcodes[64] = 16'b0111000010001000;
	assign opcodes[65] = 16'b0111000010001001;
	assign opcodes[66] = 16'b0111000010001010;
	assign opcodes[67] = 16'b0111000010001011;
	assign opcodes[68] = 16'b0111000010001100;
	assign opcodes[69] = 16'b0111000010001101;
	assign opcodes[70] = 16'b0111000010001110;
	assign opcodes[71] = 16'b0111000010001111;
	//Set of Instructions for all 8 ALU Operations on R1 and Immediate Data.
	assign opcodes[72] = 16'b0111000010011000;
	assign opcodes[73] = 16'b0111000010011001;
	assign opcodes[74] = 16'b0111000010011010;
	assign opcodes[75] = 16'b0111000010011011;
	assign opcodes[76] = 16'b0111000010011100;
	assign opcodes[77] = 16'b0111000010011101;
	assign opcodes[78] = 16'b0111000010011110;
	assign opcodes[79] = 16'b0111000010011111;
	//Set of Instructions for all 8 ALU Operations on R2 and Immediate Data.
	assign opcodes[80] = 16'b0111000010101000;
	assign opcodes[81] = 16'b0111000010101001;
	assign opcodes[82] = 16'b0111000010101010;
	assign opcodes[83] = 16'b0111000010101011;
	assign opcodes[84] = 16'b0111000010101100;
	assign opcodes[85] = 16'b0111000010101101;
	assign opcodes[86] = 16'b0111000010101110;
	assign opcodes[87] = 16'b0111000010101111;
	//Set of Instructions for all 8 ALU Operations on R3 and Immediate Data.
	assign opcodes[88] = 16'b0111000010111000;
	assign opcodes[89] = 16'b0111000010111001;
	assign opcodes[90] = 16'b0111000010111010;
	assign opcodes[91] = 16'b0111000010111011;
	assign opcodes[92] = 16'b0111000010111100;
	assign opcodes[93] = 16'b0111000010111101;
	assign opcodes[94] = 16'b0111000010111110;
	assign opcodes[95] = 16'b0111000010111111;
	//Set of Instructions for all 8 ALU Operations on R4 and Immediate Data.
	assign opcodes[96] = 16'b0111000011001000;
	assign opcodes[97] = 16'b0111000011001001;
	assign opcodes[98] = 16'b0111000011001010;
	assign opcodes[99] = 16'b0111000011001011;
	assign opcodes[100] = 16'b0111000011001100;
	assign opcodes[101] = 16'b0111000011001101;
	assign opcodes[102] = 16'b0111000011001110;
	assign opcodes[103] = 16'b0111000011001111;
	//Set of Instructions for all 8 ALU Operations on R5 and Immediate Data.
	assign opcodes[104] = 16'b0111000011011000;
	assign opcodes[105] = 16'b0111000011011001;
	assign opcodes[106] = 16'b0111000011011010;
	assign opcodes[107] = 16'b0111000011011011;
	assign opcodes[108] = 16'b0111000011011100;
	assign opcodes[109] = 16'b0111000011011101;
	assign opcodes[110] = 16'b0111000011011110;
	assign opcodes[111] = 16'b0111000011011111;
	//Set of Instructions for all 8 ALU Operations on R6 and Immediate Data.
	assign opcodes[112] = 16'b0111000011101000;
	assign opcodes[113] = 16'b0111000011101001;
	assign opcodes[114] = 16'b0111000011101010;
	assign opcodes[115] = 16'b0111000011101011;
	assign opcodes[116] = 16'b0111000011101100;
	assign opcodes[117] = 16'b0111000011101101;
	assign opcodes[118] = 16'b0111000011101110;
	assign opcodes[119] = 16'b0111000011101111;
	//Set of Instructions for all 8 ALU Operations on R7 and Immediate Data.
	assign opcodes[120] = 16'b0111000011111000;
	assign opcodes[121] = 16'b0111000011111001;
	assign opcodes[122] = 16'b0111000011111010;
	assign opcodes[123] = 16'b0111000011111011;
	assign opcodes[124] = 16'b0111000011111100;
	assign opcodes[125] = 16'b0111000011111101;
	assign opcodes[126] = 16'b0111000011111110;
	assign opcodes[127] = 16'b0111000011111111;
	//Instruction for Loading new IP with Immediate Data.
	assign opcodes[128] = 16'b011000101000XXXX;
	assign opcodes[254] = 16'b0000100XXXXXXXXX;
	//Instruction for NOP.
	assign opcodes[255] = 16'b0011000XXXXXXXXX;


always_ff @(posedge clk, negedge rst_n)
begin
    if (!rst_n)
		begin
			control_signals <= 16'b0011000XXXXXXXXX;
			ibuf <= 8'hFF;
		end
    else
		begin
			control_signals <= opcodes[instruction];
			ibuf <= instruction;
		end
end

endmodule
