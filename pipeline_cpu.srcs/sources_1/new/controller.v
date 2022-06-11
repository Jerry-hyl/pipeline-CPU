`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 15:23:38
// Design Name: 
// Module Name: controller
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


module controller(input clk, reset,
input [5:0] opD, functD,
input flushE, equalD,
output memtoregE, memtoregM,
output memtoregW, memwriteM,
output pcsrcD, branchD, alusrcE,
output regdstE, regwriteE,
output regwriteM, regwriteW,
output jumpD,
output [2:0] alucontrolE);
wire [1:0] aluopD;
wire memtoregD, memwriteD, alusrcD,
regdstD, regwriteD;
wire [2:0] alucontrolD;
wire memwriteE;
maindec md(opD, memtoregD, memwriteD, branchD,alusrcD, regdstD, regwriteD, jumpD,aluopD);
aludec ad(functD, aluopD, alucontrolD);
assign pcsrcD = branchD & equalD;
// pipeline register
floprc #(8) regE(clk, reset, flushE,
{memtoregD, memwriteD, alusrcD,
regdstD, regwriteD, alucontrolD},
{memtoregE, memwriteE, alusrcE,
regdstE, regwriteE, alucontrolE});
flopr #(3) regM(clk, reset,
{memtoregE, memwriteE, regwriteE},
{memtoregM, memwriteM, regwriteM});
flopr #(2) regW(clk, reset,
{memtoregM, regwriteM},
{memtoregW, regwriteW});
endmodule
