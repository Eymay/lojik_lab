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
    CircularLeftShift crs1(.data(decodedChar), .shiftAmount(shiftCount), .out(shiftedDecodedChar));
    CharEncoder che1(.decodedChar(shiftedDecodedChar), .char(cipherChar));
    
endmodule

module CaesarDecryption (
    input [7:0] cipherChar,
    input [4:0] shiftCount,
    output [7:0] decryptedChar
);

    wire [25:0] decodedChar;
    wire [25:0] shiftedDecodedChar;
    

    CharDecoder chd1(.char(cipherChar), .decodedChar(decodedChar));
    CircularRightShift crs1(.data(decodedChar), .shiftAmount(shiftCount), .out(shiftedDecodedChar));
    CharEncoder che1(.decodedChar(shiftedDecodedChar), .char(decryptedChar));
    
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
    reg [79:0] key;
    //wire [79:0] shifted_key;
    //reg [4:0] shift = 0;
    wire [25:0] plainDecodedChar, cipherDecodedChar, keyDecodedChar;

    always @(posedge load) begin
        key = keyInput;
    end

    always @(posedge clock && load == 0) begin

        key = {key[7:0], key[79:8]};
        
    end
    //CircularRightShift circ(.data(key), .shiftAmount(shift), .out(shifted_key));
    
    CharDecoder dec1(.char(plainChar), .decodedChar(plainDecodedChar));
    CharDecoder dec2(.char(key[7: 0]), .decodedChar(keyDecodedChar));
    assign cipherDecodedChar = (plainDecodedChar + keyDecodedChar ) % 26;    
    CharEncoder enc(.decodedChar(cipherDecodedChar), .char(cipherChar));

endmodule

module VigenereDecryption (
    input [7:0] cipherChar,
    input [79:0] keyInput,
    input load,
    input clock,
    output [7:0] decryptedChar
);
    reg [79:0] key;
    //wire [79:0] shifted_key;
    //reg [4:0] shift = 0;
    wire [25:0] cipherDecodedChar, plainDecodedChar, keyDecodedChar;

    always @(posedge load) begin
        key = keyInput;
    end

    always @(posedge clock && load == 0) begin

        key = {key[7:0], key[79:8]};
        
    end
    //CircularRightShift circ(.data(key), .shiftAmount(shift), .out(shifted_key));
    
    CharDecoder dec1(.char(cipherChar), .decodedChar(cipherDecodedChar));
    CharDecoder dec2(.char(key[7: 0]), .decodedChar(keyDecodedChar));
    assign plainDecodedChar = (cipherDecodedChar - keyDecodedChar ) % 26;    
    CharEncoder enc(.decodedChar(plainDecodedChar), .char(decryptedChar));

endmodule

