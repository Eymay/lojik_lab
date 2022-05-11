//Part1

module CharDecoder (
    input [7:0] char,
    output [25:0] decodedChar
);
    always @(*) begin
        case (char)
            'A': decodedChar = 7'h0000001;
            'B': decodedChar = 7'h0000002;
            'C': decodedChar = 7'h0000004;
            'D': decodedChar = 7'h0000008;
            'E': decodedChar = 7'h0000010;
            'F': decodedChar = 7'h0000020;
            'G': decodedChar = 7'h0000040;
            'H': decodedChar = 7'h0000080;
            'I': decodedChar = 7'h0000100;
            'J': decodedChar = 7'h0000200;
            'K': decodedChar = 7'h0000400;
            'L': decodedChar = 7'h0000800;
            'M': decodedChar = 7'h0001000;
            'N': decodedChar = 7'h0002000;
            'O': decodedChar = 7'h0004000;
            'P': decodedChar = 7'h0008000;
            'Q': decodedChar = 7'h0010000;
            'R': decodedChar = 7'h0020000;
            'S': decodedChar = 7'h0040000;
            'T': decodedChar = 7'h0080000;
            'U': decodedChar = 7'h0100000;
            'V': decodedChar = 7'h0200000;
            'W': decodedChar = 7'h0400000;
            'X': decodedChar = 7'h0800000;
            'Y': decodedChar = 7'h1000000;
            'Z': decodedChar = 7'h2000000;
    end

endmodule

module CharEncoder (
    input [25:0] decodedChar
    output [7:0] char
);
    always @(*) begin
        case (decodedChar)
            7'h0000001: char = 'A';
            7'h0000002: char = 'B';
            7'h0000004: char = 'C';
            7'h0000008: char = 'D';
            7'h0000010: char = 'E';
            7'h0000020: char = 'F';
            7'h0000040: char = 'G';
            7'h0000080: char = 'H';
            7'h0000100: char = 'I';
            7'h0000200: char = 'J';
            7'h0000400: char = 'K';
            7'h0000800: char = 'L';
            7'h0001000: char = 'M';
            7'h0002000: char = 'N';
            7'h0004000: char = 'O';
            7'h0008000: char = 'P';
            7'h0010000: char = 'Q';
            7'h0020000: char = 'R';
            7'h0040000: char = 'S';
            7'h0080000: char = 'T';
            7'h0100000: char = 'U';
            7'h0200000: char = 'V';
            7'h0400000: char = 'W';
            7'h0800000: char = 'X';
            7'h1000000: char = 'Y';
            7'h2000000: char = 'Z';
    end

endmodule

module CircularLeftShift (
    input [25:0] data,
    input [4:0] shiftAmount,
    output [25:0] out
);
    out = (data << shiftAmount) | (data >> (26-shiftAmount));
endmodule

module CircularRightShift (
    input [25:0] data,
    input [4:0] shiftAmount,
    output [25:0] out
);
    out = (data >> shiftAmount) | (data << (26-shiftAmount));
endmodule
