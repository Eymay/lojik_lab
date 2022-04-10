`timescale 1ns/1ps
//`include "modules.v"
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
        $finish;
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
        $finish;
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
                $finish;
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
            $finish;
        end
endmodule

//module mux8_1_test();

module decoder2_4_test();

    reg a;
    reg b;
    reg c;
    
    wire d;
    wire e;
    wire f;
    wire g;
    
     decoder2_4  hello(.i_1(a), .i_2(b), .en(c), .o_1(d), .o_2(e), .o_3(f), .o_4(g));
     
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
    
    decoder3_8 hello(.i_1(a), .i_2(b), .i_3(c),.o(o_1),.o(o_2),.o(o_3),.o(o_4),.o(o_5),.o(o_6),.o(o_7),.o(o_8));

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
    
    F1_d hello(.i_1(a), .i_2(b), .i_3(c), .i_4(d), .o(o_1));
    
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


module F1_e_test();

    reg a;
    reg b;
    reg c;
    reg d;
    
    wire o_1;
    
    F1_e hello(.i_1(a), .i_2(b), .i_3(c), .i_4(d), .o(o_1));
    
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

module F2_F3_test ();
    
    reg a;
    reg b;
    reg c;

    wire d;
    F2_F3 hello(.i_1(a), .i_2(b),.i_3(c), .o(d));
    
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
    
    half_adder test(.i_1(a), .i_2(b), .o(c), .o(s));
    
    initial begin
    
        $finish;
    end
endmodule


    
    
         
    
    