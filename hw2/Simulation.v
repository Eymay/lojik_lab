`timescale 1ns/1ps

module nor_test();
    reg a;
    reg b;
    
    wire c;
    
    nor_gate test(.i_1(a), .i_2(b), .o(c));
    
     initial begin
           a = 1;
           b = 1;
           #10;
           a = 0;
           b = 0;
           #10;
           a = 1;
           b = 0;
           #10;
           a = 0;
           b = 1;
           #10;
           a = 1;
           b = 1;
           #10;
           $finish;
       end
   endmodule
   
   module nand_test();
       reg a;
       reg b;
       
       wire c;
       
       nand_gate test(.i_1(a), .i_2(b), .o(c));
       
        initial begin
            
              a = 0;
              b = 0;
              #10;
              a = 1;
              b = 0;
              #10;
              a = 0;
              b = 1;
              #10;
              a = 1;
              b = 1;
              #10;
              $finish;
          end
      endmodule
      
 module nand3_test ();
          
          reg a;
          reg b;
          reg c;
      
          wire o;
          nand3_gate hello(.i_1(a), .i_2(b),.i_3(c), .o(o));
          
          initial begin
          
              a = 0;
              b = 0;
              c = 0;
              #10;
              a = 0;
              b = 0;
              c = 1;
              #10;
              a = 0;
              b = 1;
              c = 0;
              #10;
              a = 0;
              b = 1;
              c = 1;
              #10;
              a = 1;
              b = 0;
              c = 0;
              #10;
              a = 1;
              b = 0;
              c = 1;
              #10;
              a = 1;
              b = 1;
              c = 0;
              #10;
              a = 1;
              b = 1;
              c = 1;
              #10;
              $finish;
          end
      endmodule  
      
 module SR_test();
        reg a;
        reg b;
        
        wire o;
        wire o_not;
        
       SR_Latch test(.S(a), .R(b), .Q(o),.Q_not(o_not));
        
        initial begin
            
            
              a = 1;
              b = 0;
              #10;
              a = 0;
              b = 0;
              #10;
              a = 0;
              b = 1;
              #10;
              a = 1;
              b = 1;
              #10;
              $finish;
          end
            endmodule
 
 module SR_wEn_wPreClr_test();
            reg a;
            reg b;
            reg en;
            reg pre;
            reg clr;
            
            wire o;
            wire o_not;
            
           SR_Latch_wEn_wPreClr  test(.S(a), .R(b),.En(en),.Pre(pre),.Clr(clr),.Q(o),.Q_not(o_not));
            
            initial begin
                
                
                  a = 1;
                  b = 0;
                  en = 0;
                  clr = 0;
                  pre = 0;
                  #10;
                  a = 1;
                  b = 0;
                  en = 1;
                  clr = 0;
                  pre = 0;
                  #10;
                  a = 0;
                  b = 0;
                  en = 1;
                  clr = 1;
                  pre = 0;
                  #10;
                  a = 0;
                  b = 0;
                  en = 1;
                  clr = 0;
                  pre = 0;
                  #10;
                  a = 1;
                  b = 0;
                  en = 1;
                  clr = 0;
                  pre = 0;
                  #10;
                  a = 0;
                  b = 0;
                  en = 1;
                  clr = 0;
                  pre = 1;
                  #10;
                  a = 0;
                  b = 1;
                  en = 1;
                  clr = 0;
                  pre = 0;
                  #10;
                  a = 1;
                  b = 1;
                  en = 1;
                  clr = 0;
                  pre = 0;
                  #10;
                  $finish;
              end
    endmodule

module SR_wEn_test();
            reg a;
            reg b;
            reg en;
            
            wire o;
            wire o_not;
            
           SR_Latch_wEn  test(.S(a), .R(b),.En(en),.Q(o),.Q_not(o_not));
            
            initial begin
                
                
                  a = 1;
                  b = 0;
                  en = 0;
                  #10;
                  a = 1;
                  b = 0;
                  en = 1;
                  #10;
                  a = 0;
                  b = 0;
                  en = 1;
                  #10;
                  a = 0;
                  b = 1;
                  en = 1;
                  #10;
                  a = 1;
                  b = 1;
                  en = 1;
                  #10;
                  $finish;
              end
    endmodule 
    
module D_test();
            reg a;
            reg CLK;
            
            wire o;
            wire o_not;
            
            
           D_flipflop test(.D(a), .Clk(CLK), .Q(o),.Q_not(o_not));
            
           always #1 CLK = ~CLK;  
           initial begin
             
              CLK = 0;
              a = 0;
              #10;    
              a = 1;
              #10;
              a = 1;
              #10;
              a = 0;
              #10;
                
              $finish;
              end
           endmodule
           
           
module D_preclr_test();
               reg a;
               reg CLK;
               reg pre;
               reg clr;
               
               wire o;
               wire o_not;
               
               
              D_flipflop_wPreClr test(.D(a), .Clk(CLK),.Pre(pre),.Clr(clr), .Q(o),.Q_not(o_not));
               
              always #1 CLK = ~CLK;  
              initial begin
                
                 CLK = 0;
                 a = 0;
                 clr = 0; 
                 pre = 0;
                 #10;    
                 a = 1;
                 clr = 0;
                 pre = 0;
                 #10;
                 a = 0;   
                 clr = 1;   
                 pre = 0;   
                 #10;
                 a = 0;   
                 clr = 0;   
                 pre = 1;   
                 #10;
                 a = 1;   
                 clr = 0; 
                 pre = 1;  
                 #10;
                 a = 1;
                 clr = 0; 
                 pre = 0;
                 #10;
                 a = 0;
                 clr = 0; 
                 pre = 0;
                 #10;
                   
                 $finish;
                 end
              endmodule


module JK_test();
            reg a;
            reg b;
            reg CLK;
            
            wire o;
            wire o_not;
            
            
           JK_flipflop test(.J(a),.K(b), .Clk(CLK), .Q(o),.Q_not(o_not));
            
           always #1 CLK = ~CLK;  
           initial begin
             
              CLK = 0;
              a = 0; b = 0; #10;
              a = 0; b = 1; #10;
              a = 1; b = 0; #10;
              a = 1; b = 1; #10;
                
              $finish;
              end
           endmodule                                                   