`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 19:17:14
// Design Name: 
// Module Name: top
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


module top(input clk, reset,
           output [31:0] writedata, dataadr,
           output memwrite);
    wire [31:0] pc,instr, readdata;
    mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
    imem im(pc, instr);
    dmem dm(clk, memwrite, dataadr, writedata, readdata);
endmodule
