`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 16:42:42
// Design Name: 
// Module Name: alu
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


module alu(
input [31:0] A,B,
input [2:0] aluop,
output reg [31:0] result
    );
    always@(*)
    begin
    case(aluop)
    3'b000:result <= A & B;
    3'b001:result <= A | B;
    3'b010:result <= A+B;
    3'b110:result <= A-B;
    3'b111:if (A<B) result<=1;else result<=0;
    endcase
    end
endmodule
