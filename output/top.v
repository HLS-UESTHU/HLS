/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12-SP5-2
// Date      : Sun Jun 27 14:20:53 2021
/////////////////////////////////////////////////////////////


module top ( clk, rst_n, initial_time_hh, initial_time_mm, initial_time_valid, 
        PEbar, data_1, data_2, B0, B1, B2, B3, B4, B5, B6, out, h1_7, h0_7, 
        m1_7, m0_7, FIR_out0_7, FIR_out1_7, FIR_out2_7, ap );
  input [4:0] initial_time_hh;
  input [5:0] initial_time_mm;
  input [7:0] data_1;
  input [7:0] data_2;
  input [7:0] B0;
  input [7:0] B1;
  input [7:0] B2;
  input [7:0] B3;
  input [7:0] B4;
  input [7:0] B5;
  input [7:0] B6;
  output [7:0] out;
  output [6:0] h1_7;
  output [6:0] h0_7;
  output [6:0] m1_7;
  output [6:0] m0_7;
  output [6:0] FIR_out0_7;
  output [6:0] FIR_out1_7;
  output [6:0] FIR_out2_7;
  output [3:0] ap;
  input clk, rst_n, initial_time_valid, PEbar;

  wire   [7:0] data;
  wire   [3:0] FIR_out0;
  wire   [3:0] FIR_out1;
  wire   [3:0] FIR_out2;
  wire   [4:0] hh_2;
  wire   [5:0] mm_2;
  wire   [3:0] h0;
  wire   [3:0] h1;
  wire   [3:0] m0;
  wire   [3:0] m1;
  wire   SYNOPSYS_UNCONNECTED__0;

  FIRROOT UFIRROOT ( .clk(clk), .Data_i(data), .B0(B0), .B1(B1), .B2(B2), .B3(
        B3), .B4(B4), .B5(B5), .B6(B6), .FIRout(out), .ROOTout(ap) );
  bcd_2 bcd_fir ( .clk(clk), .rst_n(rst_n), .bin_in(out), .dec_out0(FIR_out0), 
        .dec_out1(FIR_out1), .dec_out2({SYNOPSYS_UNCONNECTED__0, FIR_out2[2:0]}) );
  decode7_6 dec0 ( .in(FIR_out0), .led(FIR_out0_7) );
  decode7_5 dec1 ( .in(FIR_out1), .led(FIR_out1_7) );
  decode7_4 dec2 ( .in({1'b0, FIR_out2[2:0]}), .led(FIR_out2_7) );
  RTC RTC ( .clk(clk), .rst_n(rst_n), .initial_time_hh(initial_time_hh), 
        .initial_time_mm(initial_time_mm), .initial_time_valid(
        initial_time_valid), .hh(hh_2), .mm(mm_2) );
  bcd_1 bcd_RTC_hh ( .clk(clk), .rst_n(rst_n), .bin_in({1'b0, 1'b0, 1'b0, hh_2}), .dec_out0(h0), .dec_out1(h1) );
  decode7_3 dec3 ( .in(h0), .led(h0_7) );
  decode7_2 dec4 ( .in(h1), .led(h1_7) );
  bcd_0 bcd_RTC_mm ( .clk(clk), .rst_n(rst_n), .bin_in({1'b0, 1'b0, mm_2}), 
        .dec_out0(m0), .dec_out1(m1) );
  decode7_1 dec5 ( .in(m0), .led(m0_7) );
  decode7_0 dec6 ( .in(m1), .led(m1_7) );
  AND3X2 U11 ( .A(data_1[0]), .B(PEbar), .C(data_2[0]), .Y(data[0]) );
  AND3X2 U12 ( .A(data_1[2]), .B(PEbar), .C(data_2[2]), .Y(data[2]) );
  AND3X2 U13 ( .A(data_1[3]), .B(PEbar), .C(data_2[3]), .Y(data[3]) );
  AND3X2 U14 ( .A(data_1[1]), .B(PEbar), .C(data_2[1]), .Y(data[1]) );
  AND3X2 U15 ( .A(data_1[4]), .B(PEbar), .C(data_2[4]), .Y(data[4]) );
  AND3X2 U16 ( .A(data_1[5]), .B(PEbar), .C(data_2[5]), .Y(data[5]) );
  AND3X2 U17 ( .A(data_1[6]), .B(PEbar), .C(data_2[6]), .Y(data[6]) );
  AND3X2 U18 ( .A(data_1[7]), .B(PEbar), .C(data_2[7]), .Y(data[7]) );
endmodule


module decode7_0 ( in, led );
  input [3:0] in;
  output [6:0] led;
  wire   n1, n2, n3, n4, n5, n6, n7, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;

  NAND3X1 U3 ( .A(n31), .B(n30), .C(n47), .Y(led[0]) );
  AND3X2 U4 ( .A(n34), .B(n49), .C(n45), .Y(n36) );
  NAND2X1 U5 ( .A(n7), .B(n6), .Y(n38) );
  OR2X1 U6 ( .A(n38), .B(in[0]), .Y(n31) );
  NAND3X1 U7 ( .A(n37), .B(n48), .C(n36), .Y(led[2]) );
  NAND3X1 U8 ( .A(n35), .B(n43), .C(n36), .Y(led[1]) );
  NAND3BX1 U9 ( .AN(in[0]), .B(n6), .C(n41), .Y(n35) );
  AND2X1 U10 ( .A(n39), .B(n43), .Y(n47) );
  AOI211X1 U11 ( .A0(n5), .A1(n33), .B0(n1), .C0(n46), .Y(n39) );
  INVX2 U12 ( .A(n34), .Y(n1) );
  NAND3X1 U13 ( .A(n49), .B(n48), .C(n47), .Y(led[6]) );
  NOR2X1 U14 ( .A(n5), .B(n7), .Y(n41) );
  INVX2 U15 ( .A(n29), .Y(n3) );
  NAND4BX1 U16 ( .AN(n46), .B(n45), .C(n44), .D(n43), .Y(led[5]) );
  NAND2X1 U17 ( .A(n33), .B(n29), .Y(n30) );
  NAND3X1 U18 ( .A(in[0]), .B(n6), .C(n41), .Y(n34) );
  NOR2X1 U19 ( .A(n6), .B(in[0]), .Y(n33) );
  NAND4X1 U20 ( .A(n39), .B(n44), .C(n49), .D(n38), .Y(led[3]) );
  INVX2 U21 ( .A(in[2]), .Y(n6) );
  AOI211X1 U22 ( .A0(in[1]), .A1(n33), .B0(n4), .C0(n32), .Y(n45) );
  INVX2 U23 ( .A(n30), .Y(n4) );
  OAI21X1 U24 ( .A0(in[0]), .A1(n48), .B0(n31), .Y(n32) );
  INVX2 U25 ( .A(in[1]), .Y(n7) );
  NAND3X1 U26 ( .A(n6), .B(n5), .C(in[1]), .Y(n48) );
  OAI211X1 U27 ( .A0(in[2]), .A1(n3), .B0(n35), .C0(n37), .Y(n46) );
  NAND4X1 U28 ( .A(in[2]), .B(in[0]), .C(n7), .D(n5), .Y(n37) );
  NOR2X1 U29 ( .A(n5), .B(in[1]), .Y(n29) );
  INVX2 U30 ( .A(in[3]), .Y(n5) );
  NAND2X1 U31 ( .A(n41), .B(in[2]), .Y(n43) );
  OAI32X1 U32 ( .A0(n42), .A1(in[0]), .A2(n2), .B0(n41), .B1(n40), .Y(led[4])
         );
  AOI21X1 U33 ( .A0(in[0]), .A1(n42), .B0(n6), .Y(n40) );
  OAI21X1 U34 ( .A0(n7), .A1(in[3]), .B0(n3), .Y(n42) );
  INVX2 U35 ( .A(n43), .Y(n2) );
  NAND3X1 U36 ( .A(in[0]), .B(n29), .C(in[2]), .Y(n49) );
  NAND3X1 U37 ( .A(in[1]), .B(n5), .C(in[0]), .Y(n44) );
endmodule


module decode7_1 ( in, led );
  input [3:0] in;
  output [6:0] led;
  wire   n1, n2, n3, n4, n5, n6, n7, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;

  NAND3X1 U3 ( .A(n31), .B(n30), .C(n47), .Y(led[0]) );
  AND3X2 U4 ( .A(n34), .B(n49), .C(n45), .Y(n36) );
  NAND2X1 U5 ( .A(n7), .B(n6), .Y(n38) );
  OR2X1 U6 ( .A(n38), .B(in[0]), .Y(n31) );
  NAND3X1 U7 ( .A(n37), .B(n48), .C(n36), .Y(led[2]) );
  NAND3X1 U8 ( .A(n35), .B(n43), .C(n36), .Y(led[1]) );
  NAND3BX1 U9 ( .AN(in[0]), .B(n6), .C(n41), .Y(n35) );
  AND2X1 U10 ( .A(n39), .B(n43), .Y(n47) );
  AOI211X1 U11 ( .A0(n5), .A1(n33), .B0(n1), .C0(n46), .Y(n39) );
  INVX2 U12 ( .A(n34), .Y(n1) );
  NAND3X1 U13 ( .A(n49), .B(n48), .C(n47), .Y(led[6]) );
  NOR2X1 U14 ( .A(n5), .B(n7), .Y(n41) );
  INVX2 U15 ( .A(n29), .Y(n3) );
  NAND4BX1 U16 ( .AN(n46), .B(n45), .C(n44), .D(n43), .Y(led[5]) );
  NAND2X1 U17 ( .A(n33), .B(n29), .Y(n30) );
  NAND3X1 U18 ( .A(in[0]), .B(n6), .C(n41), .Y(n34) );
  NOR2X1 U19 ( .A(n6), .B(in[0]), .Y(n33) );
  NAND4X1 U20 ( .A(n39), .B(n44), .C(n49), .D(n38), .Y(led[3]) );
  INVX2 U21 ( .A(in[2]), .Y(n6) );
  AOI211X1 U22 ( .A0(in[1]), .A1(n33), .B0(n4), .C0(n32), .Y(n45) );
  INVX2 U23 ( .A(n30), .Y(n4) );
  OAI21X1 U24 ( .A0(in[0]), .A1(n48), .B0(n31), .Y(n32) );
  INVX2 U25 ( .A(in[1]), .Y(n7) );
  NAND3X1 U26 ( .A(n6), .B(n5), .C(in[1]), .Y(n48) );
  OAI211X1 U27 ( .A0(in[2]), .A1(n3), .B0(n35), .C0(n37), .Y(n46) );
  NAND4X1 U28 ( .A(in[2]), .B(in[0]), .C(n7), .D(n5), .Y(n37) );
  NOR2X1 U29 ( .A(n5), .B(in[1]), .Y(n29) );
  INVX2 U30 ( .A(in[3]), .Y(n5) );
  NAND2X1 U31 ( .A(n41), .B(in[2]), .Y(n43) );
  OAI32X1 U32 ( .A0(n42), .A1(in[0]), .A2(n2), .B0(n41), .B1(n40), .Y(led[4])
         );
  AOI21X1 U33 ( .A0(in[0]), .A1(n42), .B0(n6), .Y(n40) );
  OAI21X1 U34 ( .A0(n7), .A1(in[3]), .B0(n3), .Y(n42) );
  INVX2 U35 ( .A(n43), .Y(n2) );
  NAND3X1 U36 ( .A(in[0]), .B(n29), .C(in[2]), .Y(n49) );
  NAND3X1 U37 ( .A(in[1]), .B(n5), .C(in[0]), .Y(n44) );
endmodule


module bcd_0 ( clk, rst_n, bin_in, dec_out0, dec_out1, dec_out2 );
  input [7:0] bin_in;
  output [3:0] dec_out0;
  output [3:0] dec_out1;
  output [3:0] dec_out2;
  input clk, rst_n;
  wire   N79, N80, N81, N82, N83, N84, N85, N86, N130, N131, N132, N182, N183,
         N184, N185, N186, N187, N190, N191, N192, N193, N194, N198, N199,
         N200, N201, N202, N203, N204, N205, N206, N207, N221, N222, N223,
         N273, N274, N275, N276, N277, N278, N281, N282, N283, N284, N285,
         N289, N290, N291, N292, N293, N294, N295, N296, N297, N298, N307,
         N308, N309, \add_148_C115/carry[3] , \add_148_C115/carry[4] ,
         \add_146_C115/carry[4] , \add_144_C115/carry[3] ,
         \add_144_C115/carry[4] , \add_148_C114/carry[3] ,
         \add_148_C114/carry[4] , \add_146_C114/carry[4] ,
         \add_144_C114/carry[3] , \add_144_C114/carry[4] ,
         \add_0_root_add_0_root_add_136_3_C115/carry[1] ,
         \add_0_root_add_0_root_add_136_3_C115/carry[2] ,
         \add_0_root_add_0_root_add_136_3_C115/carry[3] ,
         \add_0_root_add_0_root_add_136_3_C115/B[0] ,
         \add_0_root_add_0_root_add_136_3_C115/B[1] ,
         \add_0_root_add_0_root_add_136_3_C116/carry[1] ,
         \add_0_root_add_0_root_add_136_3_C116/B[0] ,
         \add_0_root_add_0_root_add_136_3_C116/B[1] ,
         \add_0_root_add_0_root_add_136_3_C114/carry[2] ,
         \add_0_root_add_0_root_add_136_3_C114/carry[3] ,
         \add_0_root_add_0_root_add_136_3_C114/B[1] ,
         \add_0_root_add_0_root_add_136_3_C114/B[2] ,
         \add_0_root_add_0_root_add_136_3_C114/B[3] , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59;
  wire   [9:0] data_1;
  assign dec_out2[3] = 1'b0;

  DFFRHQX1 \data_0_reg[0]  ( .D(bin_in[0]), .CK(clk), .RN(rst_n), .Q(N182) );
  DFFRHQX1 \data_b_reg[5]  ( .D(N298), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C116/B[1] ) );
  DFFRHQX1 \data_1_reg[9]  ( .D(N86), .CK(clk), .RN(rst_n), .Q(data_1[9]) );
  DFFRHQX1 \data_1_reg[8]  ( .D(N85), .CK(clk), .RN(rst_n), .Q(data_1[8]) );
  DFFRHQX1 \data_b_reg[4]  ( .D(N297), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C116/B[0] ) );
  DFFRHQX1 \data_1_reg[7]  ( .D(N84), .CK(clk), .RN(rst_n), .Q(data_1[7]) );
  DFFRHQX1 \data_0_reg[3]  ( .D(bin_in[3]), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C114/B[3] ) );
  DFFRHQX1 \data_1_reg[3]  ( .D(N81), .CK(clk), .RN(rst_n), .Q(data_1[3]) );
  DFFRHQX1 \data_1_reg[6]  ( .D(N83), .CK(clk), .RN(rst_n), .Q(data_1[6]) );
  DFFRHQX1 \data_0_reg[2]  ( .D(bin_in[2]), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C114/B[2] ) );
  DFFRHQX1 \data_1_reg[2]  ( .D(N80), .CK(clk), .RN(rst_n), .Q(data_1[2]) );
  DFFRHQX1 \data_0_reg[1]  ( .D(bin_in[1]), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C114/B[1] ) );
  DFFRHQX1 \data_1_reg[1]  ( .D(N79), .CK(clk), .RN(rst_n), .Q(data_1[1]) );
  DFFRHQX1 \data_a_reg[5]  ( .D(N207), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C115/B[1] ) );
  DFFRHQX1 \data_1_reg[4]  ( .D(N79), .CK(clk), .RN(rst_n), .Q(data_1[4]) );
  DFFRHQX1 \data_a_reg[4]  ( .D(N206), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C115/B[0] ) );
  DFFRHQX1 \data_1_reg[5]  ( .D(N82), .CK(clk), .RN(rst_n), .Q(data_1[5]) );
  DFFRHQX1 \data_a_reg[0]  ( .D(N202), .CK(clk), .RN(rst_n), .Q(dec_out0[0])
         );
  DFFRHQX1 \data_b_reg[0]  ( .D(N293), .CK(clk), .RN(rst_n), .Q(dec_out1[0])
         );
  DFFRHQX1 \data_a_reg[3]  ( .D(N205), .CK(clk), .RN(rst_n), .Q(dec_out0[3])
         );
  DFFRHQX1 \data_b_reg[3]  ( .D(N296), .CK(clk), .RN(rst_n), .Q(dec_out1[3])
         );
  DFFRHQX1 \data_a_reg[1]  ( .D(N203), .CK(clk), .RN(rst_n), .Q(dec_out0[1])
         );
  DFFRHQX1 \data_b_reg[1]  ( .D(N294), .CK(clk), .RN(rst_n), .Q(dec_out1[1])
         );
  DFFRHQX1 \data_a_reg[2]  ( .D(N204), .CK(clk), .RN(rst_n), .Q(dec_out0[2])
         );
  DFFRHQX1 \data_b_reg[2]  ( .D(N295), .CK(clk), .RN(rst_n), .Q(dec_out1[2])
         );
  DFFRHQX1 \data_c_reg[2]  ( .D(N309), .CK(clk), .RN(rst_n), .Q(dec_out2[2])
         );
  DFFRHQX1 \data_c_reg[1]  ( .D(N308), .CK(clk), .RN(rst_n), .Q(dec_out2[1])
         );
  DFFRHQX1 \data_c_reg[0]  ( .D(N307), .CK(clk), .RN(rst_n), .Q(dec_out2[0])
         );
  INVX2 U3 ( .A(N281), .Y(N274) );
  INVX2 U4 ( .A(N190), .Y(N183) );
  INVX2 U5 ( .A(N221), .Y(N282) );
  INVX2 U6 ( .A(N130), .Y(N191) );
  XOR2X1 U7 ( .A(data_1[7]), .B(
        \add_0_root_add_0_root_add_136_3_C115/carry[3] ), .Y(N222) );
  ADDFX2 U8 ( .A(data_1[5]), .B(\add_0_root_add_0_root_add_136_3_C115/B[1] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C115/carry[1] ), .CO(
        \add_0_root_add_0_root_add_136_3_C115/carry[2] ), .S(N281) );
  ADDFX2 U9 ( .A(data_1[3]), .B(\add_0_root_add_0_root_add_136_3_C114/B[3] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C114/carry[3] ), .CO(N132), .S(
        N131) );
  ADDFX2 U10 ( .A(data_1[2]), .B(\add_0_root_add_0_root_add_136_3_C114/B[2] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C114/carry[2] ), .CO(
        \add_0_root_add_0_root_add_136_3_C114/carry[3] ), .S(N130) );
  XOR2X1 U11 ( .A(data_1[6]), .B(
        \add_0_root_add_0_root_add_136_3_C115/carry[2] ), .Y(N221) );
  AND2X1 U12 ( .A(\add_0_root_add_0_root_add_136_3_C115/carry[3] ), .B(
        data_1[7]), .Y(N223) );
  XOR2X1 U13 ( .A(\add_0_root_add_0_root_add_136_3_C114/B[1] ), .B(data_1[1]), 
        .Y(N190) );
  ADDFX2 U14 ( .A(data_1[9]), .B(\add_0_root_add_0_root_add_136_3_C116/B[1] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C116/carry[1] ), .CO(N309), .S(
        N308) );
  AND2X1 U16 ( .A(data_1[8]), .B(\add_0_root_add_0_root_add_136_3_C116/B[0] ), 
        .Y(\add_0_root_add_0_root_add_136_3_C116/carry[1] ) );
  XOR2X1 U17 ( .A(\add_0_root_add_0_root_add_136_3_C116/B[0] ), .B(data_1[8]), 
        .Y(N307) );
  AND2X1 U18 ( .A(\add_148_C115/carry[4] ), .B(N223), .Y(N292) );
  XOR2X1 U19 ( .A(N223), .B(\add_148_C115/carry[4] ), .Y(N291) );
  AND2X1 U20 ( .A(\add_148_C115/carry[3] ), .B(N222), .Y(
        \add_148_C115/carry[4] ) );
  XOR2X1 U21 ( .A(N222), .B(\add_148_C115/carry[3] ), .Y(N290) );
  OR2X1 U22 ( .A(N221), .B(N281), .Y(\add_148_C115/carry[3] ) );
  XNOR2X1 U23 ( .A(N281), .B(N221), .Y(N289) );
  AND2X1 U24 ( .A(\add_146_C115/carry[4] ), .B(N223), .Y(N285) );
  XOR2X1 U25 ( .A(N223), .B(\add_146_C115/carry[4] ), .Y(N284) );
  OR2X1 U26 ( .A(N222), .B(N221), .Y(\add_146_C115/carry[4] ) );
  XNOR2X1 U27 ( .A(N221), .B(N222), .Y(N283) );
  OR2X1 U28 ( .A(N223), .B(\add_144_C115/carry[4] ), .Y(N278) );
  XNOR2X1 U29 ( .A(\add_144_C115/carry[4] ), .B(N223), .Y(N277) );
  AND2X1 U30 ( .A(\add_144_C115/carry[3] ), .B(N222), .Y(
        \add_144_C115/carry[4] ) );
  XOR2X1 U31 ( .A(N222), .B(\add_144_C115/carry[3] ), .Y(N276) );
  AND2X1 U32 ( .A(N281), .B(N221), .Y(\add_144_C115/carry[3] ) );
  XOR2X1 U33 ( .A(N221), .B(N281), .Y(N275) );
  AND2X1 U34 ( .A(\add_0_root_add_0_root_add_136_3_C115/carry[2] ), .B(
        data_1[6]), .Y(\add_0_root_add_0_root_add_136_3_C115/carry[3] ) );
  AND2X1 U35 ( .A(data_1[4]), .B(\add_0_root_add_0_root_add_136_3_C115/B[0] ), 
        .Y(\add_0_root_add_0_root_add_136_3_C115/carry[1] ) );
  XOR2X1 U36 ( .A(\add_0_root_add_0_root_add_136_3_C115/B[0] ), .B(data_1[4]), 
        .Y(N273) );
  AND2X1 U37 ( .A(\add_148_C114/carry[4] ), .B(N132), .Y(N201) );
  XOR2X1 U38 ( .A(N132), .B(\add_148_C114/carry[4] ), .Y(N200) );
  AND2X1 U39 ( .A(\add_148_C114/carry[3] ), .B(N131), .Y(
        \add_148_C114/carry[4] ) );
  XOR2X1 U40 ( .A(N131), .B(\add_148_C114/carry[3] ), .Y(N199) );
  OR2X1 U41 ( .A(N130), .B(N190), .Y(\add_148_C114/carry[3] ) );
  XNOR2X1 U42 ( .A(N190), .B(N130), .Y(N198) );
  AND2X1 U43 ( .A(\add_146_C114/carry[4] ), .B(N132), .Y(N194) );
  XOR2X1 U44 ( .A(N132), .B(\add_146_C114/carry[4] ), .Y(N193) );
  OR2X1 U45 ( .A(N131), .B(N130), .Y(\add_146_C114/carry[4] ) );
  XNOR2X1 U46 ( .A(N130), .B(N131), .Y(N192) );
  OR2X1 U47 ( .A(N132), .B(\add_144_C114/carry[4] ), .Y(N187) );
  XNOR2X1 U48 ( .A(\add_144_C114/carry[4] ), .B(N132), .Y(N186) );
  AND2X1 U49 ( .A(\add_144_C114/carry[3] ), .B(N131), .Y(
        \add_144_C114/carry[4] ) );
  XOR2X1 U50 ( .A(N131), .B(\add_144_C114/carry[3] ), .Y(N185) );
  AND2X1 U51 ( .A(N190), .B(N130), .Y(\add_144_C114/carry[3] ) );
  XOR2X1 U52 ( .A(N130), .B(N190), .Y(N184) );
  AND2X1 U53 ( .A(data_1[1]), .B(\add_0_root_add_0_root_add_136_3_C114/B[1] ), 
        .Y(\add_0_root_add_0_root_add_136_3_C114/carry[2] ) );
  NOR2X1 U54 ( .A(n1), .B(n2), .Y(N86) );
  NAND3X1 U55 ( .A(n3), .B(n4), .C(n5), .Y(N85) );
  OAI22X1 U56 ( .A0(n2), .A1(n6), .B0(n7), .B1(n8), .Y(N84) );
  NOR2X1 U57 ( .A(n9), .B(n10), .Y(n7) );
  OAI211X1 U58 ( .A0(n11), .A1(n12), .B0(n13), .C0(n4), .Y(N83) );
  NAND2X1 U59 ( .A(n14), .B(n6), .Y(n4) );
  NAND3X1 U60 ( .A(n13), .B(n3), .C(n15), .Y(N82) );
  AOI22X1 U61 ( .A0(n10), .A1(n8), .B0(bin_in[5]), .B1(n14), .Y(n15) );
  CLKINVX1 U62 ( .A(n16), .Y(n10) );
  OAI221X1 U63 ( .A0(n2), .A1(n17), .B0(n12), .B1(n18), .C0(n3), .Y(N81) );
  NAND2X1 U64 ( .A(n1), .B(n14), .Y(n3) );
  OAI211X1 U65 ( .A0(n19), .A1(n20), .B0(n21), .C0(n22), .Y(N80) );
  NOR2BX1 U66 ( .AN(n13), .B(n23), .Y(n22) );
  NAND2X1 U67 ( .A(n11), .B(n1), .Y(n13) );
  OAI211X1 U68 ( .A0(n16), .A1(n18), .B0(n5), .C0(n21), .Y(N79) );
  AOI2BB2X1 U69 ( .B0(n24), .B1(n23), .A0N(n17), .A1N(n18), .Y(n21) );
  CLKINVX1 U70 ( .A(n9), .Y(n17) );
  NOR2X1 U71 ( .A(n20), .B(bin_in[5]), .Y(n9) );
  NOR2X1 U72 ( .A(n16), .B(n25), .Y(n23) );
  CLKINVX1 U73 ( .A(n26), .Y(n5) );
  OAI22X1 U74 ( .A0(n2), .A1(n6), .B0(n27), .B1(n12), .Y(n26) );
  NAND2X1 U75 ( .A(bin_in[5]), .B(bin_in[4]), .Y(n12) );
  NOR2X1 U76 ( .A(n14), .B(n11), .Y(n27) );
  CLKINVX1 U77 ( .A(n8), .Y(n11) );
  NAND2X1 U78 ( .A(bin_in[6]), .B(n24), .Y(n8) );
  CLKINVX1 U79 ( .A(n19), .Y(n14) );
  NAND2X1 U80 ( .A(bin_in[7]), .B(n25), .Y(n19) );
  CLKINVX1 U81 ( .A(n1), .Y(n6) );
  NOR2X1 U82 ( .A(bin_in[5]), .B(bin_in[4]), .Y(n1) );
  NAND2X1 U83 ( .A(bin_in[7]), .B(bin_in[6]), .Y(n2) );
  NAND2X1 U84 ( .A(n25), .B(n24), .Y(n18) );
  CLKINVX1 U85 ( .A(bin_in[7]), .Y(n24) );
  CLKINVX1 U86 ( .A(bin_in[6]), .Y(n25) );
  NAND2X1 U87 ( .A(bin_in[5]), .B(n20), .Y(n16) );
  CLKINVX1 U88 ( .A(bin_in[4]), .Y(n20) );
  OAI2BB1X1 U89 ( .A0N(N278), .A1N(n28), .B0(n29), .Y(N298) );
  AOI22X1 U90 ( .A0(N285), .A1(n30), .B0(N292), .B1(n31), .Y(n29) );
  OAI2BB1X1 U91 ( .A0N(N277), .A1N(n28), .B0(n32), .Y(N297) );
  AOI22X1 U92 ( .A0(N284), .A1(n30), .B0(N291), .B1(n31), .Y(n32) );
  NAND2X1 U93 ( .A(n33), .B(n34), .Y(N296) );
  AOI22X1 U94 ( .A0(N283), .A1(n30), .B0(N290), .B1(n31), .Y(n34) );
  AOI22X1 U95 ( .A0(n35), .A1(N222), .B0(N276), .B1(n28), .Y(n33) );
  NAND2X1 U96 ( .A(n36), .B(n37), .Y(N295) );
  AOI22X1 U97 ( .A0(N282), .A1(n30), .B0(N289), .B1(n31), .Y(n37) );
  AOI22X1 U98 ( .A0(n35), .A1(N221), .B0(N275), .B1(n28), .Y(n36) );
  NAND2X1 U99 ( .A(n38), .B(n39), .Y(N294) );
  AOI22X1 U100 ( .A0(N281), .A1(n30), .B0(N274), .B1(n31), .Y(n39) );
  AOI22X1 U101 ( .A0(n35), .A1(N281), .B0(N274), .B1(n28), .Y(n38) );
  NAND2X1 U102 ( .A(n40), .B(n41), .Y(N293) );
  AOI22X1 U103 ( .A0(N273), .A1(n30), .B0(N273), .B1(n31), .Y(n41) );
  NOR2BX1 U104 ( .AN(n42), .B(n35), .Y(n31) );
  NOR2X1 U105 ( .A(n42), .B(n28), .Y(n30) );
  OAI21X1 U106 ( .A0(N222), .A1(N221), .B0(N223), .Y(n42) );
  AOI22X1 U107 ( .A0(N273), .A1(n35), .B0(N273), .B1(n28), .Y(n40) );
  AND4X2 U108 ( .A(N223), .B(N222), .C(N221), .D(N281), .Y(n28) );
  NOR2BX1 U109 ( .AN(n43), .B(N223), .Y(n35) );
  OAI21X1 U110 ( .A0(N281), .A1(N221), .B0(N222), .Y(n43) );
  OAI2BB1X1 U111 ( .A0N(N187), .A1N(n44), .B0(n45), .Y(N207) );
  AOI22X1 U112 ( .A0(N194), .A1(n46), .B0(N201), .B1(n47), .Y(n45) );
  OAI2BB1X1 U113 ( .A0N(N186), .A1N(n44), .B0(n48), .Y(N206) );
  AOI22X1 U114 ( .A0(N193), .A1(n46), .B0(N200), .B1(n47), .Y(n48) );
  NAND2X1 U115 ( .A(n49), .B(n50), .Y(N205) );
  AOI22X1 U116 ( .A0(N192), .A1(n46), .B0(N199), .B1(n47), .Y(n50) );
  AOI22X1 U117 ( .A0(n51), .A1(N131), .B0(N185), .B1(n44), .Y(n49) );
  NAND2X1 U118 ( .A(n52), .B(n53), .Y(N204) );
  AOI22X1 U119 ( .A0(N191), .A1(n46), .B0(N198), .B1(n47), .Y(n53) );
  AOI22X1 U120 ( .A0(n51), .A1(N130), .B0(N184), .B1(n44), .Y(n52) );
  NAND2X1 U121 ( .A(n54), .B(n55), .Y(N203) );
  AOI22X1 U122 ( .A0(N190), .A1(n46), .B0(N183), .B1(n47), .Y(n55) );
  AOI22X1 U123 ( .A0(n51), .A1(N190), .B0(N183), .B1(n44), .Y(n54) );
  NAND2X1 U124 ( .A(n56), .B(n57), .Y(N202) );
  AOI22X1 U125 ( .A0(N182), .A1(n46), .B0(N182), .B1(n47), .Y(n57) );
  NOR2BX1 U126 ( .AN(n58), .B(n51), .Y(n47) );
  NOR2X1 U127 ( .A(n58), .B(n44), .Y(n46) );
  OAI21X1 U128 ( .A0(N131), .A1(N130), .B0(N132), .Y(n58) );
  AOI22X1 U129 ( .A0(N182), .A1(n51), .B0(N182), .B1(n44), .Y(n56) );
  AND4X2 U130 ( .A(N132), .B(N131), .C(N130), .D(N190), .Y(n44) );
  NOR2BX1 U131 ( .AN(n59), .B(N132), .Y(n51) );
  OAI21X1 U132 ( .A0(N190), .A1(N130), .B0(N131), .Y(n59) );
