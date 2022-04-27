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
            reg j;
            reg k;
            reg CLK;
            
            wire o;
            wire o_not;
            
            
           JK_flipflop  test(.J(j),.K(k), .Clk(CLK), .Q(o),.Q_not(o_not));
            
           always #1 CLK = ~CLK;  
           initial begin
             
             
              CLK = 0; j = 1; k = 0; #10;
              j = 0; k = 0; #10;
              j = 0; k = 1; #10;
              j = 1; k = 1; #10;
                
              $finish;
              end
           endmodule
           
module JK_preclr_test();
            reg j;
            reg k;
            reg pre;
            reg clr;
            reg CLK;
            
            wire o;
            wire o_not;
            
            
           JK_flipflop_wClearPreset  test(.J(j),.K(k),.Pre(pre),.Clr(clr), .Clk(CLK), .Q(o),.Q_not(o_not));
            
           always #1 CLK = ~CLK;  
           initial begin
             
             
              CLK = 0; j = 0; k = 0; pre = 1; clr = 0; #10;
              j = 0; k = 0; pre = 0; clr = 0; #10;
              j = 0; k = 0; pre = 0; clr = 1; #10;
              j = 1; k = 0; pre = 0; clr = 0; #10;
              j = 0; k = 1; pre = 0; clr = 0; #10;
              j = 1; k = 1; pre = 0; clr = 0; #10;
                
              $finish;
              end
           endmodule
           
module async_JK_counter_test();

    reg CLK;
    reg pre;
    
    wire [3:0]o;
    
    
    async_JK_counter_0to14 test(.Clk(CLK),.pre(pre),.b(o));
    
    always #1 CLK = ~CLK; 
    
    initial begin
    
    CLK = 0; pre = 1; #1;
    pre = 0; #15;
    
    $finish;
    end
    endmodule    
    
    module pulse_test();
    
    reg [7:0]value ;
    reg CLK;
    reg load;
    
    wire pulse;
     
    pulse_generator test(.value(value), .Clk(CLK), .load(load), .pulse(pulse));
     
    always #1 CLK = ~CLK; 
    
    initial begin
    
    CLK = 0; load =1; #1;
    value = 8'b10101010; load = 0; #10;
    $finish;
    end
    endmodule                                                                     