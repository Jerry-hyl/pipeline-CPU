`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 15:30:02
// Design Name: 
// Module Name: hazard
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


module hazard(input [4:0] rsD, rtD, rsE, rtE,
input [4:0] writeregE,
writeregM, writeregW,
input regwriteE, regwriteM,
regwriteW,
input memtoregE, memtoregM, branchD,
output forwardaD, forwardbD,
output reg [1:0] forwardaE, forwardbE,
output stallF, stallD, flushE);
wire lwstallD, branchstallD;
assign forwardaD = (rsD !=0 & rsD == writeregM &
regwriteM);
assign forwardbD = (rtD !=0 & rtD == writeregM &
regwriteM);
always @(*)
begin
forwardaE = 2'b00; forwardbE = 2'b00;
if (rsE != 0)
if (rsE == writeregM & regwriteM)
forwardaE = 2'b10;
else if (rsE == writeregW & regwriteW)
forwardaE = 2'b01;
if (rtE != 0)
if (rtE == writeregM & regwriteM)
forwardbE = 2'b10;
else if (rtE == writeregW & regwriteW)
forwardbE = 2'b01;
end
assign lwstallD = memtoregE &
(rtE == rsD | rtE == rtD);
assign branchstallD = branchD &
(regwriteE &
(writeregE == rsD | writeregE == rtD) |
memtoregM &
(writeregM == rsD | writeregM == rtD));
assign  stallD = lwstallD | branchstallD;
assign  stallF = stallD;
assign  flushE = stallD;
endmodule
