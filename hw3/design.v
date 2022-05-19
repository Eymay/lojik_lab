//Part1

module CharDecoder (
    input [7:0] char,
    output reg [25:0] decodedChar
);
    always @(*) begin
        case (char)
            "A": decodedChar = 26'h0000001;
            "B": decodedChar = 26'h0000002;
            "C": decodedChar = 26'h0000004;
            "D": decodedChar = 26'h0000008;
            "E": decodedChar = 26'h0000010;
            "F": decodedChar = 26'h0000020;
            "G": decodedChar = 26'h0000040;
            "H": decodedChar = 26'h0000080;
            "I": decodedChar = 26'h0000100;
            "J": decodedChar = 26'h0000200;
            "K": decodedChar = 26'h0000400;
            "L": decodedChar = 26'h0000800;
            "M": decodedChar = 26'h0001000;
            "N": decodedChar = 26'h0002000;
            "O": decodedChar = 26'h0004000;
            "P": decodedChar = 26'h0008000;
            "Q": decodedChar = 26'h0010000;
            "R": decodedChar = 26'h0020000;
            "S": decodedChar = 26'h0040000;
            "T": decodedChar = 26'h0080000;
            "U": decodedChar = 26'h0100000;
            "V": decodedChar = 26'h0200000;
            "W": decodedChar = 26'h0400000;
            "X": decodedChar = 26'h0800000;
            "Y": decodedChar = 26'h1000000;
            "Z": decodedChar = 26'h2000000;
        endcase
    end

endmodule

module CharEncoder (
    input [25:0] decodedChar,
    output reg [7:0] char
);
    always @(*) begin
        case (decodedChar)
            26'h0000001: char = "A";
            26'h0000002: char = "B";
            26'h0000004: char = "C";
            26'h0000008: char = "D";
            26'h0000010: char = "E";
            26'h0000020: char = "F";
            26'h0000040: char = "G";
            26'h0000080: char = "H";
            26'h0000100: char = "I";
            26'h0000200: char = "J";
            26'h0000400: char = "K";
            26'h0000800: char = "L";
            26'h0001000: char = "M";
            26'h0002000: char = "N";
            26'h0004000: char = "O";
            26'h0008000: char = "P";
            26'h0010000: char = "Q";
            26'h0020000: char = "R";
            26'h0040000: char = "S";
            26'h0080000: char = "T";
            26'h0100000: char = "U";
            26'h0200000: char = "V";
            26'h0400000: char = "W";
            26'h0800000: char = "X";
            26'h1000000: char = "Y";
            26'h2000000: char = "Z";
        endcase
    end

endmodule

module CircularLeftShift (
    input [25:0] data,
    input [4:0] shiftAmount,
    output [25:0] out
);
    assign out = (data << shiftAmount) | (data >> (26-shiftAmount));
endmodule

module CircularRightShift (
    input [25:0] data,
    input [4:0] shiftAmount,
    output [25:0] out
);
    assign out = (data >> shiftAmount) | (data << (26-shiftAmount));
endmodule

/*
module CharDecoder (
    input [7:0] char,
    output reg [25:0] decodedChar
);
    always @(*) begin
        case (char)
            "A": decodedChar = 26'h0000001;
            "B": decodedChar = 26'h0000002;
            "C": decodedChar = 26'h0000004;
        endcase
    end

endmodule
*/
//Part 2

module CaesarEncryption (
    input [7:0] plainChar,
    input [4:0] shiftCount,
    output [7:0] cipherChar
);

    wire [25:0] decodedChar;
    wire [25:0] shiftedDecodedChar;
    

    CharDecoder chd1(.char(plainChar), .decodedChar(decodedChar));
    CircularRightShift crs1(.data(decodedChar), .shiftAmount(shiftCount), .out(shiftedDecodedChar));
    CharEncoder che1(.decodedChar(shiftedDecodedChar), .char(cipherChar));
    
endmodule

