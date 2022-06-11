`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 15:19:59
// Design Name: 
// Module Name: mips
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


module mips(input clk, reset,
output [31:0] pcF,
input [31:0] instrF,
output memwriteM,
output [31:0] aluoutM, writedataM,
input [31:0] readdataM);
wire [5:0] opD, functD;
wire regdstE, alusrcE,
pcsrcD,
memtoregE, memtoregM, memtoregW,
regwriteE, regwriteM, regwriteW;
wire [2:0] alucontrolE;
wire flushE, equalD;
wire branchD, jumpD;
controller c(clk, reset, opD, functD, flushE,equalD,memtoregE, memtoregM,memtoregW, memwriteM, pcsrcD,branchD,alusrcE, regdstE, regwriteE,regwriteM, regwriteW, jumpD,alucontrolE);
datapath dp(clk, reset, memtoregE, memtoregM,memtoregW, pcsrcD, branchD,alusrcE, regdstE, regwriteE,regwriteM, regwriteW,memwriteM, jumpD,alucontrolE,equalD, pcF, instrF,aluoutM, writedataM, readdataM,opD, functD, flushE);
endmodule
