`timescale 1ns/1ps
`include "modules.v"
module AND_test ();
    
    reg a;
    reg b;

    wire c;
    and_gate hello(.i_1(a), .i_2(b), .o(c));
    
    initial begin
    //$dumpfile("test.vcd");
    //$dumpvars(0,AND_test);
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
        //$finish;
    end
endmodule

module AND3_test ();
    
    reg a;
    reg b;
    reg c;

    wire d;
    and3_gate hello(.i_1(a), .i_2(b),.i_3(c), .o(d));
    
    initial begin
    //$dumpfile("test.vcd");
    //$dumpvars(0,AND_test);
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
        //$finish;
    end
endmodule

module AND4_test ();
    
    reg a;
    reg b;
    reg c;
    reg d;

    wire e;
    and4_gate hello(.i_1(a), .i_2(b),.i_3(c),.i_4(d), .o(e));
    
    initial begin
    //$dumpfile("test.vcd");
    //$dumpvars(0,AND_test);
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        #10;
        a = 0;
        b = 0;
        c = 1;
        d = 0;
        #10;
        a = 0;
        b = 1;
        c = 0;
        d = 0;
        #10;
        a = 0;
        b = 1;
        c = 1;
        d = 0;
        #10;
        a = 1;
        b = 0;
        c = 0;
        d = 0;
        #10;
        a = 1;
        b = 0;
        c = 1;
        d = 0;
        #10;
        a = 1;
        b = 1;
        c = 0;
        d = 0;
        #10;
        a = 1;
        b = 1;
        c = 1;
        d = 0;
        #10;
        a = 0;
        b = 0;
        c = 0;
        d = 1;
        #10;
        a = 0;
        b = 0;
        c = 1;
        d = 1;
        #10;
        a = 0;
        b = 1;
        c = 0;
        d = 1;
        #10;
        a = 0;
        b = 1;
        c = 1;
        d = 1;
        #10;
        a = 1;
        b = 0;
        c = 0;
        d = 1;
        #10;
        a = 1;
        b = 0;
        c = 1;
        d = 1;
        #10;
        a = 1;
        b = 1;
        c = 0;
        d = 1;
        #10;
        a = 1;
        b = 1;
        c = 1;
        d = 1;
        #10;
        $finish;
    end
endmodule

module OR_test();

    reg a;
    reg b;
    
    wire c;
    
    or_gate or1(.i_1(a), .i_2(b), .o(c));
    
    initial begin
        //$dumpfile("test.vcd");
        //$dumpvars(0,AND_test);
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
     
module OR3_test ();
         
         reg a;
         reg b;
         reg c;
     
         wire d;
         or3_gate hello(.i_1(a), .i_2(b),.i_3(c), .o(d));
         
         initial begin
         //$dumpfile("test.vcd");
         //$dumpvars(0,AND_test);
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
     
module not_test();

    reg a;
    
    wire b;
    
    not_gate hello(.i_1(a), .o(b));
    
    initial begin
        a = 0;
        #10;
        a = 1;
        #10;
        $finish;
        end
endmodule        

module xor_test();

    reg a;
    reg b;
    
    wire c;
    
    xor_gate hello(.i_1(a), .i_2(b), .o(c));  
    
    initial begin
        //$dumpfile("test.vcd");
        //$dumpvars(0,AND_test);
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
    
    nand_gate hello(.i_1(a), .i_2(b), .o(c));
    
    initial begin
            //$dumpfile("test.vcd");
            //$dumpvars(0,AND_test);
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

module nand3_test();

    reg a;
    reg b;
    reg c;
    
    wire d;
    
    nand3_gate hello(.i_1(a), .i_2(b), .i_3(c),.o(d));
    initial begin
        //$dumpfile("test.vcd");
        //$dumpvars(0,AND_test);
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
    
