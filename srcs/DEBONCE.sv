`timescale 1ns / 1ps
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