module CaesarDecryption (
    input [7:0] cipherChar,
    input [4:0] shiftCount,
    output [7:0] decryptedChar,
);

    wire [25:0] decodedChar;
    wire [25:0] shiftedDecodedChar;
    

    CharDecoder chd1(.char(plainChar), .decodedChar(decodedChar));
    CircularLeftShift crs1(.data(decodedChar), .shiftAmount(shiftCount), .out(shiftedDecodedChar));
    CharEncoder che1(.decodedChar(shiftedDecodedChar), .char(cipherChar));
    
endmodule

module CaesarEnvironment (
    input [7:0] plainChar,
    input [4:0] shiftCount,
    output [7:0] cipherChar,
    output [7:0] decryptedChar
);

    //TODO cipherChar hem output hem ara eleman olarak verilmiş dökümanda
    //wire [7:0] intermediate_cipherChar;
    //CaesarEncryption ce1(.plainChar(plainChar), .shiftCount(shiftCount), .cipherChar(intermediate_cipherChar));
    //CaesarDecryption cd1(.cipherChar(intermediate_cipherChar), .shiftCount(shiftCount), .decryptedChar(decryptedChar));
    CaesarEncryption ce1(.plainChar(plainChar), .shiftCount(shiftCount), .cipherChar(cipherChar));
    CaesarDecryption cd1(.cipherChar(cipherChar), .shiftCount(shiftCount), .decryptedChar(decryptedChar));



endmodule

//Part 3

module VigenereEncryption (
    input [7:0] plainChar,
    input [79:0] keyInput,
    input load,
    input clock,
    output [7:0] cipherChar
);
    reg [79:0] key

    always @(posedge load) begin
        key = keyInput;
    end

    always @(posedge clock) begin
        key = key >> 8;
    end

    cipherChar = (plainChar + key[7: 0]) % 26;    

endmodule

module VigenereDecryption (
    input [7:0] cipherChar,
    input [79:0] keyInput,
    input load,
    input clock,
    output [7:0] decryptedChar
);
    reg [79:0] key

    always @(posedge load) begin
        key = keyInput;
    end

    always @(posedge clock) begin
        key = key >> 8;
    end

    decryptedChar = (cipherChar - key[7: 0]) % 26;   


endmodule

module VigenereEnvironment (
    input [7:0] plainChar,
    input [79:0] keyInput,
    input load,
    input clock,
    output [7:0] cipherChar,
    output [7:0] decryptedChar
);

    VigenereEncryption ve1(.plainChar(plainChar), .keyInput(keyInput), .load(load), .clock(clock), .cipherChar(cipherChar));
    VigenereDecryption vd1(.cipherChar(cipherChar), .keyInput(keyInput), .load(load), .clock(clock), .decryptedChar(decryptedChar));


    
endmodule

//Part 4

module PlugBoard (
    input [25:0] charInput,
    input [25:0] backwardInput,
    output [25:0] forwardOutput,
    output [25:0] backwardOutput
);
    backwardInput[0] = charOutput[4];
    backwardInput[1] = charOutput[10];
    backwardInput[2] = charOutput[12];
    backwardInput[3] = charOutput[5];
    backwardInput[4] = charOutput[11];
    backwardInput[5] = charOutput[6];
    backwardInput[6] = charOutput[3];
    backwardInput[7] = charOutput[16];
    backwardInput[8] = charOutput[21];
    backwardInput[9] = charOutput[25];
    backwardInput[10] = charOutput[13];
    backwardInput[11] = charOutput[19];
    backwardInput[12] = charOutput[14];
    backwardInput[13] = charOutput[22];
    backwardInput[14] = charOutput[24];
    backwardInput[15] = charOutput[7];
    backwardInput[16] = charOutput[23];
    backwardInput[17] = charOutput[20];
    backwardInput[18] = charOutput[18];
    backwardInput[19] = charOutput[15];
    backwardInput[20] = charOutput[0];
    backwardInput[21] = charOutput[8];
    backwardInput[22] = charOutput[1];
    backwardInput[23] = charOutput[17];
    backwardInput[24] = charOutput[2];
    forwardOutput[0] = charInput[4];
    forwardOutput[1] = charInput[10];
    forwardOutput[2] = charInput[12];
    forwardOutput[3] = charInput[5];
    forwardOutput[4] = charInput[11];
    forwardOutput[5] = charInput[6];
    forwardOutput[6] = charInput[3];
    forwardOutput[7] = charInput[16];
    forwardOutput[8] = charInput[21];
    forwardOutput[9] = charInput[25];
    forwardOutput[10] = charInput[13];
    forwardOutput[11] = charInput[19];
    forwardOutput[12] = charInput[14];
    forwardOutput[13] = charInput[22];
    forwardOutput[14] = charInput[24];
    forwardOutput[15] = charInput[7];
    forwardOutput[16] = charInput[23];
    forwardOutput[17] = charInput[20];
    forwardOutput[18] = charInput[18];
    forwardOutput[19] = charInput[15];
    forwardOutput[20] = charInput[0];
    forwardOutput[21] = charInput[8];
    forwardOutput[22] = charInput[1];
    forwardOutput[23] = charInput[17];
    forwardOutput[24] = charInput[2];
