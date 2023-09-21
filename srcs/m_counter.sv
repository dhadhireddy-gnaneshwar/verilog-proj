`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2023 13:04:32
// Design Name: 
// Module Name: m_counter
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


module m_counter
     #(parameter max_cnt=10)
     (
        input logic clk,
        input logic rst=0,
        output logic cout_tick=0,
        output logic [$clog2(max_cnt) - 1:0] prst_cnt
    );
     
         localparam N = $clog2(max_cnt);
  logic [N-1:0] nxt_reg,prst_reg;
  
  initial
    begin
      prst_reg=0000;
         cout_tick=0;
        nxt_reg = 0;
    end
    
  always@(posedge clk)
    begin 
      if(rst==1) 
        begin
        prst_reg=0000;
         cout_tick=0;
        nxt_reg = 0;
      end
      
      
      else
        begin
        prst_reg=nxt_reg;
          if(prst_reg==max_cnt-1) begin
            nxt_reg = 0;
            cout_tick=1;
          end
          else begin
            nxt_reg++;
           cout_tick=0;
          end
        end
      prst_cnt=prst_reg;
    end
endmodule