endmodule


module decode7_2 ( in, led );
  input [3:0] in;
  output [6:0] led;
  wire   n1, n2, n3, n4, n5, n6, n7, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;

  NAND3X1 U3 ( .A(n31), .B(n30), .C(n47), .Y(led[0]) );
  AND3X2 U4 ( .A(n34), .B(n49), .C(n45), .Y(n36) );
  NAND2X1 U5 ( .A(n7), .B(n6), .Y(n38) );
  OR2X1 U6 ( .A(n38), .B(in[0]), .Y(n31) );
  NAND3X1 U7 ( .A(n37), .B(n48), .C(n36), .Y(led[2]) );
  NAND3X1 U8 ( .A(n35), .B(n43), .C(n36), .Y(led[1]) );
  NAND3BX1 U9 ( .AN(in[0]), .B(n6), .C(n41), .Y(n35) );
  AND2X1 U10 ( .A(n39), .B(n43), .Y(n47) );
  AOI211X1 U11 ( .A0(n5), .A1(n33), .B0(n1), .C0(n46), .Y(n39) );
  INVX2 U12 ( .A(n34), .Y(n1) );
  NAND3X1 U13 ( .A(n49), .B(n48), .C(n47), .Y(led[6]) );
  NOR2X1 U14 ( .A(n5), .B(n7), .Y(n41) );
  INVX2 U15 ( .A(n29), .Y(n3) );
  NAND4BX1 U16 ( .AN(n46), .B(n45), .C(n44), .D(n43), .Y(led[5]) );
  NAND2X1 U17 ( .A(n33), .B(n29), .Y(n30) );
  NAND3X1 U18 ( .A(in[0]), .B(n6), .C(n41), .Y(n34) );
  NOR2X1 U19 ( .A(n6), .B(in[0]), .Y(n33) );
  NAND4X1 U20 ( .A(n39), .B(n44), .C(n49), .D(n38), .Y(led[3]) );
  INVX2 U21 ( .A(in[2]), .Y(n6) );
  AOI211X1 U22 ( .A0(in[1]), .A1(n33), .B0(n4), .C0(n32), .Y(n45) );
  INVX2 U23 ( .A(n30), .Y(n4) );
  OAI21X1 U24 ( .A0(in[0]), .A1(n48), .B0(n31), .Y(n32) );
  INVX2 U25 ( .A(in[1]), .Y(n7) );
  NAND3X1 U26 ( .A(n6), .B(n5), .C(in[1]), .Y(n48) );
  OAI211X1 U27 ( .A0(in[2]), .A1(n3), .B0(n35), .C0(n37), .Y(n46) );
  NAND4X1 U28 ( .A(in[2]), .B(in[0]), .C(n7), .D(n5), .Y(n37) );
  NOR2X1 U29 ( .A(n5), .B(in[1]), .Y(n29) );
  INVX2 U30 ( .A(in[3]), .Y(n5) );
  NAND2X1 U31 ( .A(n41), .B(in[2]), .Y(n43) );
  OAI32X1 U32 ( .A0(n42), .A1(in[0]), .A2(n2), .B0(n41), .B1(n40), .Y(led[4])
         );
  AOI21X1 U33 ( .A0(in[0]), .A1(n42), .B0(n6), .Y(n40) );
  OAI21X1 U34 ( .A0(n7), .A1(in[3]), .B0(n3), .Y(n42) );
  INVX2 U35 ( .A(n43), .Y(n2) );
  NAND3X1 U36 ( .A(in[0]), .B(n29), .C(in[2]), .Y(n49) );
  NAND3X1 U37 ( .A(in[1]), .B(n5), .C(in[0]), .Y(n44) );
endmodule


module decode7_3 ( in, led );
  input [3:0] in;
  output [6:0] led;
  wire   n1, n2, n3, n4, n5, n6, n7, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;

  NAND3X1 U3 ( .A(n31), .B(n30), .C(n47), .Y(led[0]) );
  AND3X2 U4 ( .A(n34), .B(n49), .C(n45), .Y(n36) );
  NAND2X1 U5 ( .A(n7), .B(n6), .Y(n38) );
  OR2X1 U6 ( .A(n38), .B(in[0]), .Y(n31) );
  NAND3X1 U7 ( .A(n37), .B(n48), .C(n36), .Y(led[2]) );
  NAND3X1 U8 ( .A(n35), .B(n43), .C(n36), .Y(led[1]) );
  NAND3BX1 U9 ( .AN(in[0]), .B(n6), .C(n41), .Y(n35) );
  AND2X1 U10 ( .A(n39), .B(n43), .Y(n47) );
  AOI211X1 U11 ( .A0(n5), .A1(n33), .B0(n1), .C0(n46), .Y(n39) );
  INVX2 U12 ( .A(n34), .Y(n1) );
  NAND3X1 U13 ( .A(n49), .B(n48), .C(n47), .Y(led[6]) );
  NOR2X1 U14 ( .A(n5), .B(n7), .Y(n41) );
  INVX2 U15 ( .A(n29), .Y(n3) );
  NAND4BX1 U16 ( .AN(n46), .B(n45), .C(n44), .D(n43), .Y(led[5]) );
  NAND2X1 U17 ( .A(n33), .B(n29), .Y(n30) );
  NAND3X1 U18 ( .A(in[0]), .B(n6), .C(n41), .Y(n34) );
  NOR2X1 U19 ( .A(n6), .B(in[0]), .Y(n33) );
  NAND4X1 U20 ( .A(n39), .B(n44), .C(n49), .D(n38), .Y(led[3]) );
  INVX2 U21 ( .A(in[2]), .Y(n6) );
  AOI211X1 U22 ( .A0(in[1]), .A1(n33), .B0(n4), .C0(n32), .Y(n45) );
  INVX2 U23 ( .A(n30), .Y(n4) );
  OAI21X1 U24 ( .A0(in[0]), .A1(n48), .B0(n31), .Y(n32) );
  INVX2 U25 ( .A(in[1]), .Y(n7) );
  NAND3X1 U26 ( .A(n6), .B(n5), .C(in[1]), .Y(n48) );
  OAI211X1 U27 ( .A0(in[2]), .A1(n3), .B0(n35), .C0(n37), .Y(n46) );
  NAND4X1 U28 ( .A(in[2]), .B(in[0]), .C(n7), .D(n5), .Y(n37) );
  NOR2X1 U29 ( .A(n5), .B(in[1]), .Y(n29) );
  INVX2 U30 ( .A(in[3]), .Y(n5) );
  NAND2X1 U31 ( .A(n41), .B(in[2]), .Y(n43) );
  OAI32X1 U32 ( .A0(n42), .A1(in[0]), .A2(n2), .B0(n41), .B1(n40), .Y(led[4])
         );
  AOI21X1 U33 ( .A0(in[0]), .A1(n42), .B0(n6), .Y(n40) );
  OAI21X1 U34 ( .A0(n7), .A1(in[3]), .B0(n3), .Y(n42) );
  INVX2 U35 ( .A(n43), .Y(n2) );
  NAND3X1 U36 ( .A(in[0]), .B(n29), .C(in[2]), .Y(n49) );
  NAND3X1 U37 ( .A(in[1]), .B(n5), .C(in[0]), .Y(n44) );
endmodule