module VigenereDecryption (
    input [7:0] cipherChar,
    input [79:0] keyInput,
    input load,
    input clock,
    output [7:0] decryptedChar
);
    reg [79:0] key;

    always @(posedge load) begin
        key = keyInput;
    end

    always @(posedge clock) begin
        key = key >> 8;
    end
    
    assign decryptedChar = (cipherChar - key[7: 0]) % (26*26);   


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
    assign backwardInput[0] = backwardOutput[4];
    assign backwardInput[1] = backwardOutput[10];
    assign backwardInput[2] = backwardOutput[12];
    assign backwardInput[3] = backwardOutput[5];
    assign backwardInput[4] = backwardOutput[11];
    assign backwardInput[5] = backwardOutput[6];
    assign backwardInput[6] = backwardOutput[3];
    assign backwardInput[7] = backwardOutput[16];
    assign backwardInput[8] = backwardOutput[21];
    assign backwardInput[9] = backwardOutput[25];
    assign backwardInput[10] = backwardOutput[13];
    assign backwardInput[11] = backwardOutput[19];
    assign backwardInput[12] = backwardOutput[14];
    assign backwardInput[13] = backwardOutput[22];
    assign backwardInput[14] = backwardOutput[24];
    assign backwardInput[15] = backwardOutput[7];
    assign backwardInput[16] = backwardOutput[23];
    assign backwardInput[17] = backwardOutput[20];
    assign backwardInput[18] = backwardOutput[18];
    assign backwardInput[19] = backwardOutput[15];
    assign backwardInput[20] = backwardOutput[0];
    assign backwardInput[21] = backwardOutput[8];
    assign backwardInput[22] = backwardOutput[1];
    assign backwardInput[23] = backwardOutput[17];
    assign backwardInput[24] = backwardOutput[2];
    assign forwardOutput[0] = charInput[4];
    assign forwardOutput[1] = charInput[10];
    assign forwardOutput[2] = charInput[12];
    assign forwardOutput[3] = charInput[5];
    assign forwardOutput[4] = charInput[11];
    assign forwardOutput[5] = charInput[6];
    assign forwardOutput[6] = charInput[3];
    assign forwardOutput[7] = charInput[16];
    assign forwardOutput[8] = charInput[21];
    assign forwardOutput[9] = charInput[25];
    assign forwardOutput[10] = charInput[13];
    assign forwardOutput[11] = charInput[19];
    assign forwardOutput[12] = charInput[14];
    assign forwardOutput[13] = charInput[22];
    assign forwardOutput[14] = charInput[24];
    assign forwardOutput[15] = charInput[7];
    assign forwardOutput[16] = charInput[23];
    assign forwardOutput[17] = charInput[20];
    assign forwardOutput[18] = charInput[18];
    assign forwardOutput[19] = charInput[15];
    assign forwardOutput[20] = charInput[0];
    assign forwardOutput[21] = charInput[8];
    assign forwardOutput[22] = charInput[1];
    assign forwardOutput[23] = charInput[17];
    assign forwardOutput[24] = charInput[2];
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



    assign forwardOutput[0] =  forwardInput[7];
    assign forwardOutput[1] =  forwardInput[12];
    assign forwardOutput[2] =  forwardInput[21];
    assign forwardOutput[3] =  forwardInput[17];
    assign forwardOutput[4] =  forwardInput[0];
    assign forwardOutput[5] =  forwardInput[2];
    assign forwardOutput[6] =  forwardInput[22];
    assign forwardOutput[7] =  forwardInput[20];
    assign forwardOutput[8] =  forwardInput[23];
    assign forwardOutput[9] =  forwardInput[18];
    assign forwardOutput[10] = forwardInput[9];
    assign forwardOutput[11] = forwardInput[25];
    assign forwardOutput[12] = forwardInput[15];
    assign forwardOutput[13] = forwardInput[3];
    assign forwardOutput[14] = forwardInput[14];
    assign forwardOutput[15] = forwardInput[13];
    assign forwardOutput[16] = forwardInput[11];
    assign forwardOutput[17] = forwardInput[8];
    assign forwardOutput[18] = forwardInput[4];
    assign forwardOutput[19] = forwardInput[10];
    assign forwardOutput[20] = forwardInput[6];
    assign forwardOutput[21] = forwardInput[5];
    assign forwardOutput[22] = forwardInput[19];
    assign forwardOutput[23] = forwardInput[16];
    assign forwardOutput[24] = forwardInput[24];
    assign forwardOutput[25] = forwardInput[1];
 
    assign backwardOutput[7] =   backwardInput[0] ; 
    assign backwardOutput[12] =  backwardInput[1] ; 
    assign backwardOutput[21] =  backwardInput[2] ; 
    assign backwardOutput[17] =  backwardInput[3] ; 
    assign backwardOutput[0] =   backwardInput[4] ; 
    assign backwardOutput[2] =   backwardInput[5] ; 
    assign backwardOutput[22] =  backwardInput[6] ; 
    assign backwardOutput[20] =  backwardInput[7] ; 
    assign backwardOutput[23] =  backwardInput[8] ; 
    assign backwardOutput[18] =  backwardInput[9] ; 
    assign backwardOutput[9] =   backwardInput[10]; 
    assign backwardOutput[25] =  backwardInput[11]; 
    assign backwardOutput[15] =  backwardInput[12]; 
    assign backwardOutput[3] =   backwardInput[13]; 
    assign backwardOutput[14] =  backwardInput[14]; 
    assign backwardOutput[13] =  backwardInput[15]; 
    assign backwardOutput[11] =  backwardInput[16]; 
    assign backwardOutput[8] =   backwardInput[17]; 
    assign backwardOutput[4] =   backwardInput[18]; 
    assign backwardOutput[10] =  backwardInput[19]; 
    assign backwardOutput[6] =   backwardInput[20]; 
    assign backwardOutput[5] =   backwardInput[21]; 
    assign backwardOutput[19] =  backwardInput[22]; 
    assign backwardOutput[16] =  backwardInput[23]; 
    assign backwardOutput[24] =  backwardInput[24]; 
    assign backwardOutput[1] =   backwardInput[25]; 

    