endmodule


module Rotor1 (
    input [25:0] forwardInput,
    input [25:0] backwardInput,
    input [4:0] startPosition,
    input load,
    input clockIn,
    output clockOut,
    output [25:0] forwardOutput,
    output [25:0] backwardOutput
);

    reg [25:0] forward_rotation;
    reg [25:0] backward_rotation;



    forwardOutput[0] =  forward_rotation[0]
    forwardOutput[1] =  forward_rotation[1]
    forwardOutput[2] =  forward_rotation[2]
    forwardOutput[3] =  forward_rotation[3]
    forwardOutput[4] =  forward_rotation[4]
    forwardOutput[5] =  forward_rotation[5]
    forwardOutput[6] =  forward_rotation[6]
    forwardOutput[7] =  forward_rotation[7]
    forwardOutput[8] =  forward_rotation[8]
    forwardOutput[9] =  forward_rotation[9]
    forwardOutput[10] = forward_rotation[10]
    forwardOutput[11] = forward_rotation[11]
    forwardOutput[12] = forward_rotation[12]
    forwardOutput[13] = forward_rotation[13]
    forwardOutput[14] = forward_rotation[14]
    forwardOutput[15] = forward_rotation[15]
    forwardOutput[16] = forward_rotation[16]
    forwardOutput[17] = forward_rotation[17]
    forwardOutput[18] = forward_rotation[18]
    forwardOutput[19] = forward_rotation[19]
    forwardOutput[20] = forward_rotation[20]
    forwardOutput[21] = forward_rotation[21]
    forwardOutput[22] = forward_rotation[22]
    forwardOutput[23] = forward_rotation[23]
    forwardOutput[24] = forward_rotation[24]
    forwardOutput[25] = forward_rotation[25]
    forward_rotation[0] =     forwardInput[7];
    forward_rotation[1] =     forwardInput[12];
    forward_rotation[2] =     forwardInput[21];
    forward_rotation[3] =     forwardInput[17];
    forward_rotation[4] =     forwardInput[0];
    forward_rotation[5] =     forwardInput[2];
    forward_rotation[6] =     forwardInput[22];
    forward_rotation[7] =     forwardInput[20];
    forward_rotation[8] =     forwardInput[23];
    forward_rotation[9] =     forwardInput[18];
    forward_rotation[10] =    forwardInput[9];
    forward_rotation[11] =    forwardInput[25];
    forward_rotation[12] =    forwardInput[15];
    forward_rotation[13] =    forwardInput[3];
    forward_rotation[14] =    forwardInput[14];
    forward_rotation[15] =    forwardInput[13];
    forward_rotation[16] =    forwardInput[11];
    forward_rotation[17] =    forwardInput[8];
    forward_rotation[18] =    forwardInput[4];
    forward_rotation[19] =    forwardInput[10];
    forward_rotation[20] =    forwardInput[6];
    forward_rotation[21] =    forwardInput[5];
    forward_rotation[22] =    forwardInput[19];
    forward_rotation[23] =    forwardInput[16];
    forward_rotation[24] =    forwardInput[24];
    forward_rotation[25] =    forwardInput[1];
    
    backward_rotation[0] = backwardInput[0] ; 
    backward_rotation[1] = backwardInput[1] ; 
    backward_rotation[2] = backwardInput[2] ; 
    backward_rotation[3] = backwardInput[3] ; 
    backward_rotation[4] = backwardInput[4] ; 
    backward_rotation[5] = backwardInput[5] ; 
    backward_rotation[6] = backwardInput[6] ; 
    backward_rotation[7] = backwardInput[7] ; 
    backward_rotation[8] = backwardInput[8] ; 
    backward_rotation[9] = backwardInput[9] ; 
    backward_rotation[10] = backwardInput[10]; 
    backward_rotation[11] = backwardInput[11]; 
    backward_rotation[12] = backwardInput[12]; 
    backward_rotation[13] = backwardInput[13]; 
    backward_rotation[14] = backwardInput[14]; 
    backward_rotation[15] = backwardInput[15]; 
    backward_rotation[16] = backwardInput[16]; 
    backward_rotation[17] = backwardInput[17]; 
    backward_rotation[18] = backwardInput[18]; 
    backward_rotation[19] = backwardInput[19]; 
    backward_rotation[20] = backwardInput[20]; 
    backward_rotation[21] = backwardInput[21]; 
    backward_rotation[22] = backwardInput[22]; 
    backward_rotation[23] = backwardInput[23]; 
    backward_rotation[24] = backwardInput[24]; 
    backward_rotation[25] = backwardInput[25]; 

 backwardOutput[7] =    backward_rotation[0]  ;
 backwardOutput[12] =    backward_rotation[1]  ;
 backwardOutput[21] =    backward_rotation[2]  ;
 backwardOutput[17] =    backward_rotation[3]  ;
 backwardOutput[0] =    backward_rotation[4]  ;
 backwardOutput[2] =    backward_rotation[5]  ;
 backwardOutput[22] =    backward_rotation[6]  ;
 backwardOutput[20] =    backward_rotation[7]  ;
 backwardOutput[23] =    backward_rotation[8]  ;
 backwardOutput[18] =    backward_rotation[9]  ;
  backwardOutput[9] =    backward_rotation[10] ;
  backwardOutput[25] =    backward_rotation[11] ;
  backwardOutput[15] =    backward_rotation[12] ;
  backwardOutput[3] =    backward_rotation[13] ;
  backwardOutput[14] =    backward_rotation[14] ;
  backwardOutput[13] =    backward_rotation[15] ;
  backwardOutput[11] =    backward_rotation[16] ;
  backwardOutput[8] =    backward_rotation[17] ;
  backwardOutput[4] =    backward_rotation[18] ;
  backwardOutput[10] =    backward_rotation[19] ;
  backwardOutput[6] =    backward_rotation[20] ;
  backwardOutput[5] =    backward_rotation[21] ;
  backwardOutput[19] =    backward_rotation[22] ;
  backwardOutput[16] =    backward_rotation[23] ;
  backwardOutput[24] =    backward_rotation[24] ;
  backwardOutput[1] =    backward_rotation[25] ;

  always @(posedge load) begin
      
  end
    