module bcd_1 ( clk, rst_n, bin_in, dec_out0, dec_out1, dec_out2 );
  input [7:0] bin_in;
  output [3:0] dec_out0;
  output [3:0] dec_out1;
  output [3:0] dec_out2;
  input clk, rst_n;
  wire   N79, N80, N81, N82, N83, N84, N85, N86, N130, N131, N132, N182, N183,
         N184, N185, N186, N187, N190, N191, N192, N193, N194, N198, N199,
         N200, N201, N202, N203, N204, N205, N206, N207, N221, N222, N223,
         N273, N274, N275, N276, N277, N278, N281, N282, N283, N284, N285,
         N289, N290, N291, N292, N293, N294, N295, N296, N297, N298, N307,
         N308, N309, \add_148_C115/carry[3] , \add_148_C115/carry[4] ,
         \add_146_C115/carry[4] , \add_144_C115/carry[3] ,
         \add_144_C115/carry[4] , \add_148_C114/carry[3] ,
         \add_148_C114/carry[4] , \add_146_C114/carry[4] ,
         \add_144_C114/carry[3] , \add_144_C114/carry[4] ,
         \add_0_root_add_0_root_add_136_3_C115/carry[1] ,
         \add_0_root_add_0_root_add_136_3_C115/carry[2] ,
         \add_0_root_add_0_root_add_136_3_C115/carry[3] ,
         \add_0_root_add_0_root_add_136_3_C115/B[0] ,
         \add_0_root_add_0_root_add_136_3_C115/B[1] ,
         \add_0_root_add_0_root_add_136_3_C116/carry[1] ,
         \add_0_root_add_0_root_add_136_3_C116/B[0] ,
         \add_0_root_add_0_root_add_136_3_C116/B[1] ,
         \add_0_root_add_0_root_add_136_3_C114/carry[2] ,
         \add_0_root_add_0_root_add_136_3_C114/carry[3] ,
         \add_0_root_add_0_root_add_136_3_C114/B[1] ,
         \add_0_root_add_0_root_add_136_3_C114/B[2] ,
         \add_0_root_add_0_root_add_136_3_C114/B[3] , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59;
  wire   [9:0] data_1;
  assign dec_out2[3] = 1'b0;

  DFFRHQX1 \data_0_reg[0]  ( .D(bin_in[0]), .CK(clk), .RN(rst_n), .Q(N182) );
  DFFRHQX1 \data_b_reg[5]  ( .D(N298), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C116/B[1] ) );
  DFFRHQX1 \data_1_reg[9]  ( .D(N86), .CK(clk), .RN(rst_n), .Q(data_1[9]) );
  DFFRHQX1 \data_1_reg[8]  ( .D(N85), .CK(clk), .RN(rst_n), .Q(data_1[8]) );
  DFFRHQX1 \data_b_reg[4]  ( .D(N297), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C116/B[0] ) );
  DFFRHQX1 \data_1_reg[7]  ( .D(N84), .CK(clk), .RN(rst_n), .Q(data_1[7]) );
  DFFRHQX1 \data_0_reg[3]  ( .D(bin_in[3]), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C114/B[3] ) );
  DFFRHQX1 \data_1_reg[3]  ( .D(N81), .CK(clk), .RN(rst_n), .Q(data_1[3]) );
  DFFRHQX1 \data_1_reg[6]  ( .D(N83), .CK(clk), .RN(rst_n), .Q(data_1[6]) );
  DFFRHQX1 \data_0_reg[2]  ( .D(bin_in[2]), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C114/B[2] ) );
  DFFRHQX1 \data_1_reg[2]  ( .D(N80), .CK(clk), .RN(rst_n), .Q(data_1[2]) );
  DFFRHQX1 \data_0_reg[1]  ( .D(bin_in[1]), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C114/B[1] ) );
  DFFRHQX1 \data_1_reg[1]  ( .D(N79), .CK(clk), .RN(rst_n), .Q(data_1[1]) );
  DFFRHQX1 \data_a_reg[5]  ( .D(N207), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C115/B[1] ) );
  DFFRHQX1 \data_1_reg[4]  ( .D(N79), .CK(clk), .RN(rst_n), .Q(data_1[4]) );
  DFFRHQX1 \data_a_reg[4]  ( .D(N206), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C115/B[0] ) );
  DFFRHQX1 \data_1_reg[5]  ( .D(N82), .CK(clk), .RN(rst_n), .Q(data_1[5]) );
  DFFRHQX1 \data_a_reg[0]  ( .D(N202), .CK(clk), .RN(rst_n), .Q(dec_out0[0])
         );
  DFFRHQX1 \data_b_reg[0]  ( .D(N293), .CK(clk), .RN(rst_n), .Q(dec_out1[0])
         );
  DFFRHQX1 \data_a_reg[3]  ( .D(N205), .CK(clk), .RN(rst_n), .Q(dec_out0[3])
         );
  DFFRHQX1 \data_b_reg[3]  ( .D(N296), .CK(clk), .RN(rst_n), .Q(dec_out1[3])
         );
  DFFRHQX1 \data_a_reg[1]  ( .D(N203), .CK(clk), .RN(rst_n), .Q(dec_out0[1])
         );
  DFFRHQX1 \data_b_reg[1]  ( .D(N294), .CK(clk), .RN(rst_n), .Q(dec_out1[1])
         );
  DFFRHQX1 \data_a_reg[2]  ( .D(N204), .CK(clk), .RN(rst_n), .Q(dec_out0[2])
         );
  DFFRHQX1 \data_b_reg[2]  ( .D(N295), .CK(clk), .RN(rst_n), .Q(dec_out1[2])
         );
  DFFRHQX1 \data_c_reg[2]  ( .D(N309), .CK(clk), .RN(rst_n), .Q(dec_out2[2])
         );
  DFFRHQX1 \data_c_reg[1]  ( .D(N308), .CK(clk), .RN(rst_n), .Q(dec_out2[1])
         );
  DFFRHQX1 \data_c_reg[0]  ( .D(N307), .CK(clk), .RN(rst_n), .Q(dec_out2[0])
         );
  INVX2 U3 ( .A(N281), .Y(N274) );
  INVX2 U4 ( .A(N190), .Y(N183) );
  INVX2 U5 ( .A(N221), .Y(N282) );
  INVX2 U6 ( .A(N130), .Y(N191) );
  XOR2X1 U7 ( .A(data_1[7]), .B(
        \add_0_root_add_0_root_add_136_3_C115/carry[3] ), .Y(N222) );
  ADDFX2 U8 ( .A(data_1[5]), .B(\add_0_root_add_0_root_add_136_3_C115/B[1] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C115/carry[1] ), .CO(
        \add_0_root_add_0_root_add_136_3_C115/carry[2] ), .S(N281) );
  ADDFX2 U9 ( .A(data_1[3]), .B(\add_0_root_add_0_root_add_136_3_C114/B[3] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C114/carry[3] ), .CO(N132), .S(
        N131) );
  ADDFX2 U10 ( .A(data_1[2]), .B(\add_0_root_add_0_root_add_136_3_C114/B[2] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C114/carry[2] ), .CO(
        \add_0_root_add_0_root_add_136_3_C114/carry[3] ), .S(N130) );
  XOR2X1 U11 ( .A(data_1[6]), .B(
        \add_0_root_add_0_root_add_136_3_C115/carry[2] ), .Y(N221) );
  AND2X1 U12 ( .A(\add_0_root_add_0_root_add_136_3_C115/carry[3] ), .B(
        data_1[7]), .Y(N223) );
  XOR2X1 U13 ( .A(\add_0_root_add_0_root_add_136_3_C114/B[1] ), .B(data_1[1]), 
        .Y(N190) );
  ADDFX2 U14 ( .A(data_1[9]), .B(\add_0_root_add_0_root_add_136_3_C116/B[1] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C116/carry[1] ), .CO(N309), .S(
        N308) );
  AND2X1 U16 ( .A(data_1[8]), .B(\add_0_root_add_0_root_add_136_3_C116/B[0] ), 
        .Y(\add_0_root_add_0_root_add_136_3_C116/carry[1] ) );
  XOR2X1 U17 ( .A(\add_0_root_add_0_root_add_136_3_C116/B[0] ), .B(data_1[8]), 
        .Y(N307) );
  AND2X1 U18 ( .A(\add_148_C115/carry[4] ), .B(N223), .Y(N292) );
  XOR2X1 U19 ( .A(N223), .B(\add_148_C115/carry[4] ), .Y(N291) );
  AND2X1 U20 ( .A(\add_148_C115/carry[3] ), .B(N222), .Y(
        \add_148_C115/carry[4] ) );
  XOR2X1 U21 ( .A(N222), .B(\add_148_C115/carry[3] ), .Y(N290) );
  OR2X1 U22 ( .A(N221), .B(N281), .Y(\add_148_C115/carry[3] ) );
  XNOR2X1 U23 ( .A(N281), .B(N221), .Y(N289) );
  AND2X1 U24 ( .A(\add_146_C115/carry[4] ), .B(N223), .Y(N285) );
  XOR2X1 U25 ( .A(N223), .B(\add_146_C115/carry[4] ), .Y(N284) );
  OR2X1 U26 ( .A(N222), .B(N221), .Y(\add_146_C115/carry[4] ) );
  XNOR2X1 U27 ( .A(N221), .B(N222), .Y(N283) );
  OR2X1 U28 ( .A(N223), .B(\add_144_C115/carry[4] ), .Y(N278) );
  XNOR2X1 U29 ( .A(\add_144_C115/carry[4] ), .B(N223), .Y(N277) );
  AND2X1 U30 ( .A(\add_144_C115/carry[3] ), .B(N222), .Y(
        \add_144_C115/carry[4] ) );
  XOR2X1 U31 ( .A(N222), .B(\add_144_C115/carry[3] ), .Y(N276) );
  AND2X1 U32 ( .A(N281), .B(N221), .Y(\add_144_C115/carry[3] ) );
  XOR2X1 U33 ( .A(N221), .B(N281), .Y(N275) );
  AND2X1 U34 ( .A(\add_0_root_add_0_root_add_136_3_C115/carry[2] ), .B(
        data_1[6]), .Y(\add_0_root_add_0_root_add_136_3_C115/carry[3] ) );
  AND2X1 U35 ( .A(data_1[4]), .B(\add_0_root_add_0_root_add_136_3_C115/B[0] ), 
        .Y(\add_0_root_add_0_root_add_136_3_C115/carry[1] ) );
  XOR2X1 U36 ( .A(\add_0_root_add_0_root_add_136_3_C115/B[0] ), .B(data_1[4]), 
        .Y(N273) );
  AND2X1 U37 ( .A(\add_148_C114/carry[4] ), .B(N132), .Y(N201) );
  XOR2X1 U38 ( .A(N132), .B(\add_148_C114/carry[4] ), .Y(N200) );
  AND2X1 U39 ( .A(\add_148_C114/carry[3] ), .B(N131), .Y(
        \add_148_C114/carry[4] ) );
  XOR2X1 U40 ( .A(N131), .B(\add_148_C114/carry[3] ), .Y(N199) );
  OR2X1 U41 ( .A(N130), .B(N190), .Y(\add_148_C114/carry[3] ) );
  XNOR2X1 U42 ( .A(N190), .B(N130), .Y(N198) );
  AND2X1 U43 ( .A(\add_146_C114/carry[4] ), .B(N132), .Y(N194) );
  XOR2X1 U44 ( .A(N132), .B(\add_146_C114/carry[4] ), .Y(N193) );
  OR2X1 U45 ( .A(N131), .B(N130), .Y(\add_146_C114/carry[4] ) );
  XNOR2X1 U46 ( .A(N130), .B(N131), .Y(N192) );
  OR2X1 U47 ( .A(N132), .B(\add_144_C114/carry[4] ), .Y(N187) );
  XNOR2X1 U48 ( .A(\add_144_C114/carry[4] ), .B(N132), .Y(N186) );
  AND2X1 U49 ( .A(\add_144_C114/carry[3] ), .B(N131), .Y(
        \add_144_C114/carry[4] ) );
  XOR2X1 U50 ( .A(N131), .B(\add_144_C114/carry[3] ), .Y(N185) );
  AND2X1 U51 ( .A(N190), .B(N130), .Y(\add_144_C114/carry[3] ) );
  XOR2X1 U52 ( .A(N130), .B(N190), .Y(N184) );
  AND2X1 U53 ( .A(data_1[1]), .B(\add_0_root_add_0_root_add_136_3_C114/B[1] ), 
        .Y(\add_0_root_add_0_root_add_136_3_C114/carry[2] ) );
  NOR2X1 U54 ( .A(n1), .B(n2), .Y(N86) );
  NAND3X1 U55 ( .A(n3), .B(n4), .C(n5), .Y(N85) );
  OAI22X1 U56 ( .A0(n2), .A1(n6), .B0(n7), .B1(n8), .Y(N84) );
  NOR2X1 U57 ( .A(n9), .B(n10), .Y(n7) );
  OAI211X1 U58 ( .A0(n11), .A1(n12), .B0(n13), .C0(n4), .Y(N83) );
  NAND2X1 U59 ( .A(n14), .B(n6), .Y(n4) );
  NAND3X1 U60 ( .A(n13), .B(n3), .C(n15), .Y(N82) );
  AOI22X1 U61 ( .A0(n10), .A1(n8), .B0(bin_in[5]), .B1(n14), .Y(n15) );
  CLKINVX1 U62 ( .A(n16), .Y(n10) );
  OAI221X1 U63 ( .A0(n2), .A1(n17), .B0(n12), .B1(n18), .C0(n3), .Y(N81) );
  NAND2X1 U64 ( .A(n1), .B(n14), .Y(n3) );
  OAI211X1 U65 ( .A0(n19), .A1(n20), .B0(n21), .C0(n22), .Y(N80) );
  NOR2BX1 U66 ( .AN(n13), .B(n23), .Y(n22) );
  NAND2X1 U67 ( .A(n11), .B(n1), .Y(n13) );
  OAI211X1 U68 ( .A0(n16), .A1(n18), .B0(n5), .C0(n21), .Y(N79) );
  AOI2BB2X1 U69 ( .B0(n24), .B1(n23), .A0N(n17), .A1N(n18), .Y(n21) );
  CLKINVX1 U70 ( .A(n9), .Y(n17) );
  NOR2X1 U71 ( .A(n20), .B(bin_in[5]), .Y(n9) );
  NOR2X1 U72 ( .A(n16), .B(n25), .Y(n23) );
  CLKINVX1 U73 ( .A(n26), .Y(n5) );
  OAI22X1 U74 ( .A0(n2), .A1(n6), .B0(n27), .B1(n12), .Y(n26) );
  NAND2X1 U75 ( .A(bin_in[5]), .B(bin_in[4]), .Y(n12) );
  NOR2X1 U76 ( .A(n14), .B(n11), .Y(n27) );
  CLKINVX1 U77 ( .A(n8), .Y(n11) );
  NAND2X1 U78 ( .A(bin_in[6]), .B(n24), .Y(n8) );
  CLKINVX1 U79 ( .A(n19), .Y(n14) );
  NAND2X1 U80 ( .A(bin_in[7]), .B(n25), .Y(n19) );
  CLKINVX1 U81 ( .A(n1), .Y(n6) );
  NOR2X1 U82 ( .A(bin_in[5]), .B(bin_in[4]), .Y(n1) );
  NAND2X1 U83 ( .A(bin_in[7]), .B(bin_in[6]), .Y(n2) );
  NAND2X1 U84 ( .A(n25), .B(n24), .Y(n18) );
  CLKINVX1 U85 ( .A(bin_in[7]), .Y(n24) );
  CLKINVX1 U86 ( .A(bin_in[6]), .Y(n25) );
  NAND2X1 U87 ( .A(bin_in[5]), .B(n20), .Y(n16) );
  CLKINVX1 U88 ( .A(bin_in[4]), .Y(n20) );
  OAI2BB1X1 U89 ( .A0N(N278), .A1N(n28), .B0(n29), .Y(N298) );
  AOI22X1 U90 ( .A0(N285), .A1(n30), .B0(N292), .B1(n31), .Y(n29) );
  OAI2BB1X1 U91 ( .A0N(N277), .A1N(n28), .B0(n32), .Y(N297) );
  AOI22X1 U92 ( .A0(N284), .A1(n30), .B0(N291), .B1(n31), .Y(n32) );
  NAND2X1 U93 ( .A(n33), .B(n34), .Y(N296) );
  AOI22X1 U94 ( .A0(N283), .A1(n30), .B0(N290), .B1(n31), .Y(n34) );
  AOI22X1 U95 ( .A0(n35), .A1(N222), .B0(N276), .B1(n28), .Y(n33) );
  NAND2X1 U96 ( .A(n36), .B(n37), .Y(N295) );
  AOI22X1 U97 ( .A0(N282), .A1(n30), .B0(N289), .B1(n31), .Y(n37) );
  AOI22X1 U98 ( .A0(n35), .A1(N221), .B0(N275), .B1(n28), .Y(n36) );
  NAND2X1 U99 ( .A(n38), .B(n39), .Y(N294) );
  AOI22X1 U100 ( .A0(N281), .A1(n30), .B0(N274), .B1(n31), .Y(n39) );
  AOI22X1 U101 ( .A0(n35), .A1(N281), .B0(N274), .B1(n28), .Y(n38) );
  NAND2X1 U102 ( .A(n40), .B(n41), .Y(N293) );
  AOI22X1 U103 ( .A0(N273), .A1(n30), .B0(N273), .B1(n31), .Y(n41) );
  NOR2BX1 U104 ( .AN(n42), .B(n35), .Y(n31) );
  NOR2X1 U105 ( .A(n42), .B(n28), .Y(n30) );
  OAI21X1 U106 ( .A0(N222), .A1(N221), .B0(N223), .Y(n42) );
  AOI22X1 U107 ( .A0(N273), .A1(n35), .B0(N273), .B1(n28), .Y(n40) );
  AND4X2 U108 ( .A(N223), .B(N222), .C(N221), .D(N281), .Y(n28) );
  NOR2BX1 U109 ( .AN(n43), .B(N223), .Y(n35) );
  OAI21X1 U110 ( .A0(N281), .A1(N221), .B0(N222), .Y(n43) );
  OAI2BB1X1 U111 ( .A0N(N187), .A1N(n44), .B0(n45), .Y(N207) );
  AOI22X1 U112 ( .A0(N194), .A1(n46), .B0(N201), .B1(n47), .Y(n45) );
  OAI2BB1X1 U113 ( .A0N(N186), .A1N(n44), .B0(n48), .Y(N206) );
  AOI22X1 U114 ( .A0(N193), .A1(n46), .B0(N200), .B1(n47), .Y(n48) );
  NAND2X1 U115 ( .A(n49), .B(n50), .Y(N205) );
  AOI22X1 U116 ( .A0(N192), .A1(n46), .B0(N199), .B1(n47), .Y(n50) );
  AOI22X1 U117 ( .A0(n51), .A1(N131), .B0(N185), .B1(n44), .Y(n49) );
  NAND2X1 U118 ( .A(n52), .B(n53), .Y(N204) );
  AOI22X1 U119 ( .A0(N191), .A1(n46), .B0(N198), .B1(n47), .Y(n53) );
  AOI22X1 U120 ( .A0(n51), .A1(N130), .B0(N184), .B1(n44), .Y(n52) );
  NAND2X1 U121 ( .A(n54), .B(n55), .Y(N203) );
  AOI22X1 U122 ( .A0(N190), .A1(n46), .B0(N183), .B1(n47), .Y(n55) );
  AOI22X1 U123 ( .A0(n51), .A1(N190), .B0(N183), .B1(n44), .Y(n54) );
  NAND2X1 U124 ( .A(n56), .B(n57), .Y(N202) );
  AOI22X1 U125 ( .A0(N182), .A1(n46), .B0(N182), .B1(n47), .Y(n57) );
  NOR2BX1 U126 ( .AN(n58), .B(n51), .Y(n47) );
  NOR2X1 U127 ( .A(n58), .B(n44), .Y(n46) );
  OAI21X1 U128 ( .A0(N131), .A1(N130), .B0(N132), .Y(n58) );
  AOI22X1 U129 ( .A0(N182), .A1(n51), .B0(N182), .B1(n44), .Y(n56) );
  AND4X2 U130 ( .A(N132), .B(N131), .C(N130), .D(N190), .Y(n44) );
  NOR2BX1 U131 ( .AN(n59), .B(N132), .Y(n51) );
  OAI21X1 U132 ( .A0(N190), .A1(N130), .B0(N131), .Y(n59) );
endmodule


