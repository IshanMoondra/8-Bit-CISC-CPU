module register_stack
  (
    input  wire clk,
    input  wire rst_n,
    input  wire [1:0]ropsel,
    input  wire [2:0]regsel,
    input  wire [7:0]rdatain,
    input  wire [7:0]aluin,
    input  wire [2:0]alufin,
    output reg  [7:0]rdataout1,
    output reg  [7:0]rdataout2
  );

reg [7:0]registers [0:7];

always @(posedge clk, negedge rst_n)
begin
  if (!rst_n)
    begin
      registers[0] <= 8'h00;
      registers[1] <= 8'h00;
      registers[2] <= 8'h00;
      registers[3] <= 8'h00;
      registers[4] <= 8'h00;
      registers[5] <= 8'h00;
      registers[6] <= 8'h00;
      registers[7] <= 8'h00;
    end
  else
    begin
      registers[7] <= aluin;
      registers[6] <= alufin;
      if (ropsel == 0)
        begin
        rdataout1 <= rdataout1;
        rdataout2 <= rdataout2;
        case (regsel)
        0: registers[0] <= rdatain; 
        1: registers[1] <= rdatain;
        2: registers[2] <= rdatain;
        3: registers[3] <= rdatain;
        4: registers[4] <= rdatain;
        5: registers[5] <= rdatain;
        6: registers[6] <= rdatain;
        7: registers[7] <= rdatain;
        endcase
        end
      else if (ropsel == 1)
        begin
        rdataout2 <= rdataout2;
        case (regsel)
        0: rdataout1 <= registers[0];
        1: rdataout1 <= registers[1];
        2: rdataout1 <= registers[2];
        3: rdataout1 <= registers[3];
        4: rdataout1 <= registers[4];
        5: rdataout1 <= registers[5];
        6: rdataout1 <= registers[6];
        7: rdataout1 <= registers[7];
        endcase
        end
      else if (ropsel == 2)
        begin
        case (regsel)
        0: begin
            rdataout1 <= registers[0];
            rdataout2 <= registers[1];
          end
        1: begin
            rdataout1 <= registers[2];
            rdataout2 <= registers[3];
          end
        2: begin
            rdataout1 <= registers[4];
            rdataout2 <= registers[5];
          end
        3: begin
            rdataout1 <= registers[6];
            rdataout2 <= registers[7];
          end
        default: begin
              rdataout1 <= rdataout1;
              rdataout2 <= rdataout2;
              end
          
        endcase
        end
      else if (ropsel == 3)
        begin
        case (regsel)
        0: registers[0] <= registers[1];
        1: registers[0] <= registers[2];
        2: registers[0] <= registers[6];
        3: registers[0] <= registers[7];
        4: registers[1] <= registers[0];
        5: registers[1] <= registers[2];
        6: registers[1] <= registers[6];
        7: registers[1] <= registers[7];
        endcase
        end		  
      else
        begin
        rdataout1 <= rdataout1;
        rdataout2 <= rdataout2;
        end
    end
end
endmodule // register_stack
