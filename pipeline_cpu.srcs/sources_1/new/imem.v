`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 15:32:44
// Design Name: 
// Module Name: imem
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


module imem(input [31:0] a,
output [31:0] rd);
reg [31:0] RAM[63:0];
initial
begin
$readmemh("memfile.mem",RAM);
end
assign rd = RAM[a<<2];
endmodule