module RTC ( clk, rst_n, initial_time_hh, initial_time_mm, initial_time_valid, 
        hh, mm );
  input [4:0] initial_time_hh;
  input [5:0] initial_time_mm;
  output [4:0] hh;
  output [5:0] mm;
  input clk, rst_n, initial_time_valid;
  wire   clk_div, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35,
         N36, N37, N38, N39, N40, N41, N43, N44, N45, N46, N47, N48, N49, N50,
         N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N62, N63, N64,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, mm_full, N78, N80,
         N81, N82, N83, N84, N85, N87, N88, N89, N90, N91, N119, N121, N122,
         N123, N124, N125, N126, N127, N128, N129, N130, N131, N132, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n22, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, \add_94/carry[5] ,
         \add_94/carry[4] , \add_94/carry[3] , \add_94/carry[2] ,
         \add_71/carry[4] , \add_71/carry[3] , \add_71/carry[2] ,
         \add_60/carry[5] , \add_60/carry[4] , \add_60/carry[3] ,
         \add_60/carry[2] , n1, n2, n3, n4, n5, n6, n7;
  wire   [31:0] cnt;
  wire   [5:0] mm_cnt;

  RTC_DW01_inc_3 add_30 ( .A(cnt), .SUM({N41, N40, N39, N38, N37, N36, N35, 
        N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, 
        N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10}) );
  DFFRHQX1 mm_full_reg ( .D(n4), .CK(clk_div), .RN(rst_n), .Q(mm_full) );
  DFFRHQX1 \mm_cnt_reg[5]  ( .D(N132), .CK(clk_div), .RN(rst_n), .Q(mm_cnt[5])
         );
  DFFRHQX1 \mm_cnt_reg[2]  ( .D(N129), .CK(clk_div), .RN(rst_n), .Q(mm_cnt[2])
         );
  DFFRHQX1 \mm_cnt_reg[4]  ( .D(N131), .CK(clk_div), .RN(rst_n), .Q(mm_cnt[4])
         );
  DFFRHQX1 \mm_cnt_reg[1]  ( .D(N128), .CK(clk_div), .RN(rst_n), .Q(mm_cnt[1])
         );
  DFFRHQX1 \mm_cnt_reg[0]  ( .D(N127), .CK(clk_div), .RN(rst_n), .Q(mm_cnt[0])
         );
  DFFRHQX1 \mm_cnt_reg[3]  ( .D(N130), .CK(clk_div), .RN(rst_n), .Q(mm_cnt[3])
         );
  DFFRHQX1 clk_div_reg ( .D(n41), .CK(clk), .RN(rst_n), .Q(clk_div) );
  DFFRHQX1 \hh_reg[4]  ( .D(n47), .CK(clk), .RN(rst_n), .Q(hh[4]) );
  DFFRHQX1 \hh_reg[2]  ( .D(n44), .CK(clk), .RN(rst_n), .Q(hh[2]) );
  DFFRHQX1 \cnt_reg[30]  ( .D(N73), .CK(clk), .RN(rst_n), .Q(cnt[30]) );
  DFFRHQX1 \cnt_reg[31]  ( .D(N74), .CK(clk), .RN(rst_n), .Q(cnt[31]) );
  DFFRHQX1 \cnt_reg[29]  ( .D(N72), .CK(clk), .RN(rst_n), .Q(cnt[29]) );
  DFFRHQX1 \cnt_reg[27]  ( .D(N70), .CK(clk), .RN(rst_n), .Q(cnt[27]) );
  DFFRHQX1 \hh_reg[3]  ( .D(n43), .CK(clk), .RN(rst_n), .Q(hh[3]) );
  DFFRHQX1 \cnt_reg[28]  ( .D(N71), .CK(clk), .RN(rst_n), .Q(cnt[28]) );
  DFFRHQX1 \hh_reg[1]  ( .D(n45), .CK(clk), .RN(rst_n), .Q(hh[1]) );
  DFFRHQX1 \hh_reg[0]  ( .D(n46), .CK(clk), .RN(rst_n), .Q(hh[0]) );
  DFFRHQX1 \mm_reg[5]  ( .D(n48), .CK(clk), .RN(rst_n), .Q(mm[5]) );
  DFFRHQX1 \cnt_reg[26]  ( .D(N69), .CK(clk), .RN(rst_n), .Q(cnt[26]) );
  DFFRHQX1 \mm_reg[4]  ( .D(n49), .CK(clk), .RN(rst_n), .Q(mm[4]) );
  DFFRHQX1 \cnt_reg[25]  ( .D(N68), .CK(clk), .RN(rst_n), .Q(cnt[25]) );
  DFFRHQX1 \mm_reg[2]  ( .D(n51), .CK(clk), .RN(rst_n), .Q(mm[2]) );
  DFFRHQX1 \mm_reg[1]  ( .D(n52), .CK(clk), .RN(rst_n), .Q(mm[1]) );
  DFFRHQX1 \mm_reg[3]  ( .D(n50), .CK(clk), .RN(rst_n), .Q(mm[3]) );
  DFFRHQX1 \mm_reg[0]  ( .D(n53), .CK(clk), .RN(rst_n), .Q(mm[0]) );
  DFFRHQX1 \cnt_reg[24]  ( .D(N67), .CK(clk), .RN(rst_n), .Q(cnt[24]) );
  DFFRHQX1 \cnt_reg[23]  ( .D(N66), .CK(clk), .RN(rst_n), .Q(cnt[23]) );
  DFFRHQX1 \cnt_reg[22]  ( .D(N65), .CK(clk), .RN(rst_n), .Q(cnt[22]) );
  DFFRHQX1 \cnt_reg[21]  ( .D(N64), .CK(clk), .RN(rst_n), .Q(cnt[21]) );
  DFFRHQX1 \cnt_reg[20]  ( .D(N63), .CK(clk), .RN(rst_n), .Q(cnt[20]) );
  DFFRHQX1 \cnt_reg[19]  ( .D(N62), .CK(clk), .RN(rst_n), .Q(cnt[19]) );
  DFFRHQX1 \cnt_reg[18]  ( .D(N61), .CK(clk), .RN(rst_n), .Q(cnt[18]) );
  DFFRHQX1 \cnt_reg[17]  ( .D(N60), .CK(clk), .RN(rst_n), .Q(cnt[17]) );
  DFFRHQX1 \cnt_reg[16]  ( .D(N59), .CK(clk), .RN(rst_n), .Q(cnt[16]) );
  DFFRHQX1 \cnt_reg[15]  ( .D(N58), .CK(clk), .RN(rst_n), .Q(cnt[15]) );
  DFFRHQX1 \cnt_reg[14]  ( .D(N57), .CK(clk), .RN(rst_n), .Q(cnt[14]) );
  DFFRHQX1 \cnt_reg[13]  ( .D(N56), .CK(clk), .RN(rst_n), .Q(cnt[13]) );
  DFFRHQX1 \cnt_reg[12]  ( .D(N55), .CK(clk), .RN(rst_n), .Q(cnt[12]) );
  DFFRHQX1 \cnt_reg[11]  ( .D(N54), .CK(clk), .RN(rst_n), .Q(cnt[11]) );
  DFFRHQX1 \cnt_reg[10]  ( .D(N53), .CK(clk), .RN(rst_n), .Q(cnt[10]) );
  DFFRHQX1 \cnt_reg[9]  ( .D(N52), .CK(clk), .RN(rst_n), .Q(cnt[9]) );
  DFFRHQX1 \cnt_reg[8]  ( .D(N51), .CK(clk), .RN(rst_n), .Q(cnt[8]) );
  DFFRHQX1 \cnt_reg[7]  ( .D(N50), .CK(clk), .RN(rst_n), .Q(cnt[7]) );
  DFFRHQX1 \cnt_reg[6]  ( .D(N49), .CK(clk), .RN(rst_n), .Q(cnt[6]) );
  DFFRHQX1 \cnt_reg[5]  ( .D(N48), .CK(clk), .RN(rst_n), .Q(cnt[5]) );
  DFFRHQX1 \cnt_reg[4]  ( .D(N47), .CK(clk), .RN(rst_n), .Q(cnt[4]) );
  DFFRHQX1 \cnt_reg[3]  ( .D(N46), .CK(clk), .RN(rst_n), .Q(cnt[3]) );
  DFFRHQX1 \cnt_reg[2]  ( .D(N45), .CK(clk), .RN(rst_n), .Q(cnt[2]) );
  DFFRHQX1 \cnt_reg[1]  ( .D(N44), .CK(clk), .RN(rst_n), .Q(cnt[1]) );
  DFFRHQX1 \cnt_reg[0]  ( .D(N43), .CK(clk), .RN(rst_n), .Q(cnt[0]) );
  NOR2X1 U3 ( .A(n31), .B(n32), .Y(n1) );
  OAI2BB1X1 U4 ( .A0N(n7), .A1N(N78), .B0(n5), .Y(n12) );
  INVX2 U5 ( .A(n22), .Y(n5) );
  AND2X1 U6 ( .A(n18), .B(N78), .Y(n25) );
  AND2X1 U7 ( .A(N40), .B(n1), .Y(N73) );
  AND2X1 U8 ( .A(N39), .B(n1), .Y(N72) );
  AND2X1 U9 ( .A(N38), .B(n1), .Y(N71) );
  AND2X1 U10 ( .A(N37), .B(n1), .Y(N70) );
  AND2X1 U11 ( .A(N36), .B(n1), .Y(N69) );
  AND2X1 U12 ( .A(N35), .B(n1), .Y(N68) );
  AND2X1 U13 ( .A(N34), .B(n1), .Y(N67) );
  AND2X1 U14 ( .A(N33), .B(n1), .Y(N66) );
  AND2X1 U15 ( .A(N32), .B(n1), .Y(N65) );
  AND2X1 U16 ( .A(N31), .B(n1), .Y(N64) );
  AND2X1 U17 ( .A(N30), .B(n1), .Y(N63) );
  AND2X1 U18 ( .A(N29), .B(n1), .Y(N62) );
  AND2X1 U19 ( .A(N28), .B(n1), .Y(N61) );
  AND2X1 U20 ( .A(N27), .B(n1), .Y(N60) );
  AND2X1 U21 ( .A(N26), .B(n1), .Y(N59) );
  AND2X1 U22 ( .A(N25), .B(n1), .Y(N58) );
  AND2X1 U23 ( .A(N24), .B(n1), .Y(N57) );
  AND2X1 U24 ( .A(N23), .B(n1), .Y(N56) );
  AND2X1 U25 ( .A(N22), .B(n1), .Y(N55) );
  AND2X1 U26 ( .A(N21), .B(n1), .Y(N54) );
  AND2X1 U27 ( .A(N20), .B(n1), .Y(N53) );
  AND2X1 U28 ( .A(N19), .B(n1), .Y(N52) );
  AND2X1 U29 ( .A(N18), .B(n1), .Y(N51) );
  AND2X1 U30 ( .A(N17), .B(n1), .Y(N50) );
  AND2X1 U31 ( .A(N16), .B(n1), .Y(N49) );
  NAND4X1 U32 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n31) );
  NAND4X1 U33 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n32) );
  AND2X1 U34 ( .A(N15), .B(n1), .Y(N48) );
  AND2X1 U35 ( .A(N13), .B(n1), .Y(N46) );
  AND2X1 U36 ( .A(N14), .B(n1), .Y(N47) );
  AND2X1 U37 ( .A(N12), .B(n1), .Y(N45) );
  AND2X1 U38 ( .A(N11), .B(n1), .Y(N44) );
  INVX2 U39 ( .A(N119), .Y(n4) );
  AND2X1 U40 ( .A(N122), .B(N119), .Y(N128) );
  AND2X1 U41 ( .A(N123), .B(N119), .Y(N129) );
  AND2X1 U42 ( .A(N124), .B(N119), .Y(N130) );
  AND2X1 U43 ( .A(N125), .B(N119), .Y(N131) );
  NOR2X1 U44 ( .A(n18), .B(initial_time_valid), .Y(n22) );
  INVX2 U45 ( .A(initial_time_valid), .Y(n7) );
  AND2X1 U46 ( .A(mm_full), .B(n7), .Y(n18) );
  OAI2BB1X1 U47 ( .A0N(initial_time_valid), .A1N(initial_time_hh[3]), .B0(n10), 
        .Y(n43) );
  AOI22X1 U48 ( .A0(N90), .A1(n11), .B0(hh[3]), .B1(n12), .Y(n10) );
  OAI2BB1X1 U49 ( .A0N(initial_time_hh[2]), .A1N(initial_time_valid), .B0(n13), 
        .Y(n44) );
  AOI22X1 U50 ( .A0(N89), .A1(n11), .B0(hh[2]), .B1(n12), .Y(n13) );
  OAI2BB1X1 U51 ( .A0N(initial_time_hh[1]), .A1N(initial_time_valid), .B0(n14), 
        .Y(n45) );
  AOI22X1 U52 ( .A0(N88), .A1(n11), .B0(hh[1]), .B1(n12), .Y(n14) );
  OAI2BB1X1 U53 ( .A0N(initial_time_hh[0]), .A1N(initial_time_valid), .B0(n15), 
        .Y(n46) );
  AOI22X1 U54 ( .A0(N87), .A1(n11), .B0(hh[0]), .B1(n12), .Y(n15) );
  INVX2 U55 ( .A(hh[0]), .Y(N87) );
  OAI2BB1X1 U56 ( .A0N(initial_time_hh[4]), .A1N(initial_time_valid), .B0(n16), 
        .Y(n47) );
  AOI22X1 U57 ( .A0(N91), .A1(n11), .B0(hh[4]), .B1(n12), .Y(n16) );
  AND2X1 U58 ( .A(n17), .B(n18), .Y(n11) );
  AOI31X1 U59 ( .A0(hh[4]), .A1(hh[2]), .A2(n19), .B0(n12), .Y(n17) );
  AND3X2 U60 ( .A(n6), .B(hh[1]), .C(hh[0]), .Y(n19) );
  INVX2 U61 ( .A(hh[3]), .Y(n6) );
  OAI2BB1X1 U62 ( .A0N(initial_time_mm[1]), .A1N(initial_time_valid), .B0(n29), 
        .Y(n52) );
  AOI22X1 U63 ( .A0(N81), .A1(n25), .B0(mm[1]), .B1(n22), .Y(n29) );
  OAI2BB1X1 U64 ( .A0N(initial_time_mm[2]), .A1N(initial_time_valid), .B0(n28), 
        .Y(n51) );
  AOI22X1 U65 ( .A0(N82), .A1(n25), .B0(mm[2]), .B1(n22), .Y(n28) );
  OAI2BB1X1 U66 ( .A0N(initial_time_mm[3]), .A1N(initial_time_valid), .B0(n27), 
        .Y(n50) );
  AOI22X1 U67 ( .A0(N83), .A1(n25), .B0(mm[3]), .B1(n22), .Y(n27) );
  OAI2BB1X1 U68 ( .A0N(initial_time_mm[4]), .A1N(initial_time_valid), .B0(n26), 
        .Y(n49) );
  AOI22X1 U69 ( .A0(N84), .A1(n25), .B0(mm[4]), .B1(n22), .Y(n26) );
  OAI2BB1X1 U70 ( .A0N(initial_time_mm[5]), .A1N(initial_time_valid), .B0(n24), 
        .Y(n48) );
  AOI22X1 U71 ( .A0(N85), .A1(n25), .B0(mm[5]), .B1(n22), .Y(n24) );
  OAI2BB1X1 U72 ( .A0N(initial_time_mm[0]), .A1N(initial_time_valid), .B0(n30), 
        .Y(n53) );
  AOI22X1 U73 ( .A0(N80), .A1(n25), .B0(mm[0]), .B1(n22), .Y(n30) );
  INVX2 U74 ( .A(mm[0]), .Y(N80) );
  AND2X1 U75 ( .A(N41), .B(n1), .Y(N74) );
  ADDHXL U76 ( .A(mm[1]), .B(mm[0]), .CO(\add_60/carry[2] ), .S(N81) );
  ADDHXL U77 ( .A(mm[3]), .B(\add_60/carry[3] ), .CO(\add_60/carry[4] ), .S(
        N83) );
  ADDHXL U78 ( .A(mm[2]), .B(\add_60/carry[2] ), .CO(\add_60/carry[3] ), .S(
        N82) );
  ADDHXL U79 ( .A(mm[4]), .B(\add_60/carry[4] ), .CO(\add_60/carry[5] ), .S(
        N84) );
  NOR4X1 U80 ( .A(cnt[23]), .B(cnt[22]), .C(cnt[21]), .D(cnt[20]), .Y(n36) );
  XNOR2X1 U81 ( .A(n1), .B(clk_div), .Y(n41) );
  NOR4X1 U82 ( .A(cnt[1]), .B(cnt[19]), .C(cnt[18]), .D(cnt[17]), .Y(n35) );
  ADDHXL U83 ( .A(hh[1]), .B(hh[0]), .CO(\add_71/carry[2] ), .S(N88) );
  ADDHXL U84 ( .A(hh[2]), .B(\add_71/carry[2] ), .CO(\add_71/carry[3] ), .S(
        N89) );
  ADDHXL U85 ( .A(hh[3]), .B(\add_71/carry[3] ), .CO(\add_71/carry[4] ), .S(
        N90) );
  NOR4X1 U86 ( .A(cnt[9]), .B(cnt[8]), .C(cnt[7]), .D(cnt[6]), .Y(n40) );
  NOR4X1 U87 ( .A(cnt[16]), .B(cnt[15]), .C(cnt[14]), .D(cnt[13]), .Y(n34) );
  NOR4X1 U88 ( .A(cnt[12]), .B(cnt[11]), .C(cnt[10]), .D(cnt[0]), .Y(n33) );
  NOR4X1 U89 ( .A(cnt[30]), .B(cnt[2]), .C(cnt[29]), .D(cnt[28]), .Y(n38) );
  NOR4X1 U90 ( .A(cnt[5]), .B(cnt[4]), .C(cnt[3]), .D(cnt[31]), .Y(n39) );
  NOR4X1 U91 ( .A(cnt[27]), .B(cnt[26]), .C(cnt[25]), .D(cnt[24]), .Y(n37) );
  AND2X1 U92 ( .A(N10), .B(n1), .Y(N43) );
  ADDHXL U93 ( .A(mm_cnt[1]), .B(mm_cnt[0]), .CO(\add_94/carry[2] ), .S(N122)
         );
  ADDHXL U94 ( .A(mm_cnt[3]), .B(\add_94/carry[3] ), .CO(\add_94/carry[4] ), 
        .S(N124) );
  ADDHXL U95 ( .A(mm_cnt[2]), .B(\add_94/carry[2] ), .CO(\add_94/carry[3] ), 
        .S(N123) );
  AND2X1 U96 ( .A(N126), .B(N119), .Y(N132) );
  AND2X1 U97 ( .A(N121), .B(N119), .Y(N127) );
  INVX2 U98 ( .A(mm_cnt[0]), .Y(N121) );
  ADDHXL U99 ( .A(mm_cnt[4]), .B(\add_94/carry[4] ), .CO(\add_94/carry[5] ), 
        .S(N125) );
  XOR2X1 U100 ( .A(\add_60/carry[5] ), .B(mm[5]), .Y(N85) );
  XOR2X1 U101 ( .A(\add_71/carry[4] ), .B(hh[4]), .Y(N91) );
  XOR2X1 U102 ( .A(\add_94/carry[5] ), .B(mm_cnt[5]), .Y(N126) );
  AOI32X1 U103 ( .A0(mm[1]), .A1(mm[0]), .A2(mm[3]), .B0(mm[2]), .B1(mm[3]), 
        .Y(n2) );
  NAND3BX1 U104 ( .AN(n2), .B(mm[4]), .C(mm[5]), .Y(N78) );
  AOI32X1 U105 ( .A0(mm_cnt[1]), .A1(mm_cnt[0]), .A2(mm_cnt[3]), .B0(mm_cnt[2]), .B1(mm_cnt[3]), .Y(n3) );
  NAND3BX1 U106 ( .AN(n3), .B(mm_cnt[4]), .C(mm_cnt[5]), .Y(N119) );
endmodule


module RTC_DW01_inc_3 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;

  wire   [31:2] carry;

  ADDHXL U1_1_30 ( .A(A[30]), .B(carry[30]), .CO(carry[31]), .S(SUM[30]) );
  ADDHXL U1_1_27 ( .A(A[27]), .B(carry[27]), .CO(carry[28]), .S(SUM[27]) );
  ADDHXL U1_1_23 ( .A(A[23]), .B(carry[23]), .CO(carry[24]), .S(SUM[23]) );
  ADDHXL U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_26 ( .A(A[26]), .B(carry[26]), .CO(carry[27]), .S(SUM[26]) );
  ADDHXL U1_1_22 ( .A(A[22]), .B(carry[22]), .CO(carry[23]), .S(SUM[22]) );
  ADDHXL U1_1_19 ( .A(A[19]), .B(carry[19]), .CO(carry[20]), .S(SUM[19]) );
  ADDHXL U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_29 ( .A(A[29]), .B(carry[29]), .CO(carry[30]), .S(SUM[29]) );
  ADDHXL U1_1_25 ( .A(A[25]), .B(carry[25]), .CO(carry[26]), .S(SUM[25]) );
  ADDHXL U1_1_21 ( .A(A[21]), .B(carry[21]), .CO(carry[22]), .S(SUM[21]) );
  ADDHXL U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADDHXL U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_28 ( .A(A[28]), .B(carry[28]), .CO(carry[29]), .S(SUM[28]) );
  ADDHXL U1_1_24 ( .A(A[24]), .B(carry[24]), .CO(carry[25]), .S(SUM[24]) );
  ADDHXL U1_1_20 ( .A(A[20]), .B(carry[20]), .CO(carry[21]), .S(SUM[20]) );
  ADDHXL U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADDHXL U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[31]), .B(A[31]), .Y(SUM[31]) );
endmodule


module decode7_4 ( in, led );
  input [3:0] in;
  output [6:0] led;
  wire   n1, n2, n3, n4, n5, n6, n7, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;

  NAND3X1 U3 ( .A(n31), .B(n30), .C(n47), .Y(led[0]) );
  NAND2X1 U4 ( .A(n7), .B(n6), .Y(n38) );
  AND3X2 U5 ( .A(n34), .B(n49), .C(n45), .Y(n36) );
  OR2X1 U6 ( .A(n38), .B(in[0]), .Y(n31) );
  NAND3X1 U7 ( .A(n37), .B(n48), .C(n36), .Y(led[2]) );
  NAND3X1 U8 ( .A(n35), .B(n43), .C(n36), .Y(led[1]) );
  AND2X1 U9 ( .A(n39), .B(n43), .Y(n47) );
  AOI211X1 U10 ( .A0(n5), .A1(n33), .B0(n1), .C0(n46), .Y(n39) );
  INVX2 U11 ( .A(n34), .Y(n1) );
  NAND3X1 U12 ( .A(n49), .B(n48), .C(n47), .Y(led[6]) );
  NAND4BX1 U13 ( .AN(n46), .B(n45), .C(n44), .D(n43), .Y(led[5]) );
  NOR2X1 U14 ( .A(n6), .B(in[0]), .Y(n33) );
  NAND4X1 U15 ( .A(n39), .B(n44), .C(n49), .D(n38), .Y(led[3]) );
  NOR2X1 U16 ( .A(n5), .B(n7), .Y(n41) );
  NAND3X1 U17 ( .A(in[0]), .B(n6), .C(n41), .Y(n34) );
  NAND3BX1 U18 ( .AN(in[0]), .B(n6), .C(n41), .Y(n35) );
  NAND2X1 U19 ( .A(n33), .B(n29), .Y(n30) );
  INVX2 U20 ( .A(n29), .Y(n3) );
  INVX2 U21 ( .A(in[2]), .Y(n6) );
  AOI211X1 U22 ( .A0(in[1]), .A1(n33), .B0(n4), .C0(n32), .Y(n45) );
  INVX2 U23 ( .A(n30), .Y(n4) );
  OAI21X1 U24 ( .A0(in[0]), .A1(n48), .B0(n31), .Y(n32) );
  INVX2 U25 ( .A(in[1]), .Y(n7) );
  NAND3X1 U26 ( .A(n6), .B(n5), .C(in[1]), .Y(n48) );
  NAND4X1 U27 ( .A(in[2]), .B(in[0]), .C(n7), .D(n5), .Y(n37) );
  OAI211X1 U28 ( .A0(in[2]), .A1(n3), .B0(n35), .C0(n37), .Y(n46) );
  OAI32X1 U29 ( .A0(n42), .A1(in[0]), .A2(n2), .B0(n41), .B1(n40), .Y(led[4])
         );
  INVX2 U30 ( .A(n43), .Y(n2) );
  AOI21X1 U31 ( .A0(in[0]), .A1(n42), .B0(n6), .Y(n40) );
  OAI21X1 U32 ( .A0(n7), .A1(in[3]), .B0(n3), .Y(n42) );
  NAND3X1 U33 ( .A(in[1]), .B(n5), .C(in[0]), .Y(n44) );
  NOR2X1 U34 ( .A(n5), .B(in[1]), .Y(n29) );
  NAND2X1 U35 ( .A(n41), .B(in[2]), .Y(n43) );
  NAND3X1 U36 ( .A(in[0]), .B(n29), .C(in[2]), .Y(n49) );
  INVX2 U37 ( .A(in[3]), .Y(n5) );
