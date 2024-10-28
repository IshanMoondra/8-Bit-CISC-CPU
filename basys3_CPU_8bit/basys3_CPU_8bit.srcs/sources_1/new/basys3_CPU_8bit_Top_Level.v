`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 21:44:16
// Design Name: 
// Module Name: basys3_trial_top_level
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: sw array is input, led array is output, LED register is input, SWITCH
//                      register is output. Could use a single Buttons register instead of btnU, 
//                      and the like. Debouncing of the Buttons and Switches should be 
//                      looked at in the next revision.
// 
//////////////////////////////////////////////////////////////////////////////////


module basys3_CPU_8bit_Top_Level(
    input clk,
//    input [15:0]sw,
//    input btnC,
//    input btnD,
//    input btnL,
//    input btnR,
//    input btnU,
    output reg [15:0]led,
    output reg [6:0] seg,
    output reg dp,
    output reg [3:0] an
    );
reg ENABLE;
reg [15:0] CLK_STABLE;
reg [4:0] buttons;
reg [4:0] debounced_buttons;
reg [22:0] debounce_clock;
reg [25:0] seg_clock;
reg [6:0] seg_codes [15:0];
reg [3:0] seg_codes_index;
reg [1:0] seg_index;

wire [2:0] FLAG;
reg [2:0] FLAG_OUT;
reg [7:0] RES_OUT;
wire [7:0] RES;
wire [1:0] STATUS;
reg [1:0] STATUS_OUT;
wire [7:0] IPNEXT;
reg [7:0] IPNEXT_OUT;

control_unit CPU(
    .enable(ENABLE),
//    .clk(clk),
    .clk(seg_clock[23]),
    .flag(FLAG),
    .final(RES),
    .status(STATUS),
    .ipnext(IPNEXT));    
    

initial
    begin
        CLK_STABLE <= 0;
        ENABLE <= 0;
        led <= 0;
        buttons <= 0;
        debounced_buttons <= 0;
        debounce_clock <= 0;
        
        FLAG_OUT <= 0;
        RES_OUT <= 0;
        STATUS_OUT <= 0;
        IPNEXT_OUT <= 0;
        
        seg_codes_index <= 0;
        seg_clock <= 0;
        dp <= 1;
        an <= 0;
        seg_index <= 0;
        seg <= 0;
        
        seg_codes[0] <= 7'h40;
        seg_codes[1] <= 7'h79;
        seg_codes[2] <= 7'h24; 
        seg_codes[3] <= 7'h30;
        seg_codes[4] <= 7'h19;
        seg_codes[5] <= 7'h12;
        seg_codes[6] <= 7'h02;
        seg_codes[7] <= 7'h78;
        seg_codes[8] <= 7'h00;
        seg_codes[9] <= 7'h10;
        seg_codes[10] <= 7'h08;
        seg_codes[11] <= 7'h03;
        seg_codes[12] <= 7'h46;
        seg_codes[13] <= 7'h21;
        seg_codes[14] <= 7'h06;
        seg_codes[15] <= 7'h0E;
        //CLK <= 0;
        //SW <= 0;
    end

always@(posedge clk)
begin
    if (CLK_STABLE == 65535)
        begin
            ENABLE <= 1;
            dp <= 0;
        end
    else
        begin
            CLK_STABLE <= CLK_STABLE + 1;
            dp <= 1;
        end
end
    
always@(posedge clk)
    begin
         //buttons = {btnC, btnU, btnR, btnD, btnL};
         
         seg_clock <= seg_clock + 1;
         FLAG_OUT <= FLAG;
         RES_OUT <= RES;
         IPNEXT_OUT <= IPNEXT;
         STATUS_OUT <= STATUS;
         led[15:14] <= STATUS_OUT;
         led[13:11] <= FLAG_OUT;
         led[10:0] <= 0;
           
    end
    
always@(posedge seg_clock[15])
    begin
        case(seg_index)
        0: //Anode 0 controls 2nd Digit from the Right. 
            begin
                an <= 4'b0111;
                seg_codes_index <= IPNEXT[3:0];
            end
        1: //Anode 1 controls 3rd Digit from the Right.
            begin
                an <= 4'b1011;
                seg_codes_index <= RES_OUT[7:4];
            end
        2: //Anode 2 controls 4th Digit from the Right. 
            begin
                an <= 4'b1101;
                seg_codes_index <= RES_OUT[3:0];
            end
        3: //Anode 3 controls 1st Digit from the Right. 
            begin
                an <= 4'b1110;
                seg_codes_index <= IPNEXT[7:4];
            end
        endcase
        seg_index <= seg_index + 1;
        seg <= seg_codes[seg_codes_index];
    end  
     
/*
always@(posedge clk)
    begin
        buttons <= {btnC, btnU, btnR, btnD, btnL};
        debounce_clock <= debounce_clock + 1;
    end
*/

/*
always@(posedge debounce_clock[22])
    begin
        debounced_buttons <= buttons;
        if (debounced_buttons[4])
         begin
            if (dp <= 0)
                dp <= 1;
            else
                dp <= 0;
         end
    end
*/

endmodule