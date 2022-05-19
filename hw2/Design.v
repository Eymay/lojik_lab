module nor_gate (input i_1, i_2, output o);
assign o = ~(i_1 | i_2);
endmodule

module nand_gate (input i_1, i_2, output o);
assign o = ~(i_1 & i_2);
endmodule

module or_gate_wNand (input i_1, i_2, output o);
wire temp1, temp2;
nand_gate nand1(i_1, i_1, temp1);
nand_gate nand2(i_2, i_2, temp2);

nand_gate nand3(temp1, temp2, o);
endmodule

module and_gate_wNand (input i_1, i_2, output o);
wire temp1;
nand_gate nand1(i_1, i_2, temp1);
nand_gate nand2(temp1,temp1, o);
endmodule

module nand3_gate(input i_1 , i_2 , i_3 , output o);
wire temp1, temp2;
nand_gate nand1(.i_1(i_1), .i_2(i_2),.o(temp1));
nand_gate nand2(.i_1(temp1), .i_2(temp1),.o(temp2));
nand_gate nand3(.i_1(temp2),.i_2(i_3),.o(o));
endmodule


module SR_Latch (input S, R, output Q, Q_not);
/*
nor_gate nor1(.i_1(R), .i_2(Q_not), .o(Q));
nor_gate nor2(.i_1(Q), .i_2(S), .o(Q_not));
*/
/*wire s_not, r_not;
nand_gate not1(S, S, s_not);
nand_gate not2(R, R, r_not);
nand_gate nand1(.i_1(s_not), .i_2(Q_not), .o(Q));
nand_gate nand2(.i_1(Q), .i_2(r_not), .o(Q_not));
*/
nand_gate nand1(.i_1(S), .i_2(Q_not), .o(Q));
nand_gate nand2(.i_1(Q), .i_2(R), .o(Q_not));
endmodule

module SR_Latch_wEn (input S, R, En, output Q, Q_not);
wire temp1, temp2;
nand_gate nand1(.i_1(S), .i_2(En), .o(temp1));
nand_gate nand2(.i_1(En), .i_2(R), .o(temp2));

nand_gate nand3(.i_1(temp1), .i_2(Q_not), .o(Q));
nand_gate nand4(.i_1(temp2), .i_2(Q), .o(Q_not));

endmodule 

module SR_Latch_wEn_wPreClr (input S, R, En,Pre ,Clr, output Q, Q_not);
wire temp1, temp2;
wire Pre_not, Clr_not;
nand_gate nand1(.i_1(S), .i_2(En), .o(temp1));
nand_gate nand2(.i_1(En), .i_2(R), .o(temp2));

nand_gate nand3(Pre, Pre, Pre_not);
nand_gate nand4(Clr, Clr, Clr_not);

nand3_gate nand3_1(.i_1(temp1), .i_2(Q_not), .i_3(Pre_not), .o(Q));
nand3_gate nand3_2(.i_1(temp2), .i_2(Q), .i_3(Clr_not), .o(Q_not));

endmodule 

module D_latch (input D, En, output Q, Q_not);
wire temp1;
nand_gate nand1(.i_1(D), .i_2(D), .o(temp1));
SR_Latch_wEn SR_Latch(.S(D), .R(temp1), .En(En), .Q(Q), .Q_not(Q_not));
endmodule

module D_latch_wPreClr (input D, En, Pre, Clr, output Q, Q_not);
wire temp1;
nand_gate nand1(.i_1(D), .i_2(D), .o(temp1));
SR_Latch_wEn_wPreClr sr1(.S(D), .R(temp1), .En(En), .Pre(Pre), .Clr(Clr), .Q(Q) ,.Q_not(Q_not));
endmodule

module D_flipflop (input D, Clk, output Q, Q_not);
wire clk_not, clk_not_not;
wire Q1;
nand_gate nand1(.i_1(Clk), .i_2(Clk), .o(clk_not));
nand_gate nand2(.i_1(clk_not), .i_2(clk_not), .o(clk_not_not));


D_latch D_latch1 (.D(D), .En(clk_not), .Q(Q1));
D_latch D_latch2 (.D(Q1), .En(clk_not_not), .Q(Q), .Q_not(Q_not));
endmodule

module D_flipflop_wPreClr (input D, Clk, Pre, Clr, output Q, Q_not);
wire clk_not, clk_not_not;
wire Q1;
nand_gate nand1(.i_1(Clk), .i_2(Clk), .o(clk_not));
nand_gate nand2(.i_1(clk_not), .i_2(clk_not), .o(clk_not_not));

D_latch_wPreClr d1(.D(D), .En(clk_not), .Pre(Clr), .Clr(Pre), .Q(Q1));
D_latch_wPreClr d2(.D(Q1), .En(clk_not_not), .Pre(Pre), .Clr(Clr), .Q(Q) ,.Q_not(Q_not));

endmodule