endmodule


module decode7_5 ( in, led );
  input [3:0] in;
  output [6:0] led;
  wire   n1, n2, n3, n4, n5, n6, n7, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;

  NAND3X1 U3 ( .A(n31), .B(n30), .C(n47), .Y(led[0]) );
  AND3X2 U4 ( .A(n34), .B(n49), .C(n45), .Y(n36) );
  NAND2X1 U5 ( .A(n7), .B(n6), .Y(n38) );
  OR2X1 U6 ( .A(n38), .B(in[0]), .Y(n31) );
  NAND3X1 U7 ( .A(n37), .B(n48), .C(n36), .Y(led[2]) );
  NAND3X1 U8 ( .A(n35), .B(n43), .C(n36), .Y(led[1]) );
  NAND3BX1 U9 ( .AN(in[0]), .B(n6), .C(n41), .Y(n35) );
  AND2X1 U10 ( .A(n39), .B(n43), .Y(n47) );
  AOI211X1 U11 ( .A0(n5), .A1(n33), .B0(n1), .C0(n46), .Y(n39) );
  INVX2 U12 ( .A(n34), .Y(n1) );
  NAND3X1 U13 ( .A(n49), .B(n48), .C(n47), .Y(led[6]) );
  NOR2X1 U14 ( .A(n5), .B(n7), .Y(n41) );
  INVX2 U15 ( .A(n29), .Y(n3) );
  NAND4BX1 U16 ( .AN(n46), .B(n45), .C(n44), .D(n43), .Y(led[5]) );
  NAND2X1 U17 ( .A(n33), .B(n29), .Y(n30) );
  NAND3X1 U18 ( .A(in[0]), .B(n6), .C(n41), .Y(n34) );
  NOR2X1 U19 ( .A(n6), .B(in[0]), .Y(n33) );
  NAND4X1 U20 ( .A(n39), .B(n44), .C(n49), .D(n38), .Y(led[3]) );
  INVX2 U21 ( .A(in[2]), .Y(n6) );
  AOI211X1 U22 ( .A0(in[1]), .A1(n33), .B0(n4), .C0(n32), .Y(n45) );
  INVX2 U23 ( .A(n30), .Y(n4) );
  OAI21X1 U24 ( .A0(in[0]), .A1(n48), .B0(n31), .Y(n32) );
  INVX2 U25 ( .A(in[1]), .Y(n7) );
  NAND3X1 U26 ( .A(n6), .B(n5), .C(in[1]), .Y(n48) );
  OAI211X1 U27 ( .A0(in[2]), .A1(n3), .B0(n35), .C0(n37), .Y(n46) );
  NAND4X1 U28 ( .A(in[2]), .B(in[0]), .C(n7), .D(n5), .Y(n37) );
  NOR2X1 U29 ( .A(n5), .B(in[1]), .Y(n29) );
  INVX2 U30 ( .A(in[3]), .Y(n5) );
  NAND2X1 U31 ( .A(n41), .B(in[2]), .Y(n43) );
  OAI32X1 U32 ( .A0(n42), .A1(in[0]), .A2(n2), .B0(n41), .B1(n40), .Y(led[4])
         );
  AOI21X1 U33 ( .A0(in[0]), .A1(n42), .B0(n6), .Y(n40) );
  OAI21X1 U34 ( .A0(n7), .A1(in[3]), .B0(n3), .Y(n42) );
  INVX2 U35 ( .A(n43), .Y(n2) );
  NAND3X1 U36 ( .A(in[0]), .B(n29), .C(in[2]), .Y(n49) );
  NAND3X1 U37 ( .A(in[1]), .B(n5), .C(in[0]), .Y(n44) );
endmodule


module decode7_6 ( in, led );
  input [3:0] in;
  output [6:0] led;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n1, n2, n3, n4, n5, n6, n7;

  NAND3X1 U3 ( .A(n26), .B(n27), .C(n10), .Y(led[0]) );
  AND3X2 U4 ( .A(n23), .B(n8), .C(n12), .Y(n21) );
  NAND2X1 U5 ( .A(n7), .B(n6), .Y(n19) );
  OR2X1 U6 ( .A(n19), .B(in[0]), .Y(n26) );
  NAND3X1 U7 ( .A(n20), .B(n9), .C(n21), .Y(led[2]) );
  NAND3X1 U8 ( .A(n22), .B(n14), .C(n21), .Y(led[1]) );
  NAND3BX1 U9 ( .AN(in[0]), .B(n6), .C(n16), .Y(n22) );
  AND2X1 U10 ( .A(n18), .B(n14), .Y(n10) );
  AOI211X1 U11 ( .A0(n5), .A1(n24), .B0(n1), .C0(n11), .Y(n18) );
  INVX2 U12 ( .A(n23), .Y(n1) );
  NAND3X1 U13 ( .A(n8), .B(n9), .C(n10), .Y(led[6]) );
  NOR2X1 U14 ( .A(n5), .B(n7), .Y(n16) );
  INVX2 U15 ( .A(n28), .Y(n3) );
  NAND4BX1 U16 ( .AN(n11), .B(n12), .C(n13), .D(n14), .Y(led[5]) );
  NAND2X1 U17 ( .A(n24), .B(n28), .Y(n27) );
  NAND3X1 U18 ( .A(in[0]), .B(n6), .C(n16), .Y(n23) );
  NOR2X1 U19 ( .A(n6), .B(in[0]), .Y(n24) );
  NAND4X1 U20 ( .A(n18), .B(n13), .C(n8), .D(n19), .Y(led[3]) );
  INVX2 U21 ( .A(in[2]), .Y(n6) );
  AOI211X1 U22 ( .A0(in[1]), .A1(n24), .B0(n4), .C0(n25), .Y(n12) );
  INVX2 U23 ( .A(n27), .Y(n4) );
  OAI21X1 U24 ( .A0(in[0]), .A1(n9), .B0(n26), .Y(n25) );
  INVX2 U25 ( .A(in[1]), .Y(n7) );
  NAND3X1 U26 ( .A(n6), .B(n5), .C(in[1]), .Y(n9) );
  OAI211X1 U27 ( .A0(in[2]), .A1(n3), .B0(n22), .C0(n20), .Y(n11) );
  NAND4X1 U28 ( .A(in[2]), .B(in[0]), .C(n7), .D(n5), .Y(n20) );
  NOR2X1 U29 ( .A(n5), .B(in[1]), .Y(n28) );
  INVX2 U30 ( .A(in[3]), .Y(n5) );
  NAND2X1 U31 ( .A(n16), .B(in[2]), .Y(n14) );
  OAI32X1 U32 ( .A0(n15), .A1(in[0]), .A2(n2), .B0(n16), .B1(n17), .Y(led[4])
         );
  AOI21X1 U33 ( .A0(in[0]), .A1(n15), .B0(n6), .Y(n17) );
  OAI21X1 U34 ( .A0(n7), .A1(in[3]), .B0(n3), .Y(n15) );
  INVX2 U35 ( .A(n14), .Y(n2) );
  NAND3X1 U36 ( .A(in[0]), .B(n28), .C(in[2]), .Y(n8) );
  NAND3X1 U37 ( .A(in[1]), .B(n5), .C(in[0]), .Y(n13) );
endmodule


module bcd_2 ( clk, rst_n, bin_in, dec_out0, dec_out1, dec_out2 );
  input [7:0] bin_in;
  output [3:0] dec_out0;
  output [3:0] dec_out1;
  output [3:0] dec_out2;
  input clk, rst_n;
  wire   N79, N80, N81, N82, N83, N84, N85, N86, N130, N131, N132, N182, N183,
         N184, N185, N186, N187, N190, N191, N192, N193, N194, N198, N199,
         N200, N201, N202, N203, N204, N205, N206, N207, N221, N222, N223,
         N273, N274, N275, N276, N277, N278, N281, N282, N283, N284, N285,
         N289, N290, N291, N292, N293, N294, N295, N296, N297, N298, N307,
         N308, N309, \add_148_C115/carry[3] , \add_148_C115/carry[4] ,
         \add_146_C115/carry[4] , \add_144_C115/carry[3] ,
         \add_144_C115/carry[4] , \add_148_C114/carry[3] ,
         \add_148_C114/carry[4] , \add_146_C114/carry[4] ,
         \add_144_C114/carry[3] , \add_144_C114/carry[4] ,
         \add_0_root_add_0_root_add_136_3_C115/carry[1] ,
         \add_0_root_add_0_root_add_136_3_C115/carry[2] ,
         \add_0_root_add_0_root_add_136_3_C115/carry[3] ,
         \add_0_root_add_0_root_add_136_3_C115/B[0] ,
         \add_0_root_add_0_root_add_136_3_C115/B[1] ,
         \add_0_root_add_0_root_add_136_3_C116/carry[1] ,
         \add_0_root_add_0_root_add_136_3_C116/B[0] ,
         \add_0_root_add_0_root_add_136_3_C116/B[1] ,
         \add_0_root_add_0_root_add_136_3_C114/carry[2] ,
         \add_0_root_add_0_root_add_136_3_C114/carry[3] ,
         \add_0_root_add_0_root_add_136_3_C114/B[1] ,
         \add_0_root_add_0_root_add_136_3_C114/B[2] ,
         \add_0_root_add_0_root_add_136_3_C114/B[3] , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59;
  wire   [9:0] data_1;
  assign dec_out2[3] = 1'b0;

  DFFRHQX1 \data_0_reg[0]  ( .D(bin_in[0]), .CK(clk), .RN(rst_n), .Q(N182) );
  DFFRHQX1 \data_b_reg[5]  ( .D(N298), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C116/B[1] ) );
  DFFRHQX1 \data_1_reg[9]  ( .D(N86), .CK(clk), .RN(rst_n), .Q(data_1[9]) );
  DFFRHQX1 \data_1_reg[8]  ( .D(N85), .CK(clk), .RN(rst_n), .Q(data_1[8]) );
  DFFRHQX1 \data_b_reg[4]  ( .D(N297), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C116/B[0] ) );
  DFFRHQX1 \data_1_reg[7]  ( .D(N84), .CK(clk), .RN(rst_n), .Q(data_1[7]) );
  DFFRHQX1 \data_0_reg[3]  ( .D(bin_in[3]), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C114/B[3] ) );
  DFFRHQX1 \data_1_reg[3]  ( .D(N81), .CK(clk), .RN(rst_n), .Q(data_1[3]) );
  DFFRHQX1 \data_1_reg[6]  ( .D(N83), .CK(clk), .RN(rst_n), .Q(data_1[6]) );
  DFFRHQX1 \data_0_reg[2]  ( .D(bin_in[2]), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C114/B[2] ) );
  DFFRHQX1 \data_1_reg[2]  ( .D(N80), .CK(clk), .RN(rst_n), .Q(data_1[2]) );
  DFFRHQX1 \data_0_reg[1]  ( .D(bin_in[1]), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C114/B[1] ) );
  DFFRHQX1 \data_1_reg[1]  ( .D(N79), .CK(clk), .RN(rst_n), .Q(data_1[1]) );
  DFFRHQX1 \data_a_reg[5]  ( .D(N207), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C115/B[1] ) );
  DFFRHQX1 \data_1_reg[4]  ( .D(N79), .CK(clk), .RN(rst_n), .Q(data_1[4]) );
  DFFRHQX1 \data_a_reg[4]  ( .D(N206), .CK(clk), .RN(rst_n), .Q(
        \add_0_root_add_0_root_add_136_3_C115/B[0] ) );
  DFFRHQX1 \data_1_reg[5]  ( .D(N82), .CK(clk), .RN(rst_n), .Q(data_1[5]) );
  DFFRHQX1 \data_a_reg[0]  ( .D(N202), .CK(clk), .RN(rst_n), .Q(dec_out0[0])
         );
  DFFRHQX1 \data_b_reg[0]  ( .D(N293), .CK(clk), .RN(rst_n), .Q(dec_out1[0])
         );
  DFFRHQX1 \data_c_reg[0]  ( .D(N307), .CK(clk), .RN(rst_n), .Q(dec_out2[0])
         );
  DFFRHQX1 \data_a_reg[3]  ( .D(N205), .CK(clk), .RN(rst_n), .Q(dec_out0[3])
         );
  DFFRHQX1 \data_b_reg[3]  ( .D(N296), .CK(clk), .RN(rst_n), .Q(dec_out1[3])
         );
  DFFRHQX1 \data_a_reg[1]  ( .D(N203), .CK(clk), .RN(rst_n), .Q(dec_out0[1])
         );
  DFFRHQX1 \data_b_reg[1]  ( .D(N294), .CK(clk), .RN(rst_n), .Q(dec_out1[1])
         );
  DFFRHQX1 \data_c_reg[1]  ( .D(N308), .CK(clk), .RN(rst_n), .Q(dec_out2[1])
         );
  DFFRHQX1 \data_a_reg[2]  ( .D(N204), .CK(clk), .RN(rst_n), .Q(dec_out0[2])
         );
  DFFRHQX1 \data_b_reg[2]  ( .D(N295), .CK(clk), .RN(rst_n), .Q(dec_out1[2])
         );
  DFFRHQX1 \data_c_reg[2]  ( .D(N309), .CK(clk), .RN(rst_n), .Q(dec_out2[2])
         );
  INVX2 U3 ( .A(N281), .Y(N274) );
  INVX2 U4 ( .A(N190), .Y(N183) );
  INVX2 U5 ( .A(N221), .Y(N282) );
  INVX2 U6 ( .A(N130), .Y(N191) );
  XOR2X1 U7 ( .A(data_1[7]), .B(
        \add_0_root_add_0_root_add_136_3_C115/carry[3] ), .Y(N222) );
  ADDFX2 U8 ( .A(data_1[5]), .B(\add_0_root_add_0_root_add_136_3_C115/B[1] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C115/carry[1] ), .CO(
        \add_0_root_add_0_root_add_136_3_C115/carry[2] ), .S(N281) );
  ADDFX2 U9 ( .A(data_1[3]), .B(\add_0_root_add_0_root_add_136_3_C114/B[3] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C114/carry[3] ), .CO(N132), .S(
        N131) );
  ADDFX2 U10 ( .A(data_1[2]), .B(\add_0_root_add_0_root_add_136_3_C114/B[2] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C114/carry[2] ), .CO(
        \add_0_root_add_0_root_add_136_3_C114/carry[3] ), .S(N130) );
  XOR2X1 U11 ( .A(data_1[6]), .B(
        \add_0_root_add_0_root_add_136_3_C115/carry[2] ), .Y(N221) );
  AND2X1 U12 ( .A(\add_0_root_add_0_root_add_136_3_C115/carry[3] ), .B(
        data_1[7]), .Y(N223) );
  XOR2X1 U13 ( .A(\add_0_root_add_0_root_add_136_3_C114/B[1] ), .B(data_1[1]), 
        .Y(N190) );
  ADDFX2 U14 ( .A(data_1[9]), .B(\add_0_root_add_0_root_add_136_3_C116/B[1] ), 
        .CI(\add_0_root_add_0_root_add_136_3_C116/carry[1] ), .CO(N309), .S(
        N308) );
  AND2X1 U16 ( .A(data_1[8]), .B(\add_0_root_add_0_root_add_136_3_C116/B[0] ), 
        .Y(\add_0_root_add_0_root_add_136_3_C116/carry[1] ) );
  XOR2X1 U17 ( .A(\add_0_root_add_0_root_add_136_3_C116/B[0] ), .B(data_1[8]), 
        .Y(N307) );
  AND2X1 U18 ( .A(\add_148_C115/carry[4] ), .B(N223), .Y(N292) );
  XOR2X1 U19 ( .A(N223), .B(\add_148_C115/carry[4] ), .Y(N291) );
  AND2X1 U20 ( .A(\add_148_C115/carry[3] ), .B(N222), .Y(
        \add_148_C115/carry[4] ) );
  XOR2X1 U21 ( .A(N222), .B(\add_148_C115/carry[3] ), .Y(N290) );
  OR2X1 U22 ( .A(N221), .B(N281), .Y(\add_148_C115/carry[3] ) );
  XNOR2X1 U23 ( .A(N281), .B(N221), .Y(N289) );
  AND2X1 U24 ( .A(\add_146_C115/carry[4] ), .B(N223), .Y(N285) );
  XOR2X1 U25 ( .A(N223), .B(\add_146_C115/carry[4] ), .Y(N284) );
  OR2X1 U26 ( .A(N222), .B(N221), .Y(\add_146_C115/carry[4] ) );
  XNOR2X1 U27 ( .A(N221), .B(N222), .Y(N283) );
  OR2X1 U28 ( .A(N223), .B(\add_144_C115/carry[4] ), .Y(N278) );
  XNOR2X1 U29 ( .A(\add_144_C115/carry[4] ), .B(N223), .Y(N277) );
  AND2X1 U30 ( .A(\add_144_C115/carry[3] ), .B(N222), .Y(
        \add_144_C115/carry[4] ) );
  XOR2X1 U31 ( .A(N222), .B(\add_144_C115/carry[3] ), .Y(N276) );
  AND2X1 U32 ( .A(N281), .B(N221), .Y(\add_144_C115/carry[3] ) );
  XOR2X1 U33 ( .A(N221), .B(N281), .Y(N275) );
  AND2X1 U34 ( .A(\add_0_root_add_0_root_add_136_3_C115/carry[2] ), .B(
        data_1[6]), .Y(\add_0_root_add_0_root_add_136_3_C115/carry[3] ) );
  AND2X1 U35 ( .A(data_1[4]), .B(\add_0_root_add_0_root_add_136_3_C115/B[0] ), 
        .Y(\add_0_root_add_0_root_add_136_3_C115/carry[1] ) );
  XOR2X1 U36 ( .A(\add_0_root_add_0_root_add_136_3_C115/B[0] ), .B(data_1[4]), 
        .Y(N273) );
  AND2X1 U37 ( .A(\add_148_C114/carry[4] ), .B(N132), .Y(N201) );
  XOR2X1 U38 ( .A(N132), .B(\add_148_C114/carry[4] ), .Y(N200) );
  AND2X1 U39 ( .A(\add_148_C114/carry[3] ), .B(N131), .Y(
        \add_148_C114/carry[4] ) );
  XOR2X1 U40 ( .A(N131), .B(\add_148_C114/carry[3] ), .Y(N199) );
  OR2X1 U41 ( .A(N130), .B(N190), .Y(\add_148_C114/carry[3] ) );
  XNOR2X1 U42 ( .A(N190), .B(N130), .Y(N198) );
  AND2X1 U43 ( .A(\add_146_C114/carry[4] ), .B(N132), .Y(N194) );
  XOR2X1 U44 ( .A(N132), .B(\add_146_C114/carry[4] ), .Y(N193) );
  OR2X1 U45 ( .A(N131), .B(N130), .Y(\add_146_C114/carry[4] ) );
  XNOR2X1 U46 ( .A(N130), .B(N131), .Y(N192) );
  OR2X1 U47 ( .A(N132), .B(\add_144_C114/carry[4] ), .Y(N187) );
  XNOR2X1 U48 ( .A(\add_144_C114/carry[4] ), .B(N132), .Y(N186) );
  AND2X1 U49 ( .A(\add_144_C114/carry[3] ), .B(N131), .Y(
        \add_144_C114/carry[4] ) );
  XOR2X1 U50 ( .A(N131), .B(\add_144_C114/carry[3] ), .Y(N185) );
  AND2X1 U51 ( .A(N190), .B(N130), .Y(\add_144_C114/carry[3] ) );
  XOR2X1 U52 ( .A(N130), .B(N190), .Y(N184) );
  AND2X1 U53 ( .A(data_1[1]), .B(\add_0_root_add_0_root_add_136_3_C114/B[1] ), 
        .Y(\add_0_root_add_0_root_add_136_3_C114/carry[2] ) );
  NOR2X1 U54 ( .A(n1), .B(n2), .Y(N86) );
  NAND3X1 U55 ( .A(n3), .B(n4), .C(n5), .Y(N85) );
  OAI22X1 U56 ( .A0(n2), .A1(n6), .B0(n7), .B1(n8), .Y(N84) );
  NOR2X1 U57 ( .A(n9), .B(n10), .Y(n7) );
  OAI211X1 U58 ( .A0(n11), .A1(n12), .B0(n13), .C0(n4), .Y(N83) );
  NAND2X1 U59 ( .A(n14), .B(n6), .Y(n4) );
  NAND3X1 U60 ( .A(n13), .B(n3), .C(n15), .Y(N82) );
  AOI22X1 U61 ( .A0(n10), .A1(n8), .B0(bin_in[5]), .B1(n14), .Y(n15) );
  CLKINVX1 U62 ( .A(n16), .Y(n10) );
  OAI221X1 U63 ( .A0(n2), .A1(n17), .B0(n12), .B1(n18), .C0(n3), .Y(N81) );
  NAND2X1 U64 ( .A(n1), .B(n14), .Y(n3) );
  OAI211X1 U65 ( .A0(n19), .A1(n20), .B0(n21), .C0(n22), .Y(N80) );
  NOR2BX1 U66 ( .AN(n13), .B(n23), .Y(n22) );
  NAND2X1 U67 ( .A(n11), .B(n1), .Y(n13) );
  OAI211X1 U68 ( .A0(n16), .A1(n18), .B0(n5), .C0(n21), .Y(N79) );
  AOI2BB2X1 U69 ( .B0(n24), .B1(n23), .A0N(n17), .A1N(n18), .Y(n21) );
  CLKINVX1 U70 ( .A(n9), .Y(n17) );
  NOR2X1 U71 ( .A(n20), .B(bin_in[5]), .Y(n9) );
  NOR2X1 U72 ( .A(n16), .B(n25), .Y(n23) );
  CLKINVX1 U73 ( .A(n26), .Y(n5) );
  OAI22X1 U74 ( .A0(n2), .A1(n6), .B0(n27), .B1(n12), .Y(n26) );
  NAND2X1 U75 ( .A(bin_in[5]), .B(bin_in[4]), .Y(n12) );
  NOR2X1 U76 ( .A(n14), .B(n11), .Y(n27) );
  CLKINVX1 U77 ( .A(n8), .Y(n11) );
  NAND2X1 U78 ( .A(bin_in[6]), .B(n24), .Y(n8) );
  CLKINVX1 U79 ( .A(n19), .Y(n14) );
  NAND2X1 U80 ( .A(bin_in[7]), .B(n25), .Y(n19) );
  CLKINVX1 U81 ( .A(n1), .Y(n6) );
  NOR2X1 U82 ( .A(bin_in[5]), .B(bin_in[4]), .Y(n1) );
  NAND2X1 U83 ( .A(bin_in[7]), .B(bin_in[6]), .Y(n2) );
  NAND2X1 U84 ( .A(n25), .B(n24), .Y(n18) );
  CLKINVX1 U85 ( .A(bin_in[7]), .Y(n24) );
  CLKINVX1 U86 ( .A(bin_in[6]), .Y(n25) );
  NAND2X1 U87 ( .A(bin_in[5]), .B(n20), .Y(n16) );
  CLKINVX1 U88 ( .A(bin_in[4]), .Y(n20) );
  OAI2BB1X1 U89 ( .A0N(N278), .A1N(n28), .B0(n29), .Y(N298) );
  AOI22X1 U90 ( .A0(N285), .A1(n30), .B0(N292), .B1(n31), .Y(n29) );
  OAI2BB1X1 U91 ( .A0N(N277), .A1N(n28), .B0(n32), .Y(N297) );
  AOI22X1 U92 ( .A0(N284), .A1(n30), .B0(N291), .B1(n31), .Y(n32) );
  NAND2X1 U93 ( .A(n33), .B(n34), .Y(N296) );
  AOI22X1 U94 ( .A0(N283), .A1(n30), .B0(N290), .B1(n31), .Y(n34) );
  AOI22X1 U95 ( .A0(n35), .A1(N222), .B0(N276), .B1(n28), .Y(n33) );
  NAND2X1 U96 ( .A(n36), .B(n37), .Y(N295) );
  AOI22X1 U97 ( .A0(N282), .A1(n30), .B0(N289), .B1(n31), .Y(n37) );
  AOI22X1 U98 ( .A0(n35), .A1(N221), .B0(N275), .B1(n28), .Y(n36) );
  NAND2X1 U99 ( .A(n38), .B(n39), .Y(N294) );
  AOI22X1 U100 ( .A0(N281), .A1(n30), .B0(N274), .B1(n31), .Y(n39) );
  AOI22X1 U101 ( .A0(n35), .A1(N281), .B0(N274), .B1(n28), .Y(n38) );
  NAND2X1 U102 ( .A(n40), .B(n41), .Y(N293) );
  AOI22X1 U103 ( .A0(N273), .A1(n30), .B0(N273), .B1(n31), .Y(n41) );
  NOR2BX1 U104 ( .AN(n42), .B(n35), .Y(n31) );
  NOR2X1 U105 ( .A(n42), .B(n28), .Y(n30) );
  OAI21X1 U106 ( .A0(N222), .A1(N221), .B0(N223), .Y(n42) );
  AOI22X1 U107 ( .A0(N273), .A1(n35), .B0(N273), .B1(n28), .Y(n40) );
  AND4X2 U108 ( .A(N223), .B(N222), .C(N221), .D(N281), .Y(n28) );
  NOR2BX1 U109 ( .AN(n43), .B(N223), .Y(n35) );
  OAI21X1 U110 ( .A0(N281), .A1(N221), .B0(N222), .Y(n43) );
  OAI2BB1X1 U111 ( .A0N(N187), .A1N(n44), .B0(n45), .Y(N207) );
  AOI22X1 U112 ( .A0(N194), .A1(n46), .B0(N201), .B1(n47), .Y(n45) );
  OAI2BB1X1 U113 ( .A0N(N186), .A1N(n44), .B0(n48), .Y(N206) );
  AOI22X1 U114 ( .A0(N193), .A1(n46), .B0(N200), .B1(n47), .Y(n48) );
  NAND2X1 U115 ( .A(n49), .B(n50), .Y(N205) );
  AOI22X1 U116 ( .A0(N192), .A1(n46), .B0(N199), .B1(n47), .Y(n50) );
  AOI22X1 U117 ( .A0(n51), .A1(N131), .B0(N185), .B1(n44), .Y(n49) );
  NAND2X1 U118 ( .A(n52), .B(n53), .Y(N204) );
  AOI22X1 U119 ( .A0(N191), .A1(n46), .B0(N198), .B1(n47), .Y(n53) );
  AOI22X1 U120 ( .A0(n51), .A1(N130), .B0(N184), .B1(n44), .Y(n52) );
  NAND2X1 U121 ( .A(n54), .B(n55), .Y(N203) );
  AOI22X1 U122 ( .A0(N190), .A1(n46), .B0(N183), .B1(n47), .Y(n55) );
  AOI22X1 U123 ( .A0(n51), .A1(N190), .B0(N183), .B1(n44), .Y(n54) );
  NAND2X1 U124 ( .A(n56), .B(n57), .Y(N202) );
  AOI22X1 U125 ( .A0(N182), .A1(n46), .B0(N182), .B1(n47), .Y(n57) );
  NOR2BX1 U126 ( .AN(n58), .B(n51), .Y(n47) );
  NOR2X1 U127 ( .A(n58), .B(n44), .Y(n46) );
  OAI21X1 U128 ( .A0(N131), .A1(N130), .B0(N132), .Y(n58) );
  AOI22X1 U129 ( .A0(N182), .A1(n51), .B0(N182), .B1(n44), .Y(n56) );
  AND4X2 U130 ( .A(N132), .B(N131), .C(N130), .D(N190), .Y(n44) );
  NOR2BX1 U131 ( .AN(n59), .B(N132), .Y(n51) );
  OAI21X1 U132 ( .A0(N190), .A1(N130), .B0(N131), .Y(n59) );