endmodule

module Rotor1 (
    input [25:0] forwardInput,
    input [25:0] backwardInput,
    input [4:0] startPosition,
    input load,
    input clockIn,
    output reg clockOut,
    output [25:0] forwardOutput,
    output [25:0] backwardOutput
);
    wire [25:0] forwardOutput_shifted, backwardOutput_shifted;
    wire [25:0] forwardInput_shifted, backwardInput_shifted;

    reg [4:0] position_counter;

    always @(posedge load) begin
        position_counter = startPosition;
    end

    always @(posedge clockIn) begin
        if (clockIn == 1) begin
            if(position_counter == 26)assign clockOut = clockIn;
            else assign clockOut = 0;
            position_counter = (position_counter + 1)%26;
        end
    end


    CircularRightShift cr1(.data(forwardInput), .shiftAmount(position_counter), .out(forwardInput_shifted));
    CircularRightShift cr2(.data(backwardInput), .shiftAmount(position_counter), .out(backwardInput_shifted));
    CircularLeftShift cl1(.data(forwardOutput_shifted), .shiftAmount(position_counter), .out(forwardOutput));
    CircularLeftShift cl2(.data(backwardOutput_shifted), .shiftAmount(position_counter), .out(backwardOutput));
    
    assign forwardOutput_shifted[0] =  forwardInput_shifted[7];
    assign forwardOutput_shifted[1] =  forwardInput_shifted[12];
    assign forwardOutput_shifted[2] =  forwardInput_shifted[21];
    assign forwardOutput_shifted[3] =  forwardInput_shifted[17];
    assign forwardOutput_shifted[4] =  forwardInput_shifted[0];
    assign forwardOutput_shifted[5] =  forwardInput_shifted[2];
    assign forwardOutput_shifted[6] =  forwardInput_shifted[22];
    assign forwardOutput_shifted[7] =  forwardInput_shifted[20];
    assign forwardOutput_shifted[8] =  forwardInput_shifted[23];
    assign forwardOutput_shifted[9] =  forwardInput_shifted[18];
    assign forwardOutput_shifted[10] = forwardInput_shifted[9];
    assign forwardOutput_shifted[11] = forwardInput_shifted[25];
    assign forwardOutput_shifted[12] = forwardInput_shifted[15];
    assign forwardOutput_shifted[13] = forwardInput_shifted[3];
    assign forwardOutput_shifted[14] = forwardInput_shifted[14];
    assign forwardOutput_shifted[15] = forwardInput_shifted[13];
    assign forwardOutput_shifted[16] = forwardInput_shifted[11];
    assign forwardOutput_shifted[17] = forwardInput_shifted[8];
    assign forwardOutput_shifted[18] = forwardInput_shifted[4];
    assign forwardOutput_shifted[19] = forwardInput_shifted[10];
    assign forwardOutput_shifted[20] = forwardInput_shifted[6];
    assign forwardOutput_shifted[21] = forwardInput_shifted[5];
    assign forwardOutput_shifted[22] = forwardInput_shifted[19];
    assign forwardOutput_shifted[23] = forwardInput_shifted[16];
    assign forwardOutput_shifted[24] = forwardInput_shifted[24];
    assign forwardOutput_shifted[25] = forwardInput_shifted[1];
 
    assign backwardOutput_shifted[7] =   backwardInput_shifted[0] ; 
    assign backwardOutput_shifted[12] =  backwardInput_shifted[1] ; 
    assign backwardOutput_shifted[21] =  backwardInput_shifted[2] ; 
    assign backwardOutput_shifted[17] =  backwardInput_shifted[3] ; 
    assign backwardOutput_shifted[0] =   backwardInput_shifted[4] ; 
    assign backwardOutput_shifted[2] =   backwardInput_shifted[5] ; 
    assign backwardOutput_shifted[22] =  backwardInput_shifted[6] ; 
    assign backwardOutput_shifted[20] =  backwardInput_shifted[7] ; 
    assign backwardOutput_shifted[23] =  backwardInput_shifted[8] ; 
    assign backwardOutput_shifted[18] =  backwardInput_shifted[9] ; 
    assign backwardOutput_shifted[9] =   backwardInput_shifted[10]; 
    assign backwardOutput_shifted[25] =  backwardInput_shifted[11]; 
    assign backwardOutput_shifted[15] =  backwardInput_shifted[12]; 
    assign backwardOutput_shifted[3] =   backwardInput_shifted[13]; 
    assign backwardOutput_shifted[14] =  backwardInput_shifted[14]; 
    assign backwardOutput_shifted[13] =  backwardInput_shifted[15]; 
    assign backwardOutput_shifted[11] =  backwardInput_shifted[16]; 
    assign backwardOutput_shifted[8] =   backwardInput_shifted[17]; 
    assign backwardOutput_shifted[4] =   backwardInput_shifted[18]; 
    assign backwardOutput_shifted[10] =  backwardInput_shifted[19]; 
    assign backwardOutput_shifted[6] =   backwardInput_shifted[20]; 
    assign backwardOutput_shifted[5] =   backwardInput_shifted[21]; 
    assign backwardOutput_shifted[19] =  backwardInput_shifted[22]; 
    assign backwardOutput_shifted[16] =  backwardInput_shifted[23]; 
    assign backwardOutput_shifted[24] =  backwardInput_shifted[24]; 
    assign backwardOutput_shifted[1] =   backwardInput_shifted[25]; 
    
