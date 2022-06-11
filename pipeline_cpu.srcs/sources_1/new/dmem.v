`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 15:37:52
// Design Name: 
// Module Name: dmem
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


module dmem(input clk, we,
input [31:0] a, wd,
output [31:0] rd);
reg [31:0] RAM[0:63];
integer i;
initial
begin
for (i=0;i<64;i=i+1)
RAM[i]=0;
end
assign rd = RAM[a[31:2]];
always @(posedge clk)
if (we)
RAM[a[31:2]] <= wd;
endmodule