module mux2_1_test();
    reg a;
    reg b;
    reg s;
    
    wire c;
    
    mux2_1 hello(.i_1(a), .i_2(b), .s_1(s), .o(c));
    initial begin 
            //$dumpfile("test.vcd");
            //$dumpvars(0,AND_test);
                a = 1;
                b = 1;
                s = 0;
                #10;
                a = 0;
                b = 0;
                s = 1;
                #10;
                a = 1;
                b = 0;
                s = 0;
                #10;
                a = 0;
                b = 1;
                s = 1;
                #10;
                a = 1;
                b = 1;
                s = 1;
                #10;
                //$finish;
            end
endmodule            

module mux4_1_test();

    reg a;
    reg b;
    reg c;
    reg d;
    reg s1;
    reg s2;
    
    wire e;
    
    mux4_1 hello(.i_1(a), .i_2(b), .i_3(c), .i_4(d), .s_1(s1), .s_2(s2), .o(e));
    
    initial begin
        //$dumpfile("test.vcd");
        //$dumpvars(0,AND_test);
            a = 0;
            b = 0;
            c = 0;
            d = 0;
            s1 = 0;
            s2 = 0;
            #10;
            a = 0;
            b = 0;
            c = 1;
            d = 0;
            s1 = 0;
            s2 = 1;
            #10;
            a = 0;
            b = 1;
            c = 0;
            d = 0;
            s1 = 0;
            s2 = 1;
            #10;
            a = 0;
            b = 1;
            c = 1;
            d = 0;
            s1 = 1;
            s2 = 0;
            #10;
            a = 1;
            b = 0;
            c = 0;
            d = 0;
            s1 = 1;
            s2 = 0;
            #10;
            a = 1;
            b = 0;
            c = 1;
            d = 0;
            s1 = 1;
            s2 = 1;
            #10;
            a = 1;
            b = 1;
            c = 0;
            d = 0;
            s1 = 1;
            s2 = 1;
            #10;
            a = 1;
            b = 1;
            c = 1;
            d = 0;
            s1 = 0;
            s2 = 0;
            #10;
            a = 0;
            b = 0;
            c = 0;
            d = 1;
            s1 = 0;
            s2 = 1;
            #10;
            a = 0;
            b = 0;
            c = 1;
            d = 1;
            s1 = 0;
            s2 = 1;
            #10;
            a = 0;
            b = 1;
            c = 0;
            d = 1;
            s1 = 1;
            s2 = 0;
            #10;
            a = 0;
            b = 1;
            c = 1;
            d = 1;
            s1 = 1;
            s2 = 0;
            #10;
            a = 1;
            b = 0;
            c = 0;
            d = 1;
            s1 = 1;
            s2 = 1;
            #10;
            a = 1;
            b = 0;
            c = 1;
            d = 1;
            s1 = 1;
            s2 = 1;
            #10;
            a = 1;
            b = 1;
            c = 0;
            d = 1;
            s1 = 0;
            s2 = 0;
            #10;
            a = 1;
            b = 1;
            c = 1;
            d = 1;
            s1 = 0;
            s2 = 1;
            #10;
            //$finish;
        end
endmodule