endmodule

module Rotor2 (
    input [25:0] forwardInput,
    input [25:0] backwardInput,
    input [4:0] startPosition,
    input load,
    input clockIn,
    output clockOut,
    output [25:0] forwardOutput,
    output [25:0] backwardOutput
);
    forwardOutput[0] = forwardInput[19];
    forwardOutput[1] = forwardInput[4];
    forwardOutput[2] = forwardInput[7];
    forwardOutput[3] = forwardInput[6];
    forwardOutput[4] = forwardInput[12];
    forwardOutput[5] = forwardInput[17];
    forwardOutput[6] = forwardInput[8];
    forwardOutput[7] = forwardInput[5];
    forwardOutput[8] = forwardInput[2];
    forwardOutput[9] = forwardInput[0];
    forwardOutput[10] = forwardInput[1];
    forwardOutput[11] = forwardInput[20];
    forwardOutput[12] = forwardInput[25];
    forwardOutput[13] = forwardInput[9];
    forwardOutput[14] = forwardInput[14];
    forwardOutput[15] = forwardInput[22];
    forwardOutput[16] = forwardInput[24];
    forwardOutput[17] = forwardInput[18];
    forwardOutput[18] = forwardInput[15];
    forwardOutput[19] = forwardInput[13];
    forwardOutput[20] = forwardInput[3];
    forwardOutput[21] = forwardInput[10];
    forwardOutput[22] = forwardInput[21];
    forwardOutput[23] = forwardInput[16];
    forwardOutput[24] = forwardInput[11];
    forwardOutput[25] = forwardInput[23];
    backwardInput[0] = backwardOutput[19];
    backwardInput[1] = backwardOutput[4];
    backwardInput[2] = backwardOutput[7];
    backwardInput[3] = backwardOutput[6];
    backwardInput[4] = backwardOutput[12];
    backwardInput[5] = backwardOutput[17];
    backwardInput[6] = backwardOutput[8];
    backwardInput[7] = backwardOutput[5];
    backwardInput[8] = backwardOutput[2];
    backwardInput[9] = backwardOutput[0];
    backwardInput[10] = backwardOutput[1];
    backwardInput[11] = backwardOutput[20];
    backwardInput[12] = backwardOutput[25];
    backwardInput[13] = backwardOutput[9];
    backwardInput[14] = backwardOutput[14];
    backwardInput[15] = backwardOutput[22];
    backwardInput[16] = backwardOutput[24];
    backwardInput[17] = backwardOutput[18];
    backwardInput[18] = backwardOutput[15];
    backwardInput[19] = backwardOutput[13];
    backwardInput[20] = backwardOutput[3];
    backwardInput[21] = backwardOutput[10];
    backwardInput[22] = backwardOutput[21];
    backwardInput[23] = backwardOutput[16];
    backwardInput[24] = backwardOutput[11];
    backwardInput[25] = backwardOutput[23];
    
