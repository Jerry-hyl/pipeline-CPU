`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 16:59:06
// Design Name: 
// Module Name: flopenr
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


module flopenr #(parameter WIDTH=8)(
input clk,reset,en,
input [WIDTH-1:0] d,
output reg [WIDTH-1:0] q
    );
always @(posedge clk, posedge reset)
if (reset) q <= #1 0;
else if (en) q <= #1 d;
endmodule