module mux8_1_test();
    
    reg a_7;
    reg a_6;
    reg a_5;
    reg a_4;
    reg a_3;
    reg a_2;
    reg a_1;
    reg a_0;
    reg s_0;
    reg s_1;
    reg s_2;
    
    wire out;
    
    mux8_1 test(.i_1(a_7),.i_2(a_6),.i_3(a_5),.i_4(a_4),.i_5(a_3),.i_6(a_2),.i_7(a_1),.i_8(a_0),.s_1(s_0),.s_2(s_1),.s_3(s_2),.o(out));
    
    initial begin
        //$dumpfile("8mux.vcd");
        //$dumpvars(0,mux8_1_test);
    
        a_0 = 0; a_1 = 0; a_2 = 0; a_3 = 0; a_4 = 0; a_5 = 0; a_6 = 0; a_7 = 0; s_0 = 0; s_1 = 0; s_2 = 0; #10;
        a_0 = 0; a_1 = 0; a_2 = 0; a_3 = 1; a_4 = 0; a_5 = 1; a_6 = 0; a_7 = 0; s_0 = 0; s_1 = 0; s_2 = 1; #10; 
        a_0 = 0; a_1 = 0; a_2 = 1; a_3 = 1; a_4 = 0; a_5 = 1; a_6 = 1; a_7 = 0; s_0 = 0; s_1 = 0; s_2 = 1; #10; 
        a_0 = 0; a_1 = 0; a_2 = 1; a_3 = 1; a_4 = 0; a_5 = 0; a_6 = 0; a_7 = 0; s_0 = 0; s_1 = 0; s_2 = 0; #10; 
        a_0 = 0; a_1 = 1; a_2 = 0; a_3 = 0; a_4 = 0; a_5 = 0; a_6 = 0; a_7 = 0; s_0 = 0; s_1 = 1; s_2 = 1; #10; 
        a_0 = 0; a_1 = 1; a_2 = 0; a_3 = 1; a_4 = 0; a_5 = 0; a_6 = 1; a_7 = 0; s_0 = 0; s_1 = 1; s_2 = 1; #10; 
        a_0 = 0; a_1 = 1; a_2 = 1; a_3 = 0; a_4 = 1; a_5 = 0; a_6 = 1; a_7 = 0; s_0 = 0; s_1 = 1; s_2 = 0; #10; 
        a_0 = 0; a_1 = 1; a_2 = 1; a_3 = 1; a_4 = 0; a_5 = 0; a_6 = 1; a_7 = 0; s_0 = 1; s_1 = 1; s_2 = 1; #10; 
        a_0 = 0; a_1 = 0; a_2 = 0; a_3 = 0; a_4 = 1; a_5 = 1; a_6 = 0; a_7 = 1; s_0 = 1; s_1 = 0; s_2 = 1; #10; 
        a_0 = 1; a_1 = 0; a_2 = 0; a_3 = 0; a_4 = 0; a_5 = 1; a_6 = 0; a_7 = 1; s_0 = 1; s_1 = 0; s_2 = 0; #10; 
        a_0 = 1; a_1 = 0; a_2 = 1; a_3 = 1; a_4 = 1; a_5 = 1; a_6 = 1; a_7 = 1; s_0 = 1; s_1 = 0; s_2 = 0; #10; 
        a_0 = 1; a_1 = 0; a_2 = 1; a_3 = 1; a_4 = 0; a_5 = 0; a_6 = 1; a_7 = 1; s_0 = 1; s_1 = 0; s_2 = 1; #10; 
        a_0 = 1; a_1 = 1; a_2 = 0; a_3 = 1; a_4 = 1; a_5 = 0; a_6 = 1; a_7 = 0; s_0 = 1; s_1 = 1; s_2 = 1; #10; 
        a_0 = 1; a_1 = 1; a_2 = 1; a_3 = 0; a_4 = 0; a_5 = 0; a_6 = 1; a_7 = 0; s_0 = 1; s_1 = 1; s_2 = 0; #10; 
        a_0 = 1; a_1 = 1; a_2 = 1; a_3 = 0; a_4 = 1; a_5 = 0; a_6 = 0; a_7 = 0; s_0 = 1; s_1 = 1; s_2 = 0; #10; 
        a_0 = 1; a_1 = 1; a_2 = 0; a_3 = 0; a_4 = 0; a_5 = 0; a_6 = 1; a_7 = 1; s_0 = 1; s_1 = 1; s_2 = 1; #10; 
        a_0 = 1; a_1 = 0; a_2 = 0; a_3 = 1; a_4 = 1; a_5 = 1; a_6 = 0; a_7 = 1; s_0 = 1; s_1 = 1; s_2 = 1; #10; 
        $finish;
        end
endmodule 
         
    

module decoder2_4_test();

    reg a;
    reg b;
    reg c;
    
    wire o1;
    wire o2;
    wire o3;
    wire o4;
    
     decoder2_4  hello(.i_1(a), .i_2(b), .en(c), .o_1(o1), .o_2(o2), .o_3(o3), .o_4(o4));
     
     initial begin
       //$dumpfile("test.vcd");
       //$dumpvars(0,AND_test);
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
           c = 1;
           #10;
           a = 1;
           b = 1;
           c = 1;
           #10;
           $finish;
       end
