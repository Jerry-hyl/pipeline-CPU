`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 16:01:36
// Design Name: 
// Module Name: regfile
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


module regfile(
input clk,we,
input [4:0] ra1,ra2,wa3,
input [31:0] wd3,
output [31:0] rd1,rd2
    );
    reg [31:0] rf[0:31];
    integer i;
    always@(negedge clk)
    begin
    if (we)
    rf[wa3] <=wd3;
    end
assign rd1=(ra1!=0)? rf[ra1]:0;
assign rd2=(ra2!=0)? rf[ra2]:0;
endmodule