endmodule


module FIRROOT ( clk, Data_i, B0, B1, B2, B3, B4, B5, B6, FIRout, ROOTout );
  input [7:0] Data_i;
  input [7:0] B0;
  input [7:0] B1;
  input [7:0] B2;
  input [7:0] B3;
  input [7:0] B4;
  input [7:0] B5;
  input [7:0] B6;
  output [7:0] FIRout;
  output [3:0] ROOTout;
  input clk;

  wire   [7:0] FIRouttemp;

  FIR UFIR ( .clk(clk), .Xin(Data_i), .B0(B0), .B1(B1), .B2(B2), .B3(B3), .B4(
        B4), .B5(B5), .B6(B6), .Yout(FIRouttemp) );
  ROOT UROOT ( .clk(clk), .X(FIRouttemp), .C(ROOTout), .X_r4(FIRout) );
endmodule


module ROOT ( clk, X, C, X_r4 );
  input [7:0] X;
  output [3:0] C;
  output [7:0] X_r4;
  input clk;
  wire   C3_3_d, C3_3, C2_2_d, C2_2, C1_1_d, C3_1, C2_1, C1_1, C0_0_d, n1, n2,
         n3;
  wire   [7:0] X_r1;
  wire   [7:0] X_r2;
  wire   [7:5] T2;
  wire   [7:0] X_r3;
  wire   [7:3] T3;

  CPR_3 U1 ( .Operator(X), .Threshold({1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .Result(C3_3_d) );
  CPR_2 U2 ( .Operator(X_r1), .Threshold({C3_3, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 
        1'b0, 1'b0}), .Result(C2_2_d) );
  CPR_1 U3 ( .Operator(X_r2), .Threshold({T2, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0}), 
        .Result(C1_1_d) );
  CPR_0 U4 ( .Operator(X_r3), .Threshold({T3, 1'b0, 1'b0, 1'b1}), .Result(
        C0_0_d) );
  DFFHQX1 \X_r1_reg[1]  ( .D(X[1]), .CK(clk), .Q(X_r1[1]) );
  DFFHQX1 \X_r2_reg[1]  ( .D(X_r1[1]), .CK(clk), .Q(X_r2[1]) );
  DFFHQX1 \X_r1_reg[3]  ( .D(X[3]), .CK(clk), .Q(X_r1[3]) );
  DFFHQX1 \X_r1_reg[2]  ( .D(X[2]), .CK(clk), .Q(X_r1[2]) );
  DFFHQX1 \X_r1_reg[0]  ( .D(X[0]), .CK(clk), .Q(X_r1[0]) );
  DFFHQX1 \X_r2_reg[0]  ( .D(X_r1[0]), .CK(clk), .Q(X_r2[0]) );
  DFFHQX1 \X_r1_reg[4]  ( .D(X[4]), .CK(clk), .Q(X_r1[4]) );
  DFFHQX1 \X_r3_reg[1]  ( .D(X_r2[1]), .CK(clk), .Q(X_r3[1]) );
  DFFHQX1 \X_r3_reg[0]  ( .D(X_r2[0]), .CK(clk), .Q(X_r3[0]) );
  DFFHQX1 \X_r2_reg[2]  ( .D(X_r1[2]), .CK(clk), .Q(X_r2[2]) );
  DFFHQX1 \X_r1_reg[6]  ( .D(X[6]), .CK(clk), .Q(X_r1[6]) );
  DFFHQX1 \X_r2_reg[3]  ( .D(X_r1[3]), .CK(clk), .Q(X_r2[3]) );
  DFFHQX1 \X_r2_reg[6]  ( .D(X_r1[6]), .CK(clk), .Q(X_r2[6]) );
  DFFHQX1 \X_r3_reg[6]  ( .D(X_r2[6]), .CK(clk), .Q(X_r3[6]) );
  DFFHQX1 \X_r3_reg[2]  ( .D(X_r2[2]), .CK(clk), .Q(X_r3[2]) );
  DFFHQX1 \X_r1_reg[5]  ( .D(X[5]), .CK(clk), .Q(X_r1[5]) );
  DFFHQX1 \X_r2_reg[4]  ( .D(X_r1[4]), .CK(clk), .Q(X_r2[4]) );
  DFFHQX1 \X_r3_reg[4]  ( .D(X_r2[4]), .CK(clk), .Q(X_r3[4]) );
  DFFHQX1 C3_3_reg ( .D(C3_3_d), .CK(clk), .Q(C3_3) );
  DFFHQX1 \X_r1_reg[7]  ( .D(X[7]), .CK(clk), .Q(X_r1[7]) );
  DFFHQX1 \X_r2_reg[7]  ( .D(X_r1[7]), .CK(clk), .Q(X_r2[7]) );
  DFFHQX1 \X_r3_reg[7]  ( .D(X_r2[7]), .CK(clk), .Q(X_r3[7]) );
  DFFHQX1 \X_r3_reg[3]  ( .D(X_r2[3]), .CK(clk), .Q(X_r3[3]) );
  DFFHQX1 \X_r2_reg[5]  ( .D(X_r1[5]), .CK(clk), .Q(X_r2[5]) );
  DFFHQX1 \X_r3_reg[5]  ( .D(X_r2[5]), .CK(clk), .Q(X_r3[5]) );
  DFFHQX1 C1_1_reg ( .D(C1_1_d), .CK(clk), .Q(C1_1) );
  DFFHQX1 C3_2_reg ( .D(C3_3), .CK(clk), .Q(T2[6]) );
  DFFHQX1 C2_2_reg ( .D(C2_2_d), .CK(clk), .Q(C2_2) );
  DFFHQX1 C3_1_reg ( .D(T2[6]), .CK(clk), .Q(C3_1) );
  DFFHQX1 C2_1_reg ( .D(C2_2), .CK(clk), .Q(C2_1) );
  DFFHQX1 \X_r4_reg[4]  ( .D(X_r3[4]), .CK(clk), .Q(X_r4[4]) );
  DFFHQX1 \X_r4_reg[6]  ( .D(X_r3[6]), .CK(clk), .Q(X_r4[6]) );
  DFFHQX1 \X_r4_reg[7]  ( .D(X_r3[7]), .CK(clk), .Q(X_r4[7]) );
  DFFHQX1 \X_r4_reg[5]  ( .D(X_r3[5]), .CK(clk), .Q(X_r4[5]) );
  DFFHQX1 C0_0_reg ( .D(C0_0_d), .CK(clk), .Q(C[0]) );
  DFFHQX1 C3_0_reg ( .D(C3_1), .CK(clk), .Q(C[3]) );
  DFFHQX1 C2_0_reg ( .D(C2_1), .CK(clk), .Q(C[2]) );
  DFFHQX1 C1_0_reg ( .D(C1_1), .CK(clk), .Q(C[1]) );
  DFFHQX1 \X_r4_reg[3]  ( .D(X_r3[3]), .CK(clk), .Q(X_r4[3]) );
  DFFHQX1 \X_r4_reg[2]  ( .D(X_r3[2]), .CK(clk), .Q(X_r4[2]) );
  DFFHQX1 \X_r4_reg[1]  ( .D(X_r3[1]), .CK(clk), .Q(X_r4[1]) );
  DFFHQX1 \X_r4_reg[0]  ( .D(X_r3[0]), .CK(clk), .Q(X_r4[0]) );
  NOR2X1 U7 ( .A(n2), .B(n3), .Y(T3[7]) );
  XOR2X1 U8 ( .A(C3_1), .B(C2_1), .Y(T3[4]) );
  OAI2BB1X1 U9 ( .A0N(C1_1), .A1N(T3[4]), .B0(n1), .Y(T3[5]) );
  INVX2 U10 ( .A(T3[7]), .Y(n1) );
  INVX2 U11 ( .A(C2_1), .Y(n3) );
  INVX2 U12 ( .A(C3_1), .Y(n2) );
  XOR2X1 U13 ( .A(T2[6]), .B(C2_2), .Y(T2[5]) );
  XOR2X1 U14 ( .A(C2_1), .B(C1_1), .Y(T3[3]) );
  AND2X1 U15 ( .A(C2_2), .B(T2[6]), .Y(T2[7]) );
  AOI2BB1X1 U16 ( .A0N(n3), .A1N(C1_1), .B0(n2), .Y(T3[6]) );
endmodule


module CPR_0 ( Operator, Threshold, Result );
  input [7:0] Operator;
  input [7:0] Threshold;
  output Result;
  wire   N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22;
  assign Result = N0;

  INVX2 U1 ( .A(Threshold[4]), .Y(n13) );
  INVX2 U2 ( .A(n7), .Y(n18) );
  INVX2 U3 ( .A(n8), .Y(n21) );
  INVX2 U4 ( .A(Threshold[5]), .Y(n14) );
  INVX2 U5 ( .A(Operator[3]), .Y(n17) );
  INVX2 U6 ( .A(Operator[7]), .Y(n20) );
  INVX2 U7 ( .A(Operator[2]), .Y(n16) );
  INVX2 U8 ( .A(Operator[6]), .Y(n19) );
  INVX2 U9 ( .A(Operator[0]), .Y(n15) );
  INVX2 U10 ( .A(Threshold[1]), .Y(n22) );
  AND2X1 U11 ( .A(Threshold[3]), .B(n17), .Y(n1) );
  AOI21X1 U12 ( .A0(Threshold[2]), .A1(n16), .B0(n1), .Y(n2) );
  OAI32X1 U13 ( .A0(n16), .A1(Threshold[2]), .A2(n1), .B0(Threshold[3]), .B1(
        n17), .Y(n4) );
  OR2X1 U14 ( .A(n14), .B(Operator[5]), .Y(n6) );
  OAI221X1 U15 ( .A0(Operator[4]), .A1(n13), .B0(n2), .B1(n4), .C0(n6), .Y(n12) );
  AOI2BB2X1 U16 ( .B0(Threshold[0]), .B1(n15), .A0N(n22), .A1N(Operator[1]), 
        .Y(n3) );
  AOI211X1 U17 ( .A0(Operator[1]), .A1(n22), .B0(n4), .C0(n3), .Y(n11) );
  AND2X1 U18 ( .A(Threshold[7]), .B(n20), .Y(n5) );
  AOI21X1 U19 ( .A0(Threshold[6]), .A1(n19), .B0(n5), .Y(n8) );
  OAI32X1 U20 ( .A0(n19), .A1(Threshold[6]), .A2(n5), .B0(Threshold[7]), .B1(
        n20), .Y(n9) );
  AOI32X1 U21 ( .A0(Operator[4]), .A1(n13), .A2(n6), .B0(n14), .B1(Operator[5]), .Y(n7) );
  OAI22X1 U22 ( .A0(n9), .A1(n18), .B0(n8), .B1(n9), .Y(n10) );
  OAI31X1 U23 ( .A0(n12), .A1(n11), .A2(n21), .B0(n10), .Y(N0) );
endmodule


module CPR_1 ( Operator, Threshold, Result );
  input [7:0] Operator;
  input [7:0] Threshold;
  output Result;
  wire   N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22;
  assign Result = N0;

  INVX2 U1 ( .A(n7), .Y(n21) );
  INVX2 U2 ( .A(n8), .Y(n19) );
  INVX2 U3 ( .A(Threshold[5]), .Y(n13) );
  INVX2 U4 ( .A(Operator[7]), .Y(n18) );
  INVX2 U5 ( .A(Operator[6]), .Y(n17) );
  INVX2 U6 ( .A(Operator[3]), .Y(n16) );
  INVX2 U7 ( .A(Operator[2]), .Y(n15) );
  INVX2 U8 ( .A(Operator[0]), .Y(n14) );
  INVX2 U9 ( .A(Threshold[4]), .Y(n20) );
  INVX2 U10 ( .A(Threshold[1]), .Y(n22) );
  AND2X1 U11 ( .A(Threshold[3]), .B(n16), .Y(n1) );
  AOI21X1 U12 ( .A0(Threshold[2]), .A1(n15), .B0(n1), .Y(n2) );
  OAI32X1 U13 ( .A0(n15), .A1(Threshold[2]), .A2(n1), .B0(Threshold[3]), .B1(
        n16), .Y(n4) );
  OR2X1 U14 ( .A(n13), .B(Operator[5]), .Y(n6) );
  OAI221X1 U15 ( .A0(Operator[4]), .A1(n20), .B0(n2), .B1(n4), .C0(n6), .Y(n12) );
  AOI2BB2X1 U16 ( .B0(Threshold[0]), .B1(n14), .A0N(n22), .A1N(Operator[1]), 
        .Y(n3) );
  AOI211X1 U17 ( .A0(Operator[1]), .A1(n22), .B0(n4), .C0(n3), .Y(n11) );
  AND2X1 U18 ( .A(Threshold[7]), .B(n18), .Y(n5) );
  AOI21X1 U19 ( .A0(Threshold[6]), .A1(n17), .B0(n5), .Y(n8) );
  OAI32X1 U20 ( .A0(n17), .A1(Threshold[6]), .A2(n5), .B0(Threshold[7]), .B1(
        n18), .Y(n9) );
  AOI32X1 U21 ( .A0(Operator[4]), .A1(n20), .A2(n6), .B0(n13), .B1(Operator[5]), .Y(n7) );
  OAI22X1 U22 ( .A0(n9), .A1(n21), .B0(n8), .B1(n9), .Y(n10) );
  OAI31X1 U23 ( .A0(n12), .A1(n11), .A2(n19), .B0(n10), .Y(N0) );
endmodule


module CPR_2 ( Operator, Threshold, Result );
  input [7:0] Operator;
  input [7:0] Threshold;
  output Result;
  wire   N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22;
  assign Result = N0;

  INVX2 U1 ( .A(n8), .Y(n18) );
  INVX2 U2 ( .A(Operator[7]), .Y(n17) );
  INVX2 U3 ( .A(n7), .Y(n22) );
  INVX2 U4 ( .A(Operator[6]), .Y(n16) );
  INVX2 U5 ( .A(Operator[0]), .Y(n13) );
  INVX2 U6 ( .A(Operator[2]), .Y(n14) );
  INVX2 U7 ( .A(Operator[3]), .Y(n15) );
  INVX2 U8 ( .A(Threshold[4]), .Y(n21) );
  INVX2 U9 ( .A(Threshold[1]), .Y(n20) );
  INVX2 U10 ( .A(Threshold[5]), .Y(n19) );
  AND2X1 U11 ( .A(Threshold[3]), .B(n15), .Y(n1) );
  AOI21X1 U12 ( .A0(Threshold[2]), .A1(n14), .B0(n1), .Y(n2) );
  OAI32X1 U13 ( .A0(n14), .A1(Threshold[2]), .A2(n1), .B0(Threshold[3]), .B1(
        n15), .Y(n4) );
  OR2X1 U14 ( .A(n19), .B(Operator[5]), .Y(n6) );
  OAI221X1 U15 ( .A0(Operator[4]), .A1(n21), .B0(n2), .B1(n4), .C0(n6), .Y(n12) );
  AOI2BB2X1 U16 ( .B0(Threshold[0]), .B1(n13), .A0N(n20), .A1N(Operator[1]), 
        .Y(n3) );
  AOI211X1 U17 ( .A0(Operator[1]), .A1(n20), .B0(n4), .C0(n3), .Y(n11) );
  AND2X1 U18 ( .A(Threshold[7]), .B(n17), .Y(n5) );
  AOI21X1 U19 ( .A0(Threshold[6]), .A1(n16), .B0(n5), .Y(n8) );
  OAI32X1 U20 ( .A0(n16), .A1(Threshold[6]), .A2(n5), .B0(Threshold[7]), .B1(
        n17), .Y(n9) );
  AOI32X1 U21 ( .A0(Operator[4]), .A1(n21), .A2(n6), .B0(n19), .B1(Operator[5]), .Y(n7) );
  OAI22X1 U22 ( .A0(n9), .A1(n22), .B0(n8), .B1(n9), .Y(n10) );
  OAI31X1 U23 ( .A0(n12), .A1(n11), .A2(n18), .B0(n10), .Y(N0) );
endmodule


module CPR_3 ( Operator, Threshold, Result );
  input [7:0] Operator;
  input [7:0] Threshold;
  output Result;
  wire   N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22;
  assign Result = N0;

  INVX2 U1 ( .A(n8), .Y(n22) );
  INVX2 U2 ( .A(n7), .Y(n20) );
  INVX2 U3 ( .A(Operator[6]), .Y(n16) );
  INVX2 U4 ( .A(Operator[7]), .Y(n17) );
  INVX2 U5 ( .A(Operator[0]), .Y(n13) );
  INVX2 U6 ( .A(Operator[2]), .Y(n14) );
  INVX2 U7 ( .A(Operator[3]), .Y(n15) );
  INVX2 U8 ( .A(Threshold[4]), .Y(n19) );
  INVX2 U9 ( .A(Threshold[1]), .Y(n21) );
  INVX2 U10 ( .A(Threshold[5]), .Y(n18) );
  AND2X1 U11 ( .A(Threshold[3]), .B(n15), .Y(n1) );
  AOI21X1 U12 ( .A0(Threshold[2]), .A1(n14), .B0(n1), .Y(n2) );
  OAI32X1 U13 ( .A0(n14), .A1(Threshold[2]), .A2(n1), .B0(Threshold[3]), .B1(
        n15), .Y(n4) );
  OR2X1 U14 ( .A(n18), .B(Operator[5]), .Y(n6) );
  OAI221X1 U15 ( .A0(Operator[4]), .A1(n19), .B0(n2), .B1(n4), .C0(n6), .Y(n12) );
  AOI2BB2X1 U16 ( .B0(Threshold[0]), .B1(n13), .A0N(n21), .A1N(Operator[1]), 
        .Y(n3) );
  AOI211X1 U17 ( .A0(Operator[1]), .A1(n21), .B0(n4), .C0(n3), .Y(n11) );
  AND2X1 U18 ( .A(Threshold[7]), .B(n17), .Y(n5) );
  AOI21X1 U19 ( .A0(Threshold[6]), .A1(n16), .B0(n5), .Y(n8) );
  OAI32X1 U20 ( .A0(n16), .A1(Threshold[6]), .A2(n5), .B0(Threshold[7]), .B1(
        n17), .Y(n9) );
  AOI32X1 U21 ( .A0(Operator[4]), .A1(n19), .A2(n6), .B0(n18), .B1(Operator[5]), .Y(n7) );
  OAI22X1 U22 ( .A0(n9), .A1(n20), .B0(n8), .B1(n9), .Y(n10) );
  OAI31X1 U23 ( .A0(n12), .A1(n11), .A2(n22), .B0(n10), .Y(N0) );
endmodule


module FIR ( clk, Xin, B0, B1, B2, B3, B4, B5, B6, Yout );
  input [7:0] Xin;
  input [7:0] B0;
  input [7:0] B1;
  input [7:0] B2;
  input [7:0] B3;
  input [7:0] B4;
  input [7:0] B5;
  input [7:0] B6;
  output [7:0] Yout;
  input clk;

  wire   [15:0] Reg1_d;
  wire   [15:0] Reg1;
  wire   [15:0] U2_out;
  wire   [15:0] Reg2_d;
  wire   [15:0] Reg2;
  wire   [15:0] U3_out;
  wire   [15:0] Reg3_d;
  wire   [15:0] Reg3;
  wire   [15:0] U4_out;
  wire   [15:0] Reg4_d;
  wire   [15:0] Reg4;
  wire   [15:0] U5_out;
  wire   [15:0] Reg5_d;
  wire   [15:0] Reg5;
  wire   [15:0] U6_out;
  wire   [15:0] Reg6_d;
  wire   [15:0] Reg6;
  wire   [15:0] U7_out;
  wire   [15:0] Reg7_d;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14;

  MUL_6 U1 ( .Multiplicand(Xin), .Multiplier(B6), .Product({Reg1_d[15:1], 
        SYNOPSYS_UNCONNECTED__0}) );
  MUL_5 U2 ( .Multiplicand(Xin), .Multiplier(B5), .Product({U2_out[15:1], 
        SYNOPSYS_UNCONNECTED__1}) );
  ADD_5 U8 ( .Addend1({1'b0, U2_out[15:1]}), .Addend2({1'b0, Reg1[14:0]}), 
        .Sum(Reg2_d) );
  MUL_4 U3 ( .Multiplicand(Xin), .Multiplier(B4), .Product({U3_out[15:1], 
        SYNOPSYS_UNCONNECTED__2}) );
  ADD_4 U9 ( .Addend1({1'b0, U3_out[15:1]}), .Addend2(Reg2), .Sum(Reg3_d) );
  MUL_3 U4 ( .Multiplicand(Xin), .Multiplier(B3), .Product({U4_out[15:1], 
        SYNOPSYS_UNCONNECTED__3}) );
  ADD_3 U10 ( .Addend1({1'b0, U4_out[15:1]}), .Addend2(Reg3), .Sum(Reg4_d) );
  MUL_2 U5 ( .Multiplicand(Xin), .Multiplier(B2), .Product({U5_out[15:1], 
        SYNOPSYS_UNCONNECTED__4}) );
  ADD_2 U11 ( .Addend1({1'b0, U5_out[15:1]}), .Addend2(Reg4), .Sum(Reg5_d) );
  MUL_1 U6 ( .Multiplicand(Xin), .Multiplier(B1), .Product({U6_out[15:1], 
        SYNOPSYS_UNCONNECTED__5}) );
  ADD_1 U12 ( .Addend1({1'b0, U6_out[15:1]}), .Addend2(Reg5), .Sum(Reg6_d) );
  MUL_0 U7 ( .Multiplicand(Xin), .Multiplier(B0), .Product({U7_out[15:1], 
        SYNOPSYS_UNCONNECTED__6}) );
  ADD_0 U13 ( .Addend1({1'b0, U7_out[15:1]}), .Addend2(Reg6), .Sum({
        Reg7_d[15:8], SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14}) );
  DFFHQX1 \Reg7_reg[9]  ( .D(Reg7_d[9]), .CK(clk), .Q(Yout[1]) );
  DFFHQX1 \Reg7_reg[11]  ( .D(Reg7_d[11]), .CK(clk), .Q(Yout[3]) );
  DFFHQX1 \Reg7_reg[10]  ( .D(Reg7_d[10]), .CK(clk), .Q(Yout[2]) );
  DFFHQX1 \Reg7_reg[8]  ( .D(Reg7_d[8]), .CK(clk), .Q(Yout[0]) );
  DFFHQX1 \Reg2_reg[15]  ( .D(Reg2_d[15]), .CK(clk), .Q(Reg2[15]) );
  DFFHQX1 \Reg3_reg[15]  ( .D(Reg3_d[15]), .CK(clk), .Q(Reg3[15]) );
  DFFHQX1 \Reg4_reg[15]  ( .D(Reg4_d[15]), .CK(clk), .Q(Reg4[15]) );
  DFFHQX1 \Reg5_reg[15]  ( .D(Reg5_d[15]), .CK(clk), .Q(Reg5[15]) );
  DFFHQX1 \Reg6_reg[15]  ( .D(Reg6_d[15]), .CK(clk), .Q(Reg6[15]) );
  DFFHQX1 \Reg1_reg[14]  ( .D(Reg1_d[15]), .CK(clk), .Q(Reg1[14]) );
  DFFHQX1 \Reg7_reg[15]  ( .D(Reg7_d[15]), .CK(clk), .Q(Yout[7]) );
  DFFHQX1 \Reg2_reg[14]  ( .D(Reg2_d[14]), .CK(clk), .Q(Reg2[14]) );
  DFFHQX1 \Reg3_reg[14]  ( .D(Reg3_d[14]), .CK(clk), .Q(Reg3[14]) );
  DFFHQX1 \Reg4_reg[14]  ( .D(Reg4_d[14]), .CK(clk), .Q(Reg4[14]) );
  DFFHQX1 \Reg5_reg[14]  ( .D(Reg5_d[14]), .CK(clk), .Q(Reg5[14]) );
  DFFHQX1 \Reg6_reg[14]  ( .D(Reg6_d[14]), .CK(clk), .Q(Reg6[14]) );
  DFFHQX1 \Reg7_reg[14]  ( .D(Reg7_d[14]), .CK(clk), .Q(Yout[6]) );
  DFFHQX1 \Reg7_reg[13]  ( .D(Reg7_d[13]), .CK(clk), .Q(Yout[5]) );
  DFFHQX1 \Reg7_reg[12]  ( .D(Reg7_d[12]), .CK(clk), .Q(Yout[4]) );
  DFFHQX1 \Reg1_reg[13]  ( .D(Reg1_d[14]), .CK(clk), .Q(Reg1[13]) );
  DFFHQX1 \Reg2_reg[13]  ( .D(Reg2_d[13]), .CK(clk), .Q(Reg2[13]) );
  DFFHQX1 \Reg3_reg[13]  ( .D(Reg3_d[13]), .CK(clk), .Q(Reg3[13]) );
  DFFHQX1 \Reg4_reg[13]  ( .D(Reg4_d[13]), .CK(clk), .Q(Reg4[13]) );
  DFFHQX1 \Reg5_reg[13]  ( .D(Reg5_d[13]), .CK(clk), .Q(Reg5[13]) );
  DFFHQX1 \Reg6_reg[13]  ( .D(Reg6_d[13]), .CK(clk), .Q(Reg6[13]) );
  DFFHQX1 \Reg1_reg[12]  ( .D(Reg1_d[13]), .CK(clk), .Q(Reg1[12]) );
  DFFHQX1 \Reg2_reg[12]  ( .D(Reg2_d[12]), .CK(clk), .Q(Reg2[12]) );
  DFFHQX1 \Reg3_reg[12]  ( .D(Reg3_d[12]), .CK(clk), .Q(Reg3[12]) );
  DFFHQX1 \Reg4_reg[12]  ( .D(Reg4_d[12]), .CK(clk), .Q(Reg4[12]) );
  DFFHQX1 \Reg5_reg[12]  ( .D(Reg5_d[12]), .CK(clk), .Q(Reg5[12]) );
  DFFHQX1 \Reg6_reg[12]  ( .D(Reg6_d[12]), .CK(clk), .Q(Reg6[12]) );
  DFFHQX1 \Reg1_reg[11]  ( .D(Reg1_d[12]), .CK(clk), .Q(Reg1[11]) );
  DFFHQX1 \Reg2_reg[11]  ( .D(Reg2_d[11]), .CK(clk), .Q(Reg2[11]) );
  DFFHQX1 \Reg3_reg[11]  ( .D(Reg3_d[11]), .CK(clk), .Q(Reg3[11]) );
  DFFHQX1 \Reg4_reg[11]  ( .D(Reg4_d[11]), .CK(clk), .Q(Reg4[11]) );
  DFFHQX1 \Reg5_reg[11]  ( .D(Reg5_d[11]), .CK(clk), .Q(Reg5[11]) );
  DFFHQX1 \Reg6_reg[11]  ( .D(Reg6_d[11]), .CK(clk), .Q(Reg6[11]) );
  DFFHQX1 \Reg1_reg[10]  ( .D(Reg1_d[11]), .CK(clk), .Q(Reg1[10]) );
  DFFHQX1 \Reg2_reg[10]  ( .D(Reg2_d[10]), .CK(clk), .Q(Reg2[10]) );
  DFFHQX1 \Reg3_reg[10]  ( .D(Reg3_d[10]), .CK(clk), .Q(Reg3[10]) );
  DFFHQX1 \Reg4_reg[10]  ( .D(Reg4_d[10]), .CK(clk), .Q(Reg4[10]) );
  DFFHQX1 \Reg5_reg[10]  ( .D(Reg5_d[10]), .CK(clk), .Q(Reg5[10]) );
  DFFHQX1 \Reg6_reg[10]  ( .D(Reg6_d[10]), .CK(clk), .Q(Reg6[10]) );
  DFFHQX1 \Reg1_reg[9]  ( .D(Reg1_d[10]), .CK(clk), .Q(Reg1[9]) );
  DFFHQX1 \Reg2_reg[9]  ( .D(Reg2_d[9]), .CK(clk), .Q(Reg2[9]) );
  DFFHQX1 \Reg3_reg[9]  ( .D(Reg3_d[9]), .CK(clk), .Q(Reg3[9]) );
  DFFHQX1 \Reg4_reg[9]  ( .D(Reg4_d[9]), .CK(clk), .Q(Reg4[9]) );
  DFFHQX1 \Reg5_reg[9]  ( .D(Reg5_d[9]), .CK(clk), .Q(Reg5[9]) );
  DFFHQX1 \Reg6_reg[9]  ( .D(Reg6_d[9]), .CK(clk), .Q(Reg6[9]) );
  DFFHQX1 \Reg1_reg[8]  ( .D(Reg1_d[9]), .CK(clk), .Q(Reg1[8]) );
  DFFHQX1 \Reg2_reg[8]  ( .D(Reg2_d[8]), .CK(clk), .Q(Reg2[8]) );
  DFFHQX1 \Reg3_reg[8]  ( .D(Reg3_d[8]), .CK(clk), .Q(Reg3[8]) );
  DFFHQX1 \Reg4_reg[8]  ( .D(Reg4_d[8]), .CK(clk), .Q(Reg4[8]) );
  DFFHQX1 \Reg5_reg[8]  ( .D(Reg5_d[8]), .CK(clk), .Q(Reg5[8]) );
  DFFHQX1 \Reg6_reg[8]  ( .D(Reg6_d[8]), .CK(clk), .Q(Reg6[8]) );
  DFFHQX1 \Reg6_reg[7]  ( .D(Reg6_d[7]), .CK(clk), .Q(Reg6[7]) );
  DFFHQX1 \Reg1_reg[7]  ( .D(Reg1_d[8]), .CK(clk), .Q(Reg1[7]) );
  DFFHQX1 \Reg2_reg[7]  ( .D(Reg2_d[7]), .CK(clk), .Q(Reg2[7]) );
  DFFHQX1 \Reg3_reg[7]  ( .D(Reg3_d[7]), .CK(clk), .Q(Reg3[7]) );
  DFFHQX1 \Reg4_reg[7]  ( .D(Reg4_d[7]), .CK(clk), .Q(Reg4[7]) );
  DFFHQX1 \Reg5_reg[7]  ( .D(Reg5_d[7]), .CK(clk), .Q(Reg5[7]) );
  DFFHQX1 \Reg6_reg[6]  ( .D(Reg6_d[6]), .CK(clk), .Q(Reg6[6]) );
  DFFHQX1 \Reg1_reg[6]  ( .D(Reg1_d[7]), .CK(clk), .Q(Reg1[6]) );
  DFFHQX1 \Reg2_reg[6]  ( .D(Reg2_d[6]), .CK(clk), .Q(Reg2[6]) );
  DFFHQX1 \Reg3_reg[6]  ( .D(Reg3_d[6]), .CK(clk), .Q(Reg3[6]) );
  DFFHQX1 \Reg4_reg[6]  ( .D(Reg4_d[6]), .CK(clk), .Q(Reg4[6]) );
  DFFHQX1 \Reg5_reg[6]  ( .D(Reg5_d[6]), .CK(clk), .Q(Reg5[6]) );
  DFFHQX1 \Reg6_reg[5]  ( .D(Reg6_d[5]), .CK(clk), .Q(Reg6[5]) );
  DFFHQX1 \Reg1_reg[5]  ( .D(Reg1_d[6]), .CK(clk), .Q(Reg1[5]) );
  DFFHQX1 \Reg2_reg[5]  ( .D(Reg2_d[5]), .CK(clk), .Q(Reg2[5]) );
  DFFHQX1 \Reg3_reg[5]  ( .D(Reg3_d[5]), .CK(clk), .Q(Reg3[5]) );
  DFFHQX1 \Reg4_reg[5]  ( .D(Reg4_d[5]), .CK(clk), .Q(Reg4[5]) );
  DFFHQX1 \Reg5_reg[5]  ( .D(Reg5_d[5]), .CK(clk), .Q(Reg5[5]) );
  DFFHQX1 \Reg1_reg[4]  ( .D(Reg1_d[5]), .CK(clk), .Q(Reg1[4]) );
  DFFHQX1 \Reg6_reg[4]  ( .D(Reg6_d[4]), .CK(clk), .Q(Reg6[4]) );
  DFFHQX1 \Reg2_reg[4]  ( .D(Reg2_d[4]), .CK(clk), .Q(Reg2[4]) );
  DFFHQX1 \Reg3_reg[4]  ( .D(Reg3_d[4]), .CK(clk), .Q(Reg3[4]) );
  DFFHQX1 \Reg4_reg[4]  ( .D(Reg4_d[4]), .CK(clk), .Q(Reg4[4]) );
  DFFHQX1 \Reg5_reg[4]  ( .D(Reg5_d[4]), .CK(clk), .Q(Reg5[4]) );
  DFFHQX1 \Reg1_reg[3]  ( .D(Reg1_d[4]), .CK(clk), .Q(Reg1[3]) );
  DFFHQX1 \Reg6_reg[3]  ( .D(Reg6_d[3]), .CK(clk), .Q(Reg6[3]) );
  DFFHQX1 \Reg2_reg[3]  ( .D(Reg2_d[3]), .CK(clk), .Q(Reg2[3]) );
  DFFHQX1 \Reg3_reg[3]  ( .D(Reg3_d[3]), .CK(clk), .Q(Reg3[3]) );
  DFFHQX1 \Reg4_reg[3]  ( .D(Reg4_d[3]), .CK(clk), .Q(Reg4[3]) );
  DFFHQX1 \Reg5_reg[3]  ( .D(Reg5_d[3]), .CK(clk), .Q(Reg5[3]) );
  DFFHQX1 \Reg1_reg[2]  ( .D(Reg1_d[3]), .CK(clk), .Q(Reg1[2]) );
  DFFHQX1 \Reg2_reg[2]  ( .D(Reg2_d[2]), .CK(clk), .Q(Reg2[2]) );
  DFFHQX1 \Reg3_reg[2]  ( .D(Reg3_d[2]), .CK(clk), .Q(Reg3[2]) );
  DFFHQX1 \Reg4_reg[2]  ( .D(Reg4_d[2]), .CK(clk), .Q(Reg4[2]) );
  DFFHQX1 \Reg5_reg[2]  ( .D(Reg5_d[2]), .CK(clk), .Q(Reg5[2]) );
  DFFHQX1 \Reg6_reg[2]  ( .D(Reg6_d[2]), .CK(clk), .Q(Reg6[2]) );
  DFFHQX1 \Reg1_reg[1]  ( .D(Reg1_d[2]), .CK(clk), .Q(Reg1[1]) );
  DFFHQX1 \Reg1_reg[0]  ( .D(Reg1_d[1]), .CK(clk), .Q(Reg1[0]) );
  DFFHQX1 \Reg2_reg[1]  ( .D(Reg2_d[1]), .CK(clk), .Q(Reg2[1]) );
  DFFHQX1 \Reg3_reg[1]  ( .D(Reg3_d[1]), .CK(clk), .Q(Reg3[1]) );
  DFFHQX1 \Reg4_reg[1]  ( .D(Reg4_d[1]), .CK(clk), .Q(Reg4[1]) );
  DFFHQX1 \Reg5_reg[1]  ( .D(Reg5_d[1]), .CK(clk), .Q(Reg5[1]) );
  DFFHQX1 \Reg2_reg[0]  ( .D(Reg2_d[0]), .CK(clk), .Q(Reg2[0]) );
  DFFHQX1 \Reg3_reg[0]  ( .D(Reg3_d[0]), .CK(clk), .Q(Reg3[0]) );
  DFFHQX1 \Reg4_reg[0]  ( .D(Reg4_d[0]), .CK(clk), .Q(Reg4[0]) );
  DFFHQX1 \Reg5_reg[0]  ( .D(Reg5_d[0]), .CK(clk), .Q(Reg5[0]) );
  DFFHQX1 \Reg6_reg[0]  ( .D(Reg6_d[0]), .CK(clk), .Q(Reg6[0]) );
  DFFHQX1 \Reg6_reg[1]  ( .D(Reg6_d[1]), .CK(clk), .Q(Reg6[1]) );
endmodule


module ADD_0 ( Addend1, Addend2, Sum );
  input [15:0] Addend1;
  input [15:0] Addend2;
  output [15:0] Sum;


  ADD_0_DW01_add_0_DW01_add_48 add_8 ( .A(Addend1), .B(Addend2), .CI(1'b0), 
        .SUM(Sum) );
endmodule


module ADD_0_DW01_add_0_DW01_add_48 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [15:1] carry;

  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  XOR3X2 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .Y(SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  OAI2BB1X1 U1 ( .A0N(A[7]), .A1N(n1), .B0(n2), .Y(carry[8]) );
  OAI21X1 U2 ( .A0(A[7]), .A1(n1), .B0(B[7]), .Y(n2) );
  OAI2BB1X1 U3 ( .A0N(A[6]), .A1N(n3), .B0(n4), .Y(n1) );
  OAI21X1 U4 ( .A0(A[6]), .A1(n3), .B0(B[6]), .Y(n4) );
  OAI2BB1X1 U5 ( .A0N(A[5]), .A1N(n5), .B0(n6), .Y(n3) );
  OAI21X1 U6 ( .A0(A[5]), .A1(n5), .B0(B[5]), .Y(n6) );
  OAI2BB1X1 U7 ( .A0N(A[4]), .A1N(n7), .B0(n8), .Y(n5) );
  OAI21X1 U8 ( .A0(A[4]), .A1(n7), .B0(B[4]), .Y(n8) );
  OAI2BB1X1 U9 ( .A0N(A[3]), .A1N(n9), .B0(n10), .Y(n7) );
  OAI21X1 U10 ( .A0(A[3]), .A1(n9), .B0(B[3]), .Y(n10) );
  OAI2BB1X1 U11 ( .A0N(A[2]), .A1N(n11), .B0(n12), .Y(n9) );
  OAI21X1 U12 ( .A0(A[2]), .A1(n11), .B0(B[2]), .Y(n12) );
  OAI2BB1X1 U13 ( .A0N(B[1]), .A1N(A[1]), .B0(n13), .Y(n11) );
  OAI211X1 U14 ( .A0(A[1]), .A1(B[1]), .B0(A[0]), .C0(B[0]), .Y(n13) );
endmodule


module MUL_0 ( Multiplicand, Multiplier, Product );
  input [7:0] Multiplicand;
  input [7:0] Multiplier;
  output [15:0] Product;


  MUL_0_DW_mult_uns_0_DW_mult_uns_5 mult_7 ( .a(Multiplicand), .b(Multiplier), 
        .product(Product) );
endmodule


module MUL_0_DW_mult_uns_0_DW_mult_uns_5 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(a[0]), .Y(n200) );
  INVX2 U127 ( .A(a[2]), .Y(n202) );
  INVX2 U128 ( .A(a[3]), .Y(n203) );
  INVX2 U129 ( .A(a[1]), .Y(n201) );
  INVX2 U130 ( .A(a[4]), .Y(n204) );
  INVX2 U131 ( .A(a[5]), .Y(n205) );
  INVX2 U132 ( .A(a[6]), .Y(n206) );
  INVX2 U133 ( .A(a[7]), .Y(n207) );
  INVX2 U134 ( .A(b[4]), .Y(n211) );
  INVX2 U135 ( .A(b[3]), .Y(n212) );
  INVX2 U136 ( .A(b[2]), .Y(n213) );
  INVX2 U137 ( .A(b[0]), .Y(n215) );
  INVX2 U138 ( .A(b[1]), .Y(n214) );
  INVX2 U139 ( .A(b[6]), .Y(n209) );
  INVX2 U140 ( .A(b[5]), .Y(n210) );
  INVX2 U141 ( .A(b[7]), .Y(n208) );
  NOR2X1 U142 ( .A(n200), .B(n215), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n214), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n213), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n212), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n211), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n210), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n209), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n208), .Y(n93) );
  NOR2X1 U150 ( .A(n215), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n214), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n213), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n212), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n211), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n210), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n209), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n208), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n214), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n213), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n212), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n211), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n210), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n209), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n208), .Y(n141) );
  NOR2X1 U165 ( .A(n215), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n214), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n213), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n212), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n211), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n210), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n209), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n208), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n215), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n214), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n213), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n212), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n211), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n210), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n209), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n208), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n215), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n214), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n213), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n212), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n211), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n210), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n209), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n208), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n215), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n214), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n213), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n212), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n211), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n210), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n209), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n208), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n215), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n214), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n213), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n212), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n211), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n210), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n209), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n208), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n215), .B(n206), .Y(n100) );
