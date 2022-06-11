`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 15:24:55
// Design Name: 
// Module Name: maindec
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


module maindec(input [5:0] op,
output memtoreg, memwrite,
output branch, alusrc,
output regdst, regwrite,
output jump,
output [1:0] aluop);
always @(*)
case(op)
6'b000000: //Rtype
begin
	regwrite=1;
	regdst=1;
	alusrc=0;
	branch=0;
	memwrite=0;
	memtoreg=0;
	jump=0;
	aluop=2'b10;
end
6'b100011: //lw
begin
	regwrite=1;
	regdst=0;
	alusrc=1;
	branch=0;
	memwrite=0;
	memtoreg=1;
	jump=0;
	aluop=2'b00;
end
6'b101011: //sw
begin
	regwrite=0;
	regdst=0;
	alusrc=1;
	branch=0;
	memwrite=1;
	memtoreg=0;
	jump=0;
	aluop=2'b00;
end
6'b000100: //beq
begin
	regwrite=0;
	regdst=0;
	alusrc=0;
	branch=1;
	memwrite=0;
	memtoreg=0;
	jump=0;
	aluop=2'b01;
end
6'b001000: //addi
begin
	regwrite=1;
	regdst=0;
	alusrc=1;
	branch=0;
	memwrite=0;
	memtoreg=0;
	jump=0;
	aluop=2'b00;
end
6'b000010: //j
begin
	regwrite=0;
	regdst=0;
	alusrc=0;
	branch=0;
	memwrite=0;
	memtoreg=0;
	jump=1;
	aluop=2'b00;
end
endcase
endmodule