endmodule


module Rotor3 (
    input [25:0] forwardInput,
    input [25:0] backwardInput,
    input [4:0] startPosition,
    input load,
    input clockIn,
    output [25:0] forwardOutput,
    output [25:0] backwardOutput
);
    forwardOutput[0] = forwardInput[19];
    forwardOutput[1] = forwardInput[0];
    forwardOutput[2] = forwardInput[6];
    forwardOutput[3] = forwardInput[1];
    forwardOutput[4] = forwardInput[15];
    forwardOutput[5] = forwardInput[2];
    forwardOutput[6] = forwardInput[18];
    forwardOutput[7] = forwardInput[3];
    forwardOutput[8] = forwardInput[16];
    forwardOutput[9] = forwardInput[4];
    forwardOutput[10] = forwardInput[20];
    forwardOutput[11] = forwardInput[5];
    forwardOutput[12] = forwardInput[21];
    forwardOutput[13] = forwardInput[13];
    forwardOutput[14] = forwardInput[25];
    forwardOutput[15] = forwardInput[7];
    forwardOutput[16] = forwardInput[24];
    forwardOutput[17] = forwardInput[8];
    forwardOutput[18] = forwardInput[23];
    forwardOutput[19] = forwardInput[9];
    forwardOutput[20] = forwardInput[22];
    forwardOutput[21] = forwardInput[11];
    forwardOutput[22] = forwardInput[17];
    forwardOutput[23] = forwardInput[10];
    forwardOutput[24] = forwardInput[14];
    forwardOutput[25] = forwardInput[12];
    backwardInput[0] = backwardOutput[19];
    backwardInput[1] = backwardOutput[0];
    backwardInput[2] = backwardOutput[6];
    backwardInput[3] = backwardOutput[1];
    backwardInput[4] = backwardOutput[15];
    backwardInput[5] = backwardOutput[2];
    backwardInput[6] = backwardOutput[18];
    backwardInput[7] = backwardOutput[3];
    backwardInput[8] = backwardOutput[16];
    backwardInput[9] = backwardOutput[4];
    backwardInput[10] = backwardOutput[20];
    backwardInput[11] = backwardOutput[5];
    backwardInput[12] = backwardOutput[21];
    backwardInput[13] = backwardOutput[13];
    backwardInput[14] = backwardOutput[25];
    backwardInput[15] = backwardOutput[7];
    backwardInput[16] = backwardOutput[24];
    backwardInput[17] = backwardOutput[8];
    backwardInput[18] = backwardOutput[23];
    backwardInput[19] = backwardOutput[9];
    backwardInput[20] = backwardOutput[22];
    backwardInput[21] = backwardOutput[11];
    backwardInput[22] = backwardOutput[17];
    backwardInput[23] = backwardOutput[10];
    backwardInput[24] = backwardOutput[14];
    backwardInput[25] = backwardOutput[12];
    
