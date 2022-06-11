`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 16:50:31
// Design Name: 
// Module Name: mux3
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
module mux3 #(parameter WIDTH = 32)
             (input [WIDTH-1:0] x, y, z,
    input [1:0] s, 
    output [WIDTH-1:0] result);
    assign #1 y = s[1] ? z : (s[0] ? y : x); 
endmodule