endmodule


module Rotor2 (
    input [25:0] forwardInput,
    input [25:0] backwardInput,
    input [4:0] startPosition,
    input load,
    input clockIn,
    output reg clockOut,
    output [25:0] forwardOutput,
    output [25:0] backwardOutput
);
    wire [25:0] forwardOutput_shifted, backwardOutput_shifted;
    wire [25:0] forwardInput_shifted, backwardInput_shifted;

    reg [4:0] position_counter;

    always @(posedge load) begin
        position_counter = startPosition;
    end

    always @(posedge clockIn) begin
        if (clockIn == 1) begin
            if(position_counter == 26)assign clockOut = clockIn;
            else assign clockOut = 0;
            position_counter = (position_counter + 1)%26;
        end
    end


    CircularRightShift cr1(.data(forwardInput), .shiftAmount(position_counter), .out(forwardInput_shifted));
    CircularRightShift cr2(.data(backwardInput), .shiftAmount(position_counter), .out(backwardInput_shifted));
    CircularLeftShift cl1(.data(forwardOutput_shifted), .shiftAmount(position_counter), .out(forwardOutput));
    CircularLeftShift cl2(.data(backwardOutput_shifted), .shiftAmount(position_counter), .out(backwardOutput));
    
    assign forwardOutput_shifted[0] = forwardInput_shifted[19];
    assign forwardOutput_shifted[1] = forwardInput_shifted[4];
    assign forwardOutput_shifted[2] = forwardInput_shifted[7];
    assign forwardOutput_shifted[3] = forwardInput_shifted[6];
    assign forwardOutput_shifted[4] = forwardInput_shifted[12];
    assign forwardOutput_shifted[5] = forwardInput_shifted[17];
    assign forwardOutput_shifted[6] = forwardInput_shifted[8];
    assign forwardOutput_shifted[7] = forwardInput_shifted[5];
    assign forwardOutput_shifted[8] = forwardInput_shifted[2];
    assign forwardOutput_shifted[9] = forwardInput_shifted[0];
    assign forwardOutput_shifted[10] = forwardInput_shifted[1];
    assign forwardOutput_shifted[11] = forwardInput_shifted[20];
    assign forwardOutput_shifted[12] = forwardInput_shifted[25];
    assign forwardOutput_shifted[13] = forwardInput_shifted[9];
    assign forwardOutput_shifted[14] = forwardInput_shifted[14];
    assign forwardOutput_shifted[15] = forwardInput_shifted[22];
    assign forwardOutput_shifted[16] = forwardInput_shifted[24];
    assign forwardOutput_shifted[17] = forwardInput_shifted[18];
    assign forwardOutput_shifted[18] = forwardInput_shifted[15];
    assign forwardOutput_shifted[19] = forwardInput_shifted[13];
    assign forwardOutput_shifted[20] = forwardInput_shifted[3];
    assign forwardOutput_shifted[21] = forwardInput_shifted[10];
    assign forwardOutput_shifted[22] = forwardInput_shifted[21];
    assign forwardOutput_shifted[23] = forwardInput_shifted[16];
    assign forwardOutput_shifted[24] = forwardInput_shifted[11];
    assign forwardOutput_shifted[25] = forwardInput_shifted[23];
    assign backwardInput_shifted[0] = backwardOutput_shifted[19];
    assign backwardInput_shifted[1] = backwardOutput_shifted[4];
    assign backwardInput_shifted[2] = backwardOutput_shifted[7];
    assign backwardInput_shifted[3] = backwardOutput_shifted[6];
    assign backwardInput_shifted[4] = backwardOutput_shifted[12];
    assign backwardInput_shifted[5] = backwardOutput_shifted[17];
    assign backwardInput_shifted[6] = backwardOutput_shifted[8];
    assign backwardInput_shifted[7] = backwardOutput_shifted[5];
    assign backwardInput_shifted[8] = backwardOutput_shifted[2];
    assign backwardInput_shifted[9] = backwardOutput_shifted[0];
    assign backwardInput_shifted[10] = backwardOutput_shifted[1];
    assign backwardInput_shifted[11] = backwardOutput_shifted[20];
    assign backwardInput_shifted[12] = backwardOutput_shifted[25];
    assign backwardInput_shifted[13] = backwardOutput_shifted[9];
    assign backwardInput_shifted[14] = backwardOutput_shifted[14];
    assign backwardInput_shifted[15] = backwardOutput_shifted[22];
    assign backwardInput_shifted[16] = backwardOutput_shifted[24];
    assign backwardInput_shifted[17] = backwardOutput_shifted[18];
    assign backwardInput_shifted[18] = backwardOutput_shifted[15];
    assign backwardInput_shifted[19] = backwardOutput_shifted[13];
    assign backwardInput_shifted[20] = backwardOutput_shifted[3];
    assign backwardInput_shifted[21] = backwardOutput_shifted[10];
    assign backwardInput_shifted[22] = backwardOutput_shifted[21];
    assign backwardInput_shifted[23] = backwardOutput_shifted[16];
    assign backwardInput_shifted[24] = backwardOutput_shifted[11];
    assign backwardInput_shifted[25] = backwardOutput_shifted[23];
    
