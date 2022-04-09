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