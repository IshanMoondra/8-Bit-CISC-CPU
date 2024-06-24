`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2023 14:50:27
// Design Name: 
// Module Name: pipeline_v1
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


module pipeline_v1(
    input clk,
    input busy,
    input flush,
    output reg full,
    output reg empty,
    input [7:0] data_in,
    output reg [7:0] data_out
    );
    
reg [7:0] queue [7:0];  // Create 8 Byte Queue.      
reg [2:0] head;         //Data goes to CPU from Head.
reg [2:0] tail;         //Data comes to the Queue from Tail.

initial
begin
    full <= 0;
    data_out <= 0;      //Replace with OpCode for NOP.
    head <= 0;
    tail <= 0;
end
    
always@(posedge clk)
begin
    if (flush)
    begin
        queue[0] <= 0;
        queue[1] <= 0;
        queue[2] <= 0;
        queue[3] <= 0;
        queue[4] <= 0;
        queue[5] <= 0;
        queue[6] <= 0;
        queue[7] <= 0;
        head <= 0;
        tail <= 0;
    end
    
    if (tail + 1 == head)
        full <= 1;
    else
        full <= 0;
    
    if (!full)
    begin
        queue[tail] <= data_in;
        tail = tail + 1;
    end    
    
    
end    

always@(negedge clk)
begin
    if (!busy)
        begin
            if (head == tail)
            begin
                data_out <=  0;     //Pipeline Empty, stall the processor. 
            end
            else
            begin
                data_out <= queue[head];
                head <= head + 1;
            end
        end
end
    
endmodule