endmodule

module Rotor3 (
    input [25:0] forwardInput,
    input [25:0] backwardInput,
    input [4:0] startPosition,
    input load,
    input clockIn,
    output reg clockOut,
    output [25:0] forwardOutput,
    output [25:0] backwardOutput
);
    wire [25:0] forwardOutput_shifted, backwardOutput_shifted;
    wire [25:0] forwardInput_shifted, backwardInput_shifted;

    reg [4:0] position_counter;

    always @(posedge load) begin
        position_counter = startPosition;
    end

    always @(posedge clockIn) begin
        if (clockIn == 1) begin
            if(position_counter == 26)assign clockOut = clockIn;
            else assign clockOut = 0;
            position_counter = (position_counter + 1)%26;
        end
    end


    CircularRightShift cr1(.data(forwardInput), .shiftAmount(position_counter), .out(forwardInput_shifted));
    CircularRightShift cr2(.data(backwardInput), .shiftAmount(position_counter), .out(backwardInput_shifted));
    CircularLeftShift cl1(.data(forwardOutput_shifted), .shiftAmount(position_counter), .out(forwardOutput));
    CircularLeftShift cl2(.data(backwardOutput_shifted), .shiftAmount(position_counter), .out(backwardOutput));
    
    assign forwardOutput_shifted[0] = forwardInput_shifted[19];
    assign     forwardOutput_shifted[1] = forwardInput_shifted[0];
    assign     forwardOutput_shifted[2] = forwardInput_shifted[6];
    assign     forwardOutput_shifted[3] = forwardInput_shifted[1];
    assign     forwardOutput_shifted[4] = forwardInput_shifted[15];
    assign     forwardOutput_shifted[5] = forwardInput_shifted[2];
    assign     forwardOutput_shifted[6] = forwardInput_shifted[18];
    assign     forwardOutput_shifted[7] = forwardInput_shifted[3];
    assign     forwardOutput_shifted[8] = forwardInput_shifted[16];
    assign     forwardOutput_shifted[9] = forwardInput_shifted[4];
    assign     forwardOutput_shifted[10] = forwardInput_shifted[20];
    assign     forwardOutput_shifted[11] = forwardInput_shifted[5];
    assign     forwardOutput_shifted[12] = forwardInput_shifted[21];
    assign     forwardOutput_shifted[13] = forwardInput_shifted[13];
    assign     forwardOutput_shifted[14] = forwardInput_shifted[25];
    assign     forwardOutput_shifted[15] = forwardInput_shifted[7];
    assign     forwardOutput_shifted[16] = forwardInput_shifted[24];
    assign     forwardOutput_shifted[17] = forwardInput_shifted[8];
    assign     forwardOutput_shifted[18] = forwardInput_shifted[23];
    assign     forwardOutput_shifted[19] = forwardInput_shifted[9];
    assign     forwardOutput_shifted[20] = forwardInput_shifted[22];
    assign     forwardOutput_shifted[21] = forwardInput_shifted[11];
    assign     forwardOutput_shifted[22] = forwardInput_shifted[17];
    assign     forwardOutput_shifted[23] = forwardInput_shifted[10];
    assign     forwardOutput_shifted[24] = forwardInput_shifted[14];
    assign     forwardOutput_shifted[25] = forwardInput_shifted[12];
    assign     backwardInput_shifted[0] = backwardOutput_shifted[19];
    assign     backwardInput_shifted[1] = backwardOutput_shifted[0];
    assign     backwardInput_shifted[2] = backwardOutput_shifted[6];
    assign     backwardInput_shifted[3] = backwardOutput_shifted[1];
    assign     backwardInput_shifted[4] = backwardOutput_shifted[15];
    assign     backwardInput_shifted[5] = backwardOutput_shifted[2];
    assign     backwardInput_shifted[6] = backwardOutput_shifted[18];
    assign     backwardInput_shifted[7] = backwardOutput_shifted[3];
    assign     backwardInput_shifted[8] = backwardOutput_shifted[16];
    assign     backwardInput_shifted[9] = backwardOutput_shifted[4];
    assign     backwardInput_shifted[10] = backwardOutput_shifted[20];
    assign     backwardInput_shifted[11] = backwardOutput_shifted[5];
    assign     backwardInput_shifted[12] = backwardOutput_shifted[21];
    assign     backwardInput_shifted[13] = backwardOutput_shifted[13];
    assign     backwardInput_shifted[14] = backwardOutput_shifted[25];
    assign     backwardInput_shifted[15] = backwardOutput_shifted[7];
    assign     backwardInput_shifted[16] = backwardOutput_shifted[24];
    assign     backwardInput_shifted[17] = backwardOutput_shifted[8];
    assign     backwardInput_shifted[18] = backwardOutput_shifted[23];
    assign     backwardInput_shifted[19] = backwardOutput_shifted[9];
    assign     backwardInput_shifted[20] = backwardOutput_shifted[22];
    assign     backwardInput_shifted[21] = backwardOutput_shifted[11];
    assign     backwardInput_shifted[22] = backwardOutput_shifted[17];
    assign     backwardInput_shifted[23] = backwardOutput_shifted[10];
    assign     backwardInput_shifted[24] = backwardOutput_shifted[14];
    assign     backwardInput_shifted[25] = backwardOutput_shifted[12];
    
