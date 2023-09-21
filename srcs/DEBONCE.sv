`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 30.07.2023 13:04:32
// Design Name: MODULUS COUNTER
// Module Name: m_counter
// Project Name: MODULUS COUNTER
// Tool Versions: VIVADO 2015
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Code your design here

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


`timescale 1ns / 1ps




module debounce(
input logic sw,
input logic rst,
input logic clk,
output logic db
    );
    logic tick_flag;
  typedef enum { z1=0,z2=1,z3=2,z4=3,o1=4,o2=5,o3=6,o4=7} state;
    
    // states
    state nxt_st,pr_st;
    
    m_counter #(.max_cnt(10)) t ( .clk(clk), .rst(rst), .prst_cnt(),.cout_tick(tick_flag) );
    
    //state defining
  always_ff@(posedge clk, posedge rst)
    begin
                if (rst)
                    pr_st=z1;
                else
                begin
                    pr_st=nxt_st;
                 

          
                  case(pr_st)
                z1:begin
                    if(sw==1)
                        nxt_st=z2;
                    else
                        nxt_st=z1;
                   end
                z2:begin
                        if(sw==1)
                        begin
                        if(tick_flag)
                        nxt_st=z3;
                        
                        else
                        nxt_st=z2;
                        end
                        else
                        nxt_st=z1;
                   end
                z3:begin
                     if(sw==1)
                        begin
                          if(tick_flag)
                              nxt_st=z4;
                                       
                            else
                              nxt_st=z3;
                           end
                           else
                            nxt_st=z1;
                   end
                z4:begin
                        if(sw==1)
                      		begin
                        		if(tick_flag)
                        			nxt_st=o1;               
                        		else
                        			nxt_st=z4;
                        	end
                        else
                         nxt_st=z1;
                end
                o1:
                  begin
                    
                    if((sw==0)) begin
                    
                      nxt_st=o2;
                      end
                    else
                      nxt_st=o1;
                  end
              o2:
                begin
                  if( (sw==0))
                    
                    if(tick_flag )
                      begin
                      	nxt_st=o3;
                      	
                      end
                      else
                      	nxt_st=o2;
                  
                   else
                     nxt_st=o1;
                    
                end
              o3:
                begin
                  if( (sw==0))
                    if(tick_flag )
                     	begin
                     		nxt_st=o4;
                     	
                    	end
                     else
                     nxt_st=o3;
                    else
                     nxt_st=o1;
                end
              o4:
                begin
                                
                  if( (sw==0))
                  	if(tick_flag )
                  		begin
                  		
                  			nxt_st=z1;
                  		end
                  	else
                  		nxt_st=o4;
                  else
                  	nxt_st=o1;
                  end
                   default: begin nxt_st=z1; db =0; end
           endcase
                  
                  
                  //output logic
                  if(pr_st<= z4)
                    db=0;
                  else
                    db=1;
            
     end    
    end
endmodule
