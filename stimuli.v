`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2025 11:58:35
// Design Name: 
// Module Name: stimuli
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

module stimuli;
    reg[7:0] A,B;
    reg[3:0] Sel;
    wire[7:0] Out;
    wire Carry;
    
    integer i;
    ALU uut(A,B,Sel,Out,Carry);
    initial
        begin    
        A = 8'h0A;
        B = 4'h02;
        Sel = 4'h0;
        
        for (i=0;i<=15;i=i+1)
        begin
            Sel = Sel + 8'h01;
            #10;
        end
        
        A = 8'hF6;
        B = 8'h0A;
        
        end
endmodule