endmodule

module reflector (
    input [25:0] inputConnection,
    output [25:0] outputConnection
);

    assign outputConnection[0] = inputConnection[24];
    assign outputConnection[1] = inputConnection[17];
    assign outputConnection[2] = inputConnection[20];
    assign outputConnection[3] = inputConnection[7];
    assign outputConnection[4] = inputConnection[16];
    assign outputConnection[5] = inputConnection[18];
    assign outputConnection[6] = inputConnection[11];
    assign outputConnection[7] = inputConnection[3];
    assign outputConnection[8] = inputConnection[15];
    assign outputConnection[9] = inputConnection[23];
    assign outputConnection[10] = inputConnection[13];
    assign outputConnection[11] = inputConnection[6];
    assign outputConnection[12] = inputConnection[14];
    assign outputConnection[13] = inputConnection[10];
    assign outputConnection[14] = inputConnection[12];
    assign outputConnection[15] = inputConnection[8];
    assign outputConnection[16] = inputConnection[4];
    assign outputConnection[17] = inputConnection[1];
    assign outputConnection[18] = inputConnection[5];
    assign outputConnection[19] = inputConnection[25];
    assign outputConnection[20] = inputConnection[2];
    assign outputConnection[21] = inputConnection[22];
    assign outputConnection[22] = inputConnection[21];
    assign outputConnection[23] = inputConnection[9];
    assign outputConnection[24] = inputConnection[0];
    assign outputConnection[25] = inputConnection[19];
    
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


    CharDecoder decoder(.char(char), .decodedChar(decodedChar));
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
*/