module JK_flipflop (input J, K, Clk, output Q, Q_not);
wire master1, master2;
wire temp1, temp2;
wire slave1, slave2;
wire K_not;
wire clk_not;

nand_gate nand1(Clk,Clk, clk_not);
nand3_gate nand3_1(.i_1(Q_not), .i_2(J), .i_3(Clk), .o(master1));
nand3_gate nand3_2(.i_1(Clk), .i_2(K), .i_3(Q), .o(master2));

SR_Latch sr1(.S(master1), .R(master2), .Q(temp1), .Q_not(temp2));

nand_gate nand2(.i_1(temp1), .i_2(clk_not), .o(slave1));
nand_gate nand3(.i_1(temp2), .i_2(clk_not), .o(slave2));

SR_Latch sr2(.S(slave1), .R(slave2), .Q(Q), .Q_not(Q_not));

//nand_gate nand_1(.i_1(temp1), .i_2(Q_not), .o(Q));
//nand_gate nand_2(.i_1(temp2), .i_2(Q), .o(Q_not));
/*
not edge triggered
nand_gate nand1(K, K, K_not);

and_gate_wNand and1(Q_not, J, temp1);
and_gate_wNand and2(Q, K_not, temp2);
or_gate_wNand or1(temp1, temp2, temp3);

D_latch d1(.D(temp3), .En(Clk), .Q(Q), .Q_not(Q_not));
*/



endmodule

module JK_flipflop_wClearPreset (input J, K, Clk, Pre, Clr, output Q, Q_not);
wire temp1, temp2,temp3,temp4;
wire m1, m1_not,m2,m2_not;


nand_gate nand1(K, K, K_not);

and_gate_wNand and1(Q_not, J, temp1);
and_gate_wNand and2(Q, K_not, temp2);
or_gate_wNand or1(temp1, temp2, temp3);

D_latch_wPreClr d1(.D(temp3), .En(Clk), .Pre(Pre), .Clr(Clr), .Q(Q), .Q_not(Q_not));




endmodule

module async_JK_counter_0to14(input Clk,pre, output [3:0]b);
wire reset;
wire [3:0]bn;
JK_flipflop_wClearPreset jk1(.J(1), .K(1), .Clk(Clk), .Pre(pre), .Clr(reset), .Q(b[0]), .Q_not(bn[0]));
JK_flipflop_wClearPreset jk2(.J(1), .K(1), .Clk(b[0]), .Pre(pre), .Clr(reset), .Q(b[1]), .Q_not(bn[1]));
JK_flipflop_wClearPreset jk3(.J(1), .K(1), .Clk(b[1]), .Pre(pre), .Clr(reset), .Q(b[2]), .Q_not(bn[2]));
JK_flipflop_wClearPreset jk4(.J(1), .K(1), .Clk(b[2]), .Pre(pre), .Clr(reset), .Q(b[3]), .Q_not(bn[3]));

assign reset =  1;
endmodule

module sync_JK_counter_0to14(input Clk, output b0, b1, b2, b3);

wire  j23, j34;

JK_flipflop jk1(.J(1), .K(1), .Clk(Clk), .Q(b0));
JK_flipflop jk2(.J(b0), .K(b0), .Clk(Clk),  .Q(b1));
assign j23 = b0&b1;
JK_flipflop jk3(.J(j23), .K(j23), .Clk(Clk),  .Q(b2));
assign j34 = j23 & b2;
JK_flipflop jk4(.J(j34), .K(j34), .Clk(Clk),  .Q(b3));


endmodule


module pulse_generator(input [7:0]value, Clk, load, output pulse);
//link https://assets.nexperia.com/documents/data-sheet/74LV165A.pdf
wire [7:0] data_line;
wire [6:0] shift_line;
assign data_line[7:0] = load & value[7:0];
D_flipflop_wPreClr D0 (.D(load), .Clk(Clk), .Pre(data_line[0]), .Q(shift_line[0]));
D_flipflop_wPreClr D1 (.D(shift_line[0]), .Clk(Clk), .Pre(data_line[1]), .Q(shift_line[1]));
D_flipflop_wPreClr D2 (.D(shift_line[1]), .Clk(Clk), .Pre(data_line[2]), .Q(shift_line[2]));
D_flipflop_wPreClr D3 (.D(shift_line[2]), .Clk(Clk), .Pre(data_line[3]), .Q(shift_line[3]));
D_flipflop_wPreClr D4 (.D(shift_line[3]), .Clk(Clk), .Pre(data_line[4]), .Q(shift_line[4]));
D_flipflop_wPreClr D5 (.D(shift_line[4]), .Clk(Clk), .Pre(data_line[5]), .Q(shift_line[5]));
D_flipflop_wPreClr D6 (.D(shift_line[5]), .Clk(Clk), .Pre(data_line[6]), .Q(shift_line[6]));
D_flipflop_wPreClr D7 (.D(shift_line[6]), .Clk(Clk), .Pre(data_line[7]), .Q(pulse));
endmodule
