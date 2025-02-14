`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2025 10:25:01
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0] A,
    input [7:0] B,
    input [3:0] Sel,
    output [7:0] Out,
    output Carry
    );
    reg [7:0] ALU_result;
    wire [8:0]temp;
    assign Out = ALU_result;
    assign temp = {1'b0,A} + {1'b0,B};
    assign Carry = temp[8];
    always @(*)
    begin
        case(Sel)
        4'b0000: ALU_result = A + B;
        4'b0001: ALU_result = A - B;
        4'b0010: ALU_result = A * B;
        4'b0011: ALU_result = A / B;
        4'b0100: ALU_result = A<<1;
        4'b0101: ALU_result = A>>1;
        4'b0110: ALU_result = {A[6:0],A[7]};
        4'b0111: ALU_result = {A[0],A[7:1]};
        4'b1000: ALU_result = A & B;
        4'b1001: ALU_result = A | B;
        4'b1010: ALU_result = A ^ B;
        4'b1011: ALU_result = ~(A&B);
        4'b1100: ALU_result = ~(A|B);
        4'b1101: ALU_result = ~(A^B);
        4'b1110: ALU_result = (A>B)?8'd1:8'd0;
        4'b1111: ALU_result = (A==B)?8'd1:8'd0;
        default: ALU_result = A + B;
        endcase
      end
endmodule