endmodule    

module decoder3_8_test();
    reg a;
    reg b;
    reg c;
    
    wire o_1;    
    wire o_2;
    wire o_3;
    wire o_4;
    wire o_5;
    wire o_6;
    wire o_7;
    wire o_8;
    
    decoder3_8 hello(.i_1(a), .i_2(b), .i_3(c),.o_1(o_1),.o_2(o_2),.o_3(o_3),.o_4(o_4),.o_5(o_5),.o_6(o_6),.o_7(o_7),.o_8(o_8));

     initial begin
       //$dumpfile("test.vcd");
       //$dumpvars(0,AND_test);
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

module F1_d_test();

    reg a;
    reg b;
    reg c;
    reg d;
    
    wire o_1;
    
    F1_d hello(.a(a), .b(b), .c(c), .d(d), .o(o_1));
    
    initial begin
           //$dumpfile("test.vcd");
           //$dumpvars(0,AND_test);                              
            a = 0; b = 0;  c = 0; d = 0;#10;
            a = 0; b = 0;  c = 0; d = 1;#10;
            a = 0; b = 0;  c = 1; d = 0;#10;
            a = 0; b = 0;  c = 1; d = 1;#10;
            a = 0; b = 1;  c = 0; d = 0;#10;
            a = 0; b = 1;  c = 0; d = 1;#10;
            a = 0; b = 1;  c = 1; d = 0;#10;
            a = 0; b = 1;  c = 1; d = 1;#10;
            a = 1; b = 0;  c = 0; d = 0;#10;
            a = 1; b = 0;  c = 0; d = 1;#10;
            a = 1; b = 0;  c = 1; d = 0;#10;
            a = 1; b = 0;  c = 1; d = 1;#10;
            a = 1; b = 1;  c = 0; d = 0;#10;
            a = 1; b = 1;  c = 0; d = 1;#10;
            a = 1; b = 1;  c = 1; d = 0;#10;
            a = 1; b = 1;  c = 1; d = 1;#10;
             $finish;  
           end
endmodule


module F1_e_test();

    reg a;
    reg b;
    reg c;
    reg d;
    
    wire o_1;
    
    F1_e hello(.a(a), .b(b), .c(c), .d(d), .o(o_1));
    
    initial begin
           //$dumpfile("test.vcd");
           //$dumpvars(0,AND_test);
             a = 0; b = 0;  c = 0; d = 0;#10;
             a = 0; b = 0;  c = 0; d = 1;#10;
             a = 0; b = 0;  c = 1; d = 0;#10;
             a = 0; b = 0;  c = 1; d = 1;#10;
             a = 0; b = 1;  c = 0; d = 0;#10;
             a = 0; b = 1;  c = 0; d = 1;#10;
             a = 0; b = 1;  c = 1; d = 0;#10;
             a = 0; b = 1;  c = 1; d = 1;#10;
             a = 1; b = 0;  c = 0; d = 0;#10;
             a = 1; b = 0;  c = 0; d = 1;#10;
             a = 1; b = 0;  c = 1; d = 0;#10;
             a = 1; b = 0;  c = 1; d = 1;#10;
             a = 1; b = 1;  c = 0; d = 0;#10;
             a = 1; b = 1;  c = 0; d = 1;#10;
             a = 1; b = 1;  c = 1; d = 0;#10;
             a = 1; b = 1;  c = 1; d = 1;#10;  
            $finish;
            end
endmodule

module F2_F3_test ();
    
    reg a;
    reg b;
    reg c;

    wire f_1;
    wire f_2;
    
    F2_F3 hello(.a(a), .b(b),.c(c), .o_1(f_1), .o_2(f_2));
    
    initial begin
    //$dumpfile("test.vcd");
    //$dumpvars(0,AND_test);
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

