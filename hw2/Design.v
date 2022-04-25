module nor_gate (input i_1, i_2, output o);
assign o = ~(i_1 | i_2);
endmodule

module nand_gate (input i_1, i_2, output o);
assign o = ~(i_1 & i_2);
endmodule

module nand3_gate(input i_1 , i_2 , i_3 , output o);
wire temp1, temp2;
nand_gate nand1(.i_1(i_1), .i_2(i_2),.o(temp1));
nand_gate nand2(.i_1(temp1), .i_2(temp1),.o(temp2));
nand_gate nand3(.i_1(temp2),.i_2(i_3),.o(o));
endmodule


module SR_Latch (input S, R, output Q, Q_not);

nor_gate nor1(.i_1(R), .i_2(Q_not), .o(Q));
nor_gate nor2(.i_1(Q), .i_2(S), .o(Q_not));

endmodule

module SR_Latch_wEn (input S, R, En, output Q, Q_not);
wire temp1, temp2;
nand_gate nand1(.i_1(S), .i_2(En), .o(temp1));
nand_gate nand2(.i_1(En), .i_2(R), .o(temp2));

nand_gate nand3(.i_1(temp1), .i_2(Q_not), .o(Q));
nand_gate nand4(.i_1(temp2), .i_2(Q), .o(Q_not));

endmodule 

module D_flipflop (input D, Clk, output Q, Q_not);
wire temp1;
nand_gate nand1(.i_1(D), .i_2(D), .o(temp1));
SR_Latch_wEn SR_Latch(.S(D), .R(temp1), .En(Clk), .Q(Q), .Q_not(Q_not));

endmodule

module JK_flipflop (input J, K, Clk, output Q, Q_not);
wire temp1, temp2;

nand3_gate nand3_1(.i_1(Q_not), .i_2(J), .i_3(Clk), .o(temp1));
nand3_gate nand3_2(.i_1(Clk), .i_2(K), .i_3(Q), .o(temp2));

nand_gate nand1(.i_1(temp1), .i_2(Q_not), .o(Q));
nand_gate nand2(.i_1(temp2), .i_2(Q), .o(Q_not));
endmodule