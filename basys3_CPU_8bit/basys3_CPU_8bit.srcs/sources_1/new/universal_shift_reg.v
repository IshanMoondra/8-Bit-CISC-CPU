`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2023 11:47:52
// Design Name: 
// Module Name: universal_shift_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module universal_shift_reg(
    input clk,
    input r_shift,
    input l_shift,
    input p_load,
    input s_load,
    input [7:0] p_data_in,
    input s_data_in,
    output reg [7:0] p_data_out,
    output reg s_data_out    
    );

reg [7:0] shift_reg;
reg [2:0] r_index;
reg [2:0] l_index;

initial 
begin
    shift_reg <= 0;
    p_data_out <= 0;
    s_data_out <= 0;
    r_index <= 0;
    l_index <= 0;
end

always@(posedge clk)
begin
    if (r_shift)
    begin
        /*
        case(r_index)
            0: s_data_out <= shift_reg[0];
            1: s_data_out <= shift_reg[1];
            2: s_data_out <= shift_reg[2];
            3: s_data_out <= shift_reg[3];
            4: s_data_out <= shift_reg[4];
            5: s_data_out <= shift_reg[5];
            6: s_data_out <= shift_reg[6];
            7: s_data_out <= shift_reg[7];
        endcase
        r_index = r_index + 1;
        */
        
        if (s_load)
            shift_reg[0] <= s_data_in;
        
        shift_reg = {shift_reg[0], shift_reg[7:1]};
        s_data_out <= shift_reg[0];
    end
    
    if (l_shift)
    begin
        /*
        case(l_index)
            0: s_data_out <= shift_reg[7];
            1: s_data_out <= shift_reg[6];
            2: s_data_out <= shift_reg[5];
            3: s_data_out <= shift_reg[4];
            4: s_data_out <= shift_reg[3];
            5: s_data_out <= shift_reg[2];
            6: s_data_out <= shift_reg[1];
            7: s_data_out <= shift_reg[0];
        endcase
        l_index = l_index + 1;
        */
        
        if (s_load)
            shift_reg[7] <= s_data_in;
        
        shift_reg <= {shift_reg[6:0], shift_reg[7]};
        s_data_out <= shift_reg[7];
    end
    
    if (p_load)
        shift_reg <= p_data_in;
    
    p_data_out <= shift_reg;
    
end

endmodule