endmodule

module reflector (
    input [25:0] inputConnection,
    output [25:0] outputConnection
);

    outputConnection[0] = inputConnection[24];
    outputConnection[1] = inputConnection[17];
    outputConnection[2] = inputConnection[20];
    outputConnection[3] = inputConnection[7];
    outputConnection[4] = inputConnection[16];
    outputConnection[5] = inputConnection[18];
    outputConnection[6] = inputConnection[11];
    outputConnection[7] = inputConnection[3];
    outputConnection[8] = inputConnection[15];
    outputConnection[9] = inputConnection[23];
    outputConnection[10] = inputConnection[13];
    outputConnection[11] = inputConnection[6];
    outputConnection[12] = inputConnection[14];
    outputConnection[13] = inputConnection[10];
    outputConnection[14] = inputConnection[12];
    outputConnection[15] = inputConnection[8];
    outputConnection[16] = inputConnection[4];
    outputConnection[17] = inputConnection[1];
    outputConnection[18] = inputConnection[5];
    outputConnection[19] = inputConnection[25];
    outputConnection[20] = inputConnection[2];
    outputConnection[21] = inputConnection[22];
    outputConnection[22] = inputConnection[21];
    outputConnection[23] = inputConnection[9];
    outputConnection[24] = inputConnection[0];
    outputConnection[25] = inputConnection[19];
    
endmodule

module EnigmaMachine (
    input [7:0] char,
    input [4:0] startPosition1,
    input [4:0] startPosition2,
    input [4:0] startPosition3,
    input load,
    input clock,
    output [7:0] outChar
);

wire [25:0] decodedChar;
wire [25:0] forward_plugtoR1;
wire [25:0] forward_R1toR2;
wire [25:0] forward_R2toR3;
wire [25:0] forward_R3toReflector;
wire [25:0] backward_ReflectortoR3;
wire [25:0] backward_R3toR2;
wire [25:0] backward_R2toR1;
wire [25:0] backward_R1toplug;
wire [25:0] encryptedChar;

wire slow_clock;
wire very_slow_clock;


    CharDecoder decoder(.input(char), .output(decodedChar));
    PlugBoard plugBoard(
    .charInput(decodedChar),
    .backwardInput(backward_R1toplug),
    .forwardOutput(forward_plugtoR1),
    .backwardOutput(encryptedChar)
);
    Rotor1 rotor1(
    .forwardInput(forward_plugtoR1),
    .backwardInput(backward_R2toR1),
    .startPosition(startPosition1),
    .load(load),
    .clockIn(clock),
    .clockOut(slow_clock),
    .forwardOutput(forward_R1toR2),
    .backwardOutput(backward_R1toplug)
);
    Rotor2 rotor2(
    .forwardInput(forward_R1toR2),
    .backwardInput(backward_R3toR2),
    .startPosition(startPosition2),
    .load(load),
    .clockIn(slow_clock),
    .clockOut(very_slow_clock),
    .forwardOutput(forward_R2toR3),
    .backwardOutput(backward_R2toR1)
);
    Rotor3 rotor3(
    .forwardInput(forward_R2toR3),
    .backwardInput(backward_ReflectortoR3),
    .startPosition(startPosition3),
    .load(load),
    .clockIn(very_slow_clock),
    .forwardOutput(forward_R3toReflector),
    .backwardOutput(backward_R3toR2)
);
    Reflector reflector(
    .inputConnection(forward_R3toReflector),
    .outputConnection(backward_ReflectortoR3)
);

    
    

    
endmodule