endmodule


module ADD_1 ( Addend1, Addend2, Sum );
  input [15:0] Addend1;
  input [15:0] Addend2;
  output [15:0] Sum;


  ADD_1_DW01_add_0_DW01_add_49 add_8 ( .A(Addend1), .B(Addend2), .CI(1'b0), 
        .SUM(Sum) );
endmodule


module ADD_1_DW01_add_0_DW01_add_49 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:1] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  XOR3X2 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .Y(SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module MUL_1 ( Multiplicand, Multiplier, Product );
  input [7:0] Multiplicand;
  input [7:0] Multiplier;
  output [15:0] Product;


  MUL_1_DW_mult_uns_0_DW_mult_uns_4 mult_7 ( .a(Multiplicand), .b(Multiplier), 
        .product(Product) );
endmodule


module MUL_1_DW_mult_uns_0_DW_mult_uns_4 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(a[0]), .Y(n200) );
  INVX2 U127 ( .A(a[2]), .Y(n202) );
  INVX2 U128 ( .A(a[3]), .Y(n203) );
  INVX2 U129 ( .A(a[1]), .Y(n201) );
  INVX2 U130 ( .A(a[4]), .Y(n204) );
  INVX2 U131 ( .A(a[5]), .Y(n205) );
  INVX2 U132 ( .A(a[6]), .Y(n206) );
  INVX2 U133 ( .A(a[7]), .Y(n207) );
  INVX2 U134 ( .A(b[4]), .Y(n211) );
  INVX2 U135 ( .A(b[3]), .Y(n212) );
  INVX2 U136 ( .A(b[2]), .Y(n213) );
  INVX2 U137 ( .A(b[0]), .Y(n215) );
  INVX2 U138 ( .A(b[1]), .Y(n214) );
  INVX2 U139 ( .A(b[6]), .Y(n209) );
  INVX2 U140 ( .A(b[5]), .Y(n210) );
  INVX2 U141 ( .A(b[7]), .Y(n208) );
  NOR2X1 U142 ( .A(n200), .B(n215), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n214), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n213), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n212), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n211), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n210), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n209), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n208), .Y(n93) );
  NOR2X1 U150 ( .A(n215), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n214), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n213), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n212), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n211), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n210), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n209), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n208), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n214), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n213), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n212), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n211), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n210), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n209), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n208), .Y(n141) );
  NOR2X1 U165 ( .A(n215), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n214), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n213), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n212), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n211), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n210), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n209), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n208), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n215), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n214), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n213), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n212), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n211), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n210), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n209), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n208), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n215), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n214), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n213), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n212), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n211), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n210), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n209), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n208), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n215), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n214), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n213), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n212), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n211), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n210), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n209), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n208), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n215), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n214), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n213), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n212), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n211), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n210), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n209), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n208), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n215), .B(n206), .Y(n100) );
