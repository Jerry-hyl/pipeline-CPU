`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 16:18:18
// Design Name: 
// Module Name: flopenrc
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


module flopenrc #(parameter WIDTH = 8)
(input clk, reset,
input en, clear,
input [WIDTH-1:0] d,
output reg [WIDTH-1:0] q);
always @(posedge clk, posedge reset)
if (reset) q <= #1 0;
else if (clear) q <= #1 0;
else if (en) q <= #1 d;
endmodule