module half_adder_test();

    reg a;
    reg b;
    
    wire c;
    wire s;
    
    half_adder  test(.a(a), .b(b), .s(s), .c(c));
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

module full_adder_test();

    reg a;
    reg b;
    reg c_in;
    
    wire c_out;
    wire s;
    
    full_adder test(.a(a), .b(b), .c_in(c_in), .s(s), .c_out(c_out));

    initial begin
        a = 0;
        b = 0;
        c_in = 0;
        #10;
        a = 0;
        b = 0;
        c_in = 1;
        #10;
        a = 0;
        b = 1;
        c_in = 0;
        #10;
        a = 0;
        b = 1;
        c_in = 1;
        #10;
        a = 1;
        b = 0;
        c_in = 0;
        #10;
        a = 1;
        b = 0;
        c_in = 1;
        #10;
        a = 1;
        b = 1;
        c_in = 0;
        #10;
        a = 1;
        b = 1;
        c_in = 1;
        #10;
        $finish;
    end
endmodule

module Four_b_full_adder_test();
    
    reg [3:0] a, b;
    reg c_in;

    wire c_out;
    wire [3:0] s;

    Four_b_full_adder test(.a(a), .b(b), .c_in(c_in), .s(s), .c_out(c_out));

    initial begin
        a = 4'd8;
        b = 4'd1;
        c_in = 0;
        #10;
        a = 4'd2;
        b = 4'd7;
        c_in = 0;
        #10;
        a = 4'd4;
        b = 4'd5;
        c_in = 0;
        #10;
        a = 4'd11;
        b = 4'd10;
        c_in = 0;
        #10;
        a = 4'd14;
        b = 4'd5;
        c_in = 0;
        #10;
        a = 4'd15;
        b = 4'd9;
        c_in = 0;
        #10;
        a = 4'd6;
        b = 4'd3;
        c_in = 0;
        #10;
        a = 4'd8;
        b = 4'd12;
        c_in = 0;
        #10;
    end
endmodule

module Eight_b_full_adder_test();
    
    reg [7:0] a, b;
    reg c_in;

    wire c_out;
    wire [7:0] s;

    Eight_b_full_adder test(.a(a), .b(b), .c_in(c_in), .s(s), .c_out(c_out));

    initial begin
        a = 8'd29;
        b = 8'd5;
        c_in = 0;
        #10;
        a = 8'd51;
        b = 8'd92;
        c_in = 0;
        #10;
        a = 8'd17;
        b = 8'd28;
        c_in = 0;
        #10;
        a = 8'd191;
        b = 8'd2;
        c_in = 0;
        #10;
        a = 8'd200;
        b = 8'd95;
        c_in = 0;
        #10;
        a = 8'd49;
        b = 8'd25;
        c_in = 0;
        #10;
        a = 8'd78;
        b = 8'd255;
        c_in = 0;
        #10;
        a = 8'd43;
        b = 8'd59;
        c_in = 0;
        #10;
    end
endmodule


module Sixteen_b_full_adder_test();
    
    reg [15:0] a, b;
    reg X;


    wire c_out;
    wire [15:0] s;

    Sixteen_b_full_adder test(.a(a[15:0]), .b(b[15:0]), .X(X), .s(s[15:0]), .c_out(c_out));

    initial begin
    $dumpfile("sixteen.vcd");
    $dumpvars(0,Sixteen_b_full_adder_test);
        X = 0;
        a = 16'd23;
        b = 16'd3;
        #10;
        a = 16'd21;
        b = 16'd75;
        #10;
        a = 16'd16800;
        b = 16'd16900;
        #10;
        a = 16'd69834;
        b = 16'd66500;
        #10;
        a = 16'd325;
        b = 16'd97;
        #10;
        a = 16'd44;
        b = 16'd190;
        #10;
        a = 16'd463;
        b = 16'd241;
        #10;
        a = 16'd86;
        b = 16'd572;
        #10;
        $finish;
    end
endmodule



         
    
    