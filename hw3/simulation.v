`timescale 1ns / 1ps

module CharDecoder_t();

    reg [7:0] char;
    wire [25:0] decodedChar;
    
    CharDecoder test(.char(char),.decodedChar(decodedChar));
    
    initial begin
    char = "A"; #10;
    char = "B"; #10;
    char = "C"; #10;
    char = "D"; #10;
    char = "E"; #10;
    char = "F"; #10;
    char = "G"; #10;
    char = "H"; #10;
    char = "I"; #10;
    char = "J"; #10;
    char = "K"; #10;
    char = "L"; #10;
    char = "M"; #10;
    char = "N"; #10;
    char = "O"; #10;
    char = "P"; #10;
    char = "Q"; #10;
    char = "R"; #10;
    char = "S"; #10;
    char = "T"; #10;
    char = "U"; #10;
    char = "V"; #10;
    char = "W"; #10;
    char = "X"; #10;
    char = "Y"; #10;
    char = "Z"; #10;
    $finish;
        
   end
 endmodule