`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2023 14:34:32
// Design Name: 
// Module Name: universal_shift_reg_testbench
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


module universal_shift_reg_testbench();

reg CLK;
reg R_S;
reg L_S;
reg P_L;
reg S_L;
reg [7:0] P_DIN;
reg S_DIN;
wire [7:0] P_DOUT;
wire S_DOUT;

universal_shift_reg Test
    (
    .clk(CLK),
    .r_shift(R_S),
    .l_shift(L_S),
    .p_load(P_L),
    .s_load(S_L),
    .p_data_in(P_DIN),
    .s_data_in(S_DIN),
    .p_data_out(P_DOUT),
    .s_data_out(S_DOUT)
    );

reg [5:0] counter;
reg [7:0] temp;

initial
begin   
    counter <= 0;
    temp <= 0;
    L_S <= 0;
    R_S <= 0;
    S_L <= 0;
    P_L <= 1;
    P_DIN <= 131;
    S_DIN <= 0;
    
    CLK <= 0;
    #10;            //Parallel Load Test.
    CLK <= 1;
    #10;
    
    P_L <= 0;
    L_S <= 1;       //Left Shift Test.
    
    for(counter = 0; counter < 8; counter = counter + 1)
    begin      
        CLK <= 0;
        #10;
        CLK <= 1;
        #10;
    end
    
    L_S <= 0;       //Left Shift Test Ends.
    CLK <= 0;
    #10;
    CLK <= 1;
    #10;
    
    R_S <= 1;       //Right Shift Test.
    
    for(counter = 0; counter < 8; counter = counter + 1)
    begin      
        CLK <= 0;
        #10;
        CLK <= 1;
        #10;
    end    
    
    R_S <= 0;       //Right Shift Test Ends. 
    
    temp <= 65;     //Serial Load Test.
    
    CLK <= 0;
    #10;
    CLK <= 1;
    #10;
    
    S_L <= 1;       //Serial Load Right Shift Test.
    R_S <= 1; 
    
    for(counter = 0; counter < 8; counter = counter + 1)
    begin      
        S_DIN <= temp[counter];
        CLK <= 0;
        #10;
        CLK <= 1;
        #10;
    end 
    
    S_L <= 0;
    R_S <= 1;       //Serial Load Right Shift Load Ends.      
                    //Serial Load Right Shift Output.
    for(counter = 0; counter < 8; counter = counter + 1)
    begin      
        CLK <= 0;
        #10;
        CLK <= 1;
        #10;
    end
    
    temp <= 96;
    R_S <= 0;
    
    CLK <= 0;
    #10;
    CLK <= 1;
    #10;
    
    S_L <= 1;       //Serial Load Left Shift Test.
    L_S <= 1;
    
    for(counter = 0; counter < 8; counter = counter + 1)
    begin      
        S_DIN <= temp[7 - counter];
        CLK <= 0;
        #10;
        CLK <= 1;
        #10;
    end
    
    S_L <= 0;
    L_S <= 0;       //Serial Load Left Shift Load Ends.
    
    CLK <= 0;
    #10;
    CLK <= 1;
    #10;
    
    L_S <= 1;       //Serial Load Left Shift Outputs.
    
    for(counter = 0; counter < 8; counter = counter + 1)
    begin      
        CLK <= 0;
        #10;
        CLK <= 1;
        #10;
    end
    
end

endmodule