endmodule


module ADD_2 ( Addend1, Addend2, Sum );
  input [15:0] Addend1;
  input [15:0] Addend2;
  output [15:0] Sum;


  ADD_2_DW01_add_0_DW01_add_50 add_8 ( .A(Addend1), .B(Addend2), .CI(1'b0), 
        .SUM(Sum) );
endmodule


module ADD_2_DW01_add_0_DW01_add_50 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:1] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  XOR3X2 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .Y(SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module MUL_2 ( Multiplicand, Multiplier, Product );
  input [7:0] Multiplicand;
  input [7:0] Multiplier;
  output [15:0] Product;


  MUL_2_DW_mult_uns_0_DW_mult_uns_3 mult_7 ( .a(Multiplicand), .b(Multiplier), 
        .product(Product) );
endmodule


module MUL_2_DW_mult_uns_0_DW_mult_uns_3 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(a[0]), .Y(n200) );
  INVX2 U127 ( .A(a[2]), .Y(n202) );
  INVX2 U128 ( .A(a[3]), .Y(n203) );
  INVX2 U129 ( .A(a[1]), .Y(n201) );
  INVX2 U130 ( .A(a[4]), .Y(n204) );
  INVX2 U131 ( .A(a[5]), .Y(n205) );
  INVX2 U132 ( .A(a[6]), .Y(n206) );
  INVX2 U133 ( .A(a[7]), .Y(n207) );
  INVX2 U134 ( .A(b[4]), .Y(n211) );
  INVX2 U135 ( .A(b[3]), .Y(n212) );
  INVX2 U136 ( .A(b[2]), .Y(n213) );
  INVX2 U137 ( .A(b[0]), .Y(n215) );
  INVX2 U138 ( .A(b[1]), .Y(n214) );
  INVX2 U139 ( .A(b[6]), .Y(n209) );
  INVX2 U140 ( .A(b[5]), .Y(n210) );
  INVX2 U141 ( .A(b[7]), .Y(n208) );
  NOR2X1 U142 ( .A(n200), .B(n215), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n214), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n213), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n212), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n211), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n210), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n209), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n208), .Y(n93) );
  NOR2X1 U150 ( .A(n215), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n214), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n213), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n212), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n211), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n210), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n209), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n208), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n214), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n213), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n212), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n211), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n210), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n209), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n208), .Y(n141) );
  NOR2X1 U165 ( .A(n215), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n214), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n213), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n212), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n211), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n210), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n209), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n208), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n215), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n214), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n213), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n212), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n211), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n210), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n209), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n208), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n215), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n214), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n213), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n212), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n211), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n210), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n209), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n208), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n215), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n214), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n213), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n212), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n211), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n210), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n209), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n208), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n215), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n214), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n213), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n212), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n211), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n210), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n209), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n208), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n215), .B(n206), .Y(n100) );
endmodule


module ADD_3 ( Addend1, Addend2, Sum );
  input [15:0] Addend1;
  input [15:0] Addend2;
  output [15:0] Sum;


  ADD_3_DW01_add_0_DW01_add_51 add_8 ( .A(Addend1), .B(Addend2), .CI(1'b0), 
        .SUM(Sum) );
endmodule


module ADD_3_DW01_add_0_DW01_add_51 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:1] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  XOR3X2 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .Y(SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module MUL_3 ( Multiplicand, Multiplier, Product );
  input [7:0] Multiplicand;
  input [7:0] Multiplier;
  output [15:0] Product;


  MUL_3_DW_mult_uns_0_DW_mult_uns_2 mult_7 ( .a(Multiplicand), .b(Multiplier), 
        .product(Product) );
endmodule


module MUL_3_DW_mult_uns_0_DW_mult_uns_2 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(a[0]), .Y(n200) );
  INVX2 U127 ( .A(a[2]), .Y(n202) );
  INVX2 U128 ( .A(a[3]), .Y(n203) );
  INVX2 U129 ( .A(a[1]), .Y(n201) );
  INVX2 U130 ( .A(a[4]), .Y(n204) );
  INVX2 U131 ( .A(a[5]), .Y(n205) );
  INVX2 U132 ( .A(a[6]), .Y(n206) );
  INVX2 U133 ( .A(a[7]), .Y(n207) );
  INVX2 U134 ( .A(b[4]), .Y(n211) );
  INVX2 U135 ( .A(b[3]), .Y(n212) );
  INVX2 U136 ( .A(b[2]), .Y(n213) );
  INVX2 U137 ( .A(b[0]), .Y(n215) );
  INVX2 U138 ( .A(b[1]), .Y(n214) );
  INVX2 U139 ( .A(b[6]), .Y(n209) );
  INVX2 U140 ( .A(b[5]), .Y(n210) );
  INVX2 U141 ( .A(b[7]), .Y(n208) );
  NOR2X1 U142 ( .A(n200), .B(n215), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n214), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n213), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n212), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n211), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n210), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n209), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n208), .Y(n93) );
  NOR2X1 U150 ( .A(n215), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n214), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n213), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n212), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n211), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n210), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n209), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n208), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n214), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n213), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n212), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n211), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n210), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n209), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n208), .Y(n141) );
  NOR2X1 U165 ( .A(n215), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n214), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n213), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n212), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n211), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n210), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n209), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n208), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n215), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n214), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n213), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n212), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n211), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n210), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n209), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n208), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n215), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n214), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n213), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n212), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n211), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n210), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n209), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n208), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n215), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n214), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n213), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n212), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n211), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n210), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n209), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n208), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n215), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n214), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n213), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n212), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n211), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n210), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n209), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n208), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n215), .B(n206), .Y(n100) );
endmodule


module ADD_4 ( Addend1, Addend2, Sum );
  input [15:0] Addend1;
  input [15:0] Addend2;
  output [15:0] Sum;


  ADD_4_DW01_add_0_DW01_add_52 add_8 ( .A(Addend1), .B(Addend2), .CI(1'b0), 
        .SUM(Sum) );
endmodule


module ADD_4_DW01_add_0_DW01_add_52 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:1] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  XOR3X2 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .Y(SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module MUL_4 ( Multiplicand, Multiplier, Product );
  input [7:0] Multiplicand;
  input [7:0] Multiplier;
  output [15:0] Product;


  MUL_4_DW_mult_uns_0_DW_mult_uns_1 mult_7 ( .a(Multiplicand), .b(Multiplier), 
        .product(Product) );
endmodule


module MUL_4_DW_mult_uns_0_DW_mult_uns_1 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(a[0]), .Y(n200) );
  INVX2 U127 ( .A(a[2]), .Y(n202) );
  INVX2 U128 ( .A(a[3]), .Y(n203) );
  INVX2 U129 ( .A(a[1]), .Y(n201) );
  INVX2 U130 ( .A(a[4]), .Y(n204) );
  INVX2 U131 ( .A(a[5]), .Y(n205) );
  INVX2 U132 ( .A(a[6]), .Y(n206) );
  INVX2 U133 ( .A(a[7]), .Y(n207) );
  INVX2 U134 ( .A(b[4]), .Y(n211) );
  INVX2 U135 ( .A(b[3]), .Y(n212) );
  INVX2 U136 ( .A(b[2]), .Y(n213) );
  INVX2 U137 ( .A(b[0]), .Y(n215) );
  INVX2 U138 ( .A(b[1]), .Y(n214) );
  INVX2 U139 ( .A(b[6]), .Y(n209) );
  INVX2 U140 ( .A(b[5]), .Y(n210) );
  INVX2 U141 ( .A(b[7]), .Y(n208) );
  NOR2X1 U142 ( .A(n200), .B(n215), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n214), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n213), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n212), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n211), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n210), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n209), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n208), .Y(n93) );
  NOR2X1 U150 ( .A(n215), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n214), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n213), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n212), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n211), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n210), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n209), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n208), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n214), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n213), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n212), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n211), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n210), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n209), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n208), .Y(n141) );
  NOR2X1 U165 ( .A(n215), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n214), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n213), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n212), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n211), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n210), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n209), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n208), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n215), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n214), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n213), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n212), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n211), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n210), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n209), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n208), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n215), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n214), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n213), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n212), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n211), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n210), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n209), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n208), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n215), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n214), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n213), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n212), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n211), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n210), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n209), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n208), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n215), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n214), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n213), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n212), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n211), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n210), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n209), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n208), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n215), .B(n206), .Y(n100) );
endmodule


module ADD_5 ( Addend1, Addend2, Sum );
  input [15:0] Addend1;
  input [15:0] Addend2;
  output [15:0] Sum;


  ADD_5_DW01_add_0_DW01_add_53 add_8 ( .A(Addend1), .B(Addend2), .CI(1'b0), 
        .SUM(Sum) );
endmodule


module ADD_5_DW01_add_0_DW01_add_53 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:1] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  XOR3X2 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .Y(SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module MUL_5 ( Multiplicand, Multiplier, Product );
  input [7:0] Multiplicand;
  input [7:0] Multiplier;
  output [15:0] Product;


  MUL_5_DW_mult_uns_0 mult_7 ( .a(Multiplicand), .b(Multiplier), .product(
        Product) );
endmodule


module MUL_5_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(a[0]), .Y(n200) );
  INVX2 U127 ( .A(a[2]), .Y(n202) );
  INVX2 U128 ( .A(a[3]), .Y(n203) );
  INVX2 U129 ( .A(a[1]), .Y(n201) );
  INVX2 U130 ( .A(a[4]), .Y(n204) );
  INVX2 U131 ( .A(a[5]), .Y(n205) );
  INVX2 U132 ( .A(a[6]), .Y(n206) );
  INVX2 U133 ( .A(a[7]), .Y(n207) );
  INVX2 U134 ( .A(b[4]), .Y(n211) );
  INVX2 U135 ( .A(b[3]), .Y(n212) );
  INVX2 U136 ( .A(b[2]), .Y(n213) );
  INVX2 U137 ( .A(b[0]), .Y(n215) );
  INVX2 U138 ( .A(b[1]), .Y(n214) );
  INVX2 U139 ( .A(b[6]), .Y(n209) );
  INVX2 U140 ( .A(b[5]), .Y(n210) );
  INVX2 U141 ( .A(b[7]), .Y(n208) );
  NOR2X1 U142 ( .A(n200), .B(n215), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n214), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n213), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n212), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n211), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n210), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n209), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n208), .Y(n93) );
  NOR2X1 U150 ( .A(n215), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n214), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n213), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n212), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n211), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n210), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n209), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n208), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n214), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n213), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n212), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n211), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n210), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n209), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n208), .Y(n141) );
  NOR2X1 U165 ( .A(n215), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n214), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n213), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n212), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n211), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n210), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n209), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n208), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n215), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n214), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n213), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n212), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n211), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n210), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n209), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n208), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n215), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n214), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n213), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n212), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n211), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n210), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n209), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n208), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n215), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n214), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n213), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n212), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n211), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n210), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n209), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n208), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n215), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n214), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n213), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n212), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n211), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n210), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n209), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n208), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n215), .B(n206), .Y(n100) );
endmodule


module MUL_6 ( Multiplicand, Multiplier, Product );
  input [7:0] Multiplicand;
  input [7:0] Multiplier;
  output [15:0] Product;


  MUL_6_DW_mult_uns_0_DW_mult_uns_6 mult_7 ( .a(Multiplicand), .b(Multiplier), 
        .product(Product) );
endmodule


module MUL_6_DW_mult_uns_0_DW_mult_uns_6 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(a[0]), .Y(n200) );
  INVX2 U127 ( .A(a[2]), .Y(n202) );
  INVX2 U128 ( .A(a[3]), .Y(n203) );
  INVX2 U129 ( .A(a[1]), .Y(n201) );
  INVX2 U130 ( .A(a[4]), .Y(n204) );
  INVX2 U131 ( .A(a[5]), .Y(n205) );
  INVX2 U132 ( .A(a[6]), .Y(n206) );
  INVX2 U133 ( .A(a[7]), .Y(n207) );
  INVX2 U134 ( .A(b[4]), .Y(n211) );
  INVX2 U135 ( .A(b[3]), .Y(n212) );
  INVX2 U136 ( .A(b[2]), .Y(n213) );
  INVX2 U137 ( .A(b[0]), .Y(n215) );
  INVX2 U138 ( .A(b[1]), .Y(n214) );
  INVX2 U139 ( .A(b[6]), .Y(n209) );
  INVX2 U140 ( .A(b[5]), .Y(n210) );
  INVX2 U141 ( .A(b[7]), .Y(n208) );
  NOR2X1 U142 ( .A(n200), .B(n215), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n214), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n213), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n212), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n211), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n210), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n209), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n208), .Y(n93) );
  NOR2X1 U150 ( .A(n215), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n214), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n213), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n212), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n211), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n210), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n209), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n208), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n214), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n213), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n212), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n211), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n210), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n209), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n208), .Y(n141) );
  NOR2X1 U165 ( .A(n215), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n214), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n213), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n212), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n211), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n210), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n209), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n208), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n215), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n214), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n213), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n212), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n211), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n210), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n209), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n208), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n215), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n214), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n213), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n212), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n211), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n210), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n209), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n208), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n215), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n214), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n213), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n212), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n211), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n210), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n209), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n208), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n215), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n214), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n213), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n212), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n211), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n210), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n209), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n208), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n215), .B(n206), .Y(n100) );
endmodule

