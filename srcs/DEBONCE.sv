`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2023 12:51:52
// Design Name: 
// Module Name: DEBONCE
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


module DEBONCE(
   input logic sw,
   input logic clk,
   output logic db;
    );
    
    logic [3:0] timer;
    typedef enum {s0=10,s1,s2}state;
    state pr_state,nxt_state;
    
    
endmodule
