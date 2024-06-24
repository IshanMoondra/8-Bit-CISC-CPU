`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2023 17:11:17
// Design Name: 
// Module Name: pipeline_v1_testbench
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


module pipeline_v1_testbench();

reg clk;
reg flush;
reg busy;
reg [7:0] data_in;
wire full;
wire [7:0] data_out;

// Instantiate the pipeline module
pipeline_v1 dut (
.clk(clk),
.busy(busy),
.flush(flush),
.data_in(data_in),
.full(full),
.data_out(data_out)
);

integer i;

initial begin
// Initialize testbench signals
clk <= 0;
flush <= 0;
busy <= 0;
data_in <= 196;
i <= 0;

for ( i = 0; i < 4; i = i + 1)
begin    
    data_in <= i;

    if (i == 2)
    busy <= 1;
    else
    busy <= 0;
    
    
    #10;
    clk <= 0;
    #10;
    clk <= 1; 
end

data_in <= 0;

for ( i = 0; i < 4; i = i + 1)
begin    
    if (i == 2)
    busy <= 1;
    else
    busy <= 0;
    
    #10;
    clk <= 0;
    #10;
    clk <= 1; 
end

#10; 

end

endmodule

