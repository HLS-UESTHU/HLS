/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : Q-2019.12-SP5-2
// Date      : Sun Jun 27 20:33:11 2021
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
  output [15:0] ap;
  input clk, rst_n, initial_time_valid, PEbar;
  wire   \FIR_out0[0] , \FIR_out2[1] , \h1_7[5] , \UFIRROOT/n29 ,
         \UFIRROOT/UROOT/U2/N0 , \UFIRROOT/UROOT/U3/N0 ,
         \UFIRROOT/UROOT/U4/N0 , \UFIRROOT/UROOT/X_r1[0] ,
         \UFIRROOT/UROOT/X_r1[1] , \UFIRROOT/UROOT/X_r1[2] ,
         \UFIRROOT/UROOT/X_r1[3] , \UFIRROOT/UROOT/X_r1[4] ,
         \UFIRROOT/UROOT/X_r1[5] , \UFIRROOT/UROOT/X_r1[6] ,
         \UFIRROOT/UROOT/X_r1[7] , \UFIRROOT/UROOT/C3_3 ,
         \UFIRROOT/UROOT/X_r2[0] , \UFIRROOT/UROOT/X_r2[1] ,
         \UFIRROOT/UROOT/X_r2[2] , \UFIRROOT/UROOT/X_r2[3] ,
         \UFIRROOT/UROOT/X_r2[4] , \UFIRROOT/UROOT/X_r2[5] ,
         \UFIRROOT/UROOT/X_r2[6] , \UFIRROOT/UROOT/X_r2[7] ,
         \UFIRROOT/UROOT/C3_2 , \UFIRROOT/UROOT/C2_2 ,
         \UFIRROOT/UROOT/X_r3[0] , \UFIRROOT/UROOT/X_r3[1] ,
         \UFIRROOT/UROOT/X_r3[2] , \UFIRROOT/UROOT/X_r3[3] ,
         \UFIRROOT/UROOT/X_r3[4] , \UFIRROOT/UROOT/X_r3[5] ,
         \UFIRROOT/UROOT/X_r3[6] , \UFIRROOT/UROOT/X_r3[7] ,
         \UFIRROOT/UROOT/C3_1 , \UFIRROOT/UROOT/C2_1 , \UFIRROOT/UROOT/C1_1 ,
         \UFIRROOT/UFIR/Reg1_d[1] , \UFIRROOT/UFIR/Reg1_d[2] ,
         \UFIRROOT/UFIR/Reg1_d[3] , \UFIRROOT/UFIR/Reg1_d[4] ,
         \UFIRROOT/UFIR/Reg1_d[5] , \UFIRROOT/UFIR/Reg1_d[6] ,
         \UFIRROOT/UFIR/Reg1_d[7] , \UFIRROOT/UFIR/Reg1_d[8] ,
         \UFIRROOT/UFIR/Reg1_d[9] , \UFIRROOT/UFIR/Reg1_d[10] ,
         \UFIRROOT/UFIR/Reg1_d[11] , \UFIRROOT/UFIR/Reg1_d[12] ,
         \UFIRROOT/UFIR/Reg1_d[13] , \UFIRROOT/UFIR/Reg1_d[14] ,
         \UFIRROOT/UFIR/Reg1_d[15] , \UFIRROOT/UFIR/Reg1[0] ,
         \UFIRROOT/UFIR/Reg1[1] , \UFIRROOT/UFIR/Reg1[2] ,
         \UFIRROOT/UFIR/Reg1[3] , \UFIRROOT/UFIR/Reg1[4] ,
         \UFIRROOT/UFIR/Reg1[5] , \UFIRROOT/UFIR/Reg1[6] ,
         \UFIRROOT/UFIR/Reg1[7] , \UFIRROOT/UFIR/Reg1[8] ,
         \UFIRROOT/UFIR/Reg1[9] , \UFIRROOT/UFIR/Reg1[10] ,
         \UFIRROOT/UFIR/Reg1[11] , \UFIRROOT/UFIR/Reg1[12] ,
         \UFIRROOT/UFIR/Reg1[13] , \UFIRROOT/UFIR/Reg1[14] ,
         \UFIRROOT/UFIR/Reg2_d[0] , \UFIRROOT/UFIR/Reg2_d[1] ,
         \UFIRROOT/UFIR/Reg2_d[2] , \UFIRROOT/UFIR/Reg2_d[3] ,
         \UFIRROOT/UFIR/Reg2_d[4] , \UFIRROOT/UFIR/Reg2_d[5] ,
         \UFIRROOT/UFIR/Reg2_d[6] , \UFIRROOT/UFIR/Reg2_d[7] ,
         \UFIRROOT/UFIR/Reg2_d[8] , \UFIRROOT/UFIR/Reg2_d[9] ,
         \UFIRROOT/UFIR/Reg2_d[10] , \UFIRROOT/UFIR/Reg2_d[11] ,
         \UFIRROOT/UFIR/Reg2_d[12] , \UFIRROOT/UFIR/Reg2_d[13] ,
         \UFIRROOT/UFIR/Reg2_d[14] , \UFIRROOT/UFIR/Reg2_d[15] ,
         \UFIRROOT/UFIR/Reg2[0] , \UFIRROOT/UFIR/Reg2[1] ,
         \UFIRROOT/UFIR/Reg2[2] , \UFIRROOT/UFIR/Reg2[3] ,
         \UFIRROOT/UFIR/Reg2[4] , \UFIRROOT/UFIR/Reg2[5] ,
         \UFIRROOT/UFIR/Reg2[6] , \UFIRROOT/UFIR/Reg2[7] ,
         \UFIRROOT/UFIR/Reg2[8] , \UFIRROOT/UFIR/Reg2[9] ,
         \UFIRROOT/UFIR/Reg2[10] , \UFIRROOT/UFIR/Reg2[11] ,
         \UFIRROOT/UFIR/Reg2[12] , \UFIRROOT/UFIR/Reg2[13] ,
         \UFIRROOT/UFIR/Reg2[14] , \UFIRROOT/UFIR/Reg2[15] ,
         \UFIRROOT/UFIR/Reg3_d[0] , \UFIRROOT/UFIR/Reg3_d[1] ,
         \UFIRROOT/UFIR/Reg3_d[2] , \UFIRROOT/UFIR/Reg3_d[3] ,
         \UFIRROOT/UFIR/Reg3_d[4] , \UFIRROOT/UFIR/Reg3_d[5] ,
         \UFIRROOT/UFIR/Reg3_d[6] , \UFIRROOT/UFIR/Reg3_d[7] ,
         \UFIRROOT/UFIR/Reg3_d[8] , \UFIRROOT/UFIR/Reg3_d[9] ,
         \UFIRROOT/UFIR/Reg3_d[10] , \UFIRROOT/UFIR/Reg3_d[11] ,
         \UFIRROOT/UFIR/Reg3_d[12] , \UFIRROOT/UFIR/Reg3_d[13] ,
         \UFIRROOT/UFIR/Reg3_d[14] , \UFIRROOT/UFIR/Reg3_d[15] ,
         \UFIRROOT/UFIR/Reg3[0] , \UFIRROOT/UFIR/Reg3[1] ,
         \UFIRROOT/UFIR/Reg3[2] , \UFIRROOT/UFIR/Reg3[3] ,
         \UFIRROOT/UFIR/Reg3[4] , \UFIRROOT/UFIR/Reg3[5] ,
         \UFIRROOT/UFIR/Reg3[6] , \UFIRROOT/UFIR/Reg3[7] ,
         \UFIRROOT/UFIR/Reg3[8] , \UFIRROOT/UFIR/Reg3[9] ,
         \UFIRROOT/UFIR/Reg3[10] , \UFIRROOT/UFIR/Reg3[11] ,
         \UFIRROOT/UFIR/Reg3[12] , \UFIRROOT/UFIR/Reg3[13] ,
         \UFIRROOT/UFIR/Reg3[14] , \UFIRROOT/UFIR/Reg3[15] ,
         \UFIRROOT/UFIR/Reg4_d[0] , \UFIRROOT/UFIR/Reg4_d[1] ,
         \UFIRROOT/UFIR/Reg4_d[2] , \UFIRROOT/UFIR/Reg4_d[3] ,
         \UFIRROOT/UFIR/Reg4_d[4] , \UFIRROOT/UFIR/Reg4_d[5] ,
         \UFIRROOT/UFIR/Reg4_d[6] , \UFIRROOT/UFIR/Reg4_d[7] ,
         \UFIRROOT/UFIR/Reg4_d[8] , \UFIRROOT/UFIR/Reg4_d[9] ,
         \UFIRROOT/UFIR/Reg4_d[10] , \UFIRROOT/UFIR/Reg4_d[11] ,
         \UFIRROOT/UFIR/Reg4_d[12] , \UFIRROOT/UFIR/Reg4_d[13] ,
         \UFIRROOT/UFIR/Reg4_d[14] , \UFIRROOT/UFIR/Reg4_d[15] ,
         \UFIRROOT/UFIR/Reg4[0] , \UFIRROOT/UFIR/Reg4[1] ,
         \UFIRROOT/UFIR/Reg4[2] , \UFIRROOT/UFIR/Reg4[3] ,
         \UFIRROOT/UFIR/Reg4[4] , \UFIRROOT/UFIR/Reg4[5] ,
         \UFIRROOT/UFIR/Reg4[6] , \UFIRROOT/UFIR/Reg4[7] ,
         \UFIRROOT/UFIR/Reg4[8] , \UFIRROOT/UFIR/Reg4[9] ,
         \UFIRROOT/UFIR/Reg4[10] , \UFIRROOT/UFIR/Reg4[11] ,
         \UFIRROOT/UFIR/Reg4[12] , \UFIRROOT/UFIR/Reg4[13] ,
         \UFIRROOT/UFIR/Reg4[14] , \UFIRROOT/UFIR/Reg4[15] ,
         \UFIRROOT/UFIR/Reg5_d[0] , \UFIRROOT/UFIR/Reg5_d[1] ,
         \UFIRROOT/UFIR/Reg5_d[2] , \UFIRROOT/UFIR/Reg5_d[3] ,
         \UFIRROOT/UFIR/Reg5_d[4] , \UFIRROOT/UFIR/Reg5_d[5] ,
         \UFIRROOT/UFIR/Reg5_d[6] , \UFIRROOT/UFIR/Reg5_d[7] ,
         \UFIRROOT/UFIR/Reg5_d[8] , \UFIRROOT/UFIR/Reg5_d[9] ,
         \UFIRROOT/UFIR/Reg5_d[10] , \UFIRROOT/UFIR/Reg5_d[11] ,
         \UFIRROOT/UFIR/Reg5_d[12] , \UFIRROOT/UFIR/Reg5_d[13] ,
         \UFIRROOT/UFIR/Reg5_d[14] , \UFIRROOT/UFIR/Reg5_d[15] ,
         \UFIRROOT/UFIR/Reg5[0] , \UFIRROOT/UFIR/Reg5[1] ,
         \UFIRROOT/UFIR/Reg5[2] , \UFIRROOT/UFIR/Reg5[3] ,
         \UFIRROOT/UFIR/Reg5[4] , \UFIRROOT/UFIR/Reg5[5] ,
         \UFIRROOT/UFIR/Reg5[6] , \UFIRROOT/UFIR/Reg5[7] ,
         \UFIRROOT/UFIR/Reg5[8] , \UFIRROOT/UFIR/Reg5[9] ,
         \UFIRROOT/UFIR/Reg5[10] , \UFIRROOT/UFIR/Reg5[11] ,
         \UFIRROOT/UFIR/Reg5[12] , \UFIRROOT/UFIR/Reg5[13] ,
         \UFIRROOT/UFIR/Reg5[14] , \UFIRROOT/UFIR/Reg5[15] ,
         \UFIRROOT/UFIR/Reg6_d[0] , \UFIRROOT/UFIR/Reg6_d[1] ,
         \UFIRROOT/UFIR/Reg6_d[2] , \UFIRROOT/UFIR/Reg6_d[3] ,
         \UFIRROOT/UFIR/Reg6_d[4] , \UFIRROOT/UFIR/Reg6_d[5] ,
         \UFIRROOT/UFIR/Reg6_d[6] , \UFIRROOT/UFIR/Reg6_d[7] ,
         \UFIRROOT/UFIR/Reg6_d[8] , \UFIRROOT/UFIR/Reg6_d[9] ,
         \UFIRROOT/UFIR/Reg6_d[10] , \UFIRROOT/UFIR/Reg6_d[11] ,
         \UFIRROOT/UFIR/Reg6_d[12] , \UFIRROOT/UFIR/Reg6_d[13] ,
         \UFIRROOT/UFIR/Reg6_d[14] , \UFIRROOT/UFIR/Reg6_d[15] ,
         \UFIRROOT/UFIR/Reg6[0] , \UFIRROOT/UFIR/Reg6[1] ,
         \UFIRROOT/UFIR/Reg6[2] , \UFIRROOT/UFIR/Reg6[3] ,
         \UFIRROOT/UFIR/Reg6[4] , \UFIRROOT/UFIR/Reg6[5] ,
         \UFIRROOT/UFIR/Reg6[6] , \UFIRROOT/UFIR/Reg6[7] ,
         \UFIRROOT/UFIR/Reg6[8] , \UFIRROOT/UFIR/Reg6[9] ,
         \UFIRROOT/UFIR/Reg6[10] , \UFIRROOT/UFIR/Reg6[11] ,
         \UFIRROOT/UFIR/Reg6[12] , \UFIRROOT/UFIR/Reg6[13] ,
         \UFIRROOT/UFIR/Reg6[14] , \UFIRROOT/UFIR/Reg6[15] ,
         \UFIRROOT/UFIR/Reg7_d[8] , \UFIRROOT/UFIR/Reg7_d[9] ,
         \UFIRROOT/UFIR/Reg7_d[10] , \UFIRROOT/UFIR/Reg7_d[11] ,
         \UFIRROOT/UFIR/Reg7_d[12] , \UFIRROOT/UFIR/Reg7_d[13] ,
         \UFIRROOT/UFIR/Reg7_d[14] , \UFIRROOT/UFIR/Reg7_d[15] ,
         \UFIRROOT/mult_x_4/n236 , \UFIRROOT/mult_x_4/n235 ,
         \UFIRROOT/mult_x_4/n234 , \UFIRROOT/mult_x_4/n229 ,
         \UFIRROOT/mult_x_4/n227 , \UFIRROOT/mult_x_4/n226 ,
         \UFIRROOT/mult_x_4/n222 , \UFIRROOT/mult_x_4/n220 ,
         \UFIRROOT/mult_x_4/n219 , \UFIRROOT/mult_x_4/n213 ,
         \UFIRROOT/mult_x_4/n211 , \UFIRROOT/mult_x_4/n210 ,
         \UFIRROOT/mult_x_4/n209 , \UFIRROOT/mult_x_4/n206 ,
         \UFIRROOT/mult_x_4/n205 , \UFIRROOT/mult_x_4/n203 ,
         \UFIRROOT/mult_x_4/n202 , \UFIRROOT/mult_x_4/n197 ,
         \UFIRROOT/mult_x_4/n196 , \UFIRROOT/mult_x_4/n195 ,
         \UFIRROOT/mult_x_4/n193 , \UFIRROOT/mult_x_4/n188 ,
         \UFIRROOT/mult_x_4/n187 , \UFIRROOT/mult_x_4/n186 ,
         \UFIRROOT/mult_x_4/n181 , \UFIRROOT/mult_x_4/n179 ,
         \UFIRROOT/mult_x_4/n173 , \UFIRROOT/mult_x_4/n170 ,
         \UFIRROOT/mult_x_4/n169 , \UFIRROOT/mult_x_4/n168 ,
         \UFIRROOT/mult_x_4/n167 , \UFIRROOT/mult_x_4/n166 ,
         \UFIRROOT/mult_x_4/n165 , \UFIRROOT/mult_x_4/n164 ,
         \UFIRROOT/mult_x_4/n163 , \UFIRROOT/mult_x_4/n162 ,
         \UFIRROOT/mult_x_4/n161 , \UFIRROOT/mult_x_4/n160 ,
         \UFIRROOT/mult_x_4/n159 , \UFIRROOT/mult_x_4/n158 ,
         \UFIRROOT/mult_x_4/n157 , \UFIRROOT/mult_x_4/n156 ,
         \UFIRROOT/mult_x_4/n155 , \UFIRROOT/mult_x_4/n154 ,
         \UFIRROOT/mult_x_4/n153 , \UFIRROOT/mult_x_4/n152 ,
         \UFIRROOT/mult_x_4/n151 , \UFIRROOT/mult_x_4/n150 ,
         \UFIRROOT/mult_x_4/n149 , \UFIRROOT/mult_x_4/n148 ,
         \UFIRROOT/mult_x_4/n147 , \UFIRROOT/mult_x_4/n146 ,
         \UFIRROOT/mult_x_4/n145 , \UFIRROOT/mult_x_4/n144 ,
         \UFIRROOT/mult_x_4/n143 , \UFIRROOT/mult_x_4/n142 ,
         \UFIRROOT/mult_x_4/n141 , \UFIRROOT/mult_x_4/n140 ,
         \UFIRROOT/mult_x_4/n139 , \UFIRROOT/mult_x_4/n138 ,
         \UFIRROOT/mult_x_4/n137 , \UFIRROOT/mult_x_4/n136 ,
         \UFIRROOT/mult_x_4/n135 , \UFIRROOT/mult_x_4/n134 ,
         \UFIRROOT/mult_x_4/n133 , \UFIRROOT/mult_x_4/n132 ,
         \UFIRROOT/mult_x_4/n131 , \UFIRROOT/mult_x_4/n130 ,
         \UFIRROOT/mult_x_4/n129 , \UFIRROOT/mult_x_4/n128 ,
         \UFIRROOT/mult_x_4/n127 , \UFIRROOT/mult_x_4/n126 ,
         \UFIRROOT/mult_x_4/n125 , \UFIRROOT/mult_x_4/n124 ,
         \UFIRROOT/mult_x_4/n123 , \UFIRROOT/mult_x_4/n122 ,
         \UFIRROOT/mult_x_4/n121 , \UFIRROOT/mult_x_4/n120 ,
         \UFIRROOT/mult_x_4/n119 , \UFIRROOT/mult_x_4/n118 ,
         \UFIRROOT/mult_x_4/n117 , \UFIRROOT/mult_x_4/n116 ,
         \UFIRROOT/mult_x_4/n115 , \UFIRROOT/mult_x_4/n114 ,
         \UFIRROOT/mult_x_4/n113 , \UFIRROOT/mult_x_4/n112 ,
         \UFIRROOT/mult_x_4/n111 , \UFIRROOT/mult_x_4/n110 ,
         \UFIRROOT/mult_x_4/n109 , n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n769, n770, n771,
         n772, n773, n774, n775, n776, n777, n778, n779, n780, n781, n782,
         n783, n784, n785, n786, n787, n788, n789, n790, n791, n792, n793,
         n794, n795, n796, n797, n798, n799, n800, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, n889, n890, n891, n892,
         n893, n894, n895, n896, n897, n898, n899, n900, n901, n902, n903,
         n904, n905, n906, n907, n908, n909, n910, n911, n912, n913, n914,
         n915, n916, n917, n918, n919, n920, n921, n922, n923, n924, n925,
         n926, n927, n928, n929, n930, n931, n932, n933, n934, n935, n936,
         n937, n938, n939, n940, n941, n942, n943, n944, n945, n946, n947,
         n948, n949, n950, n951, n952, n953, n954, n955, n956, n957, n958,
         n959, n960, n961, n962, n963, n964, n965, n966, n967, n968, n969,
         n970, n971, n972, n973, n974, n975, n976, n977, n978, n979, n980,
         n981, n982, n983, n984, n985, n986, n987, n988, n989, n990, n991,
         n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002,
         n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012,
         n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022,
         n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032,
         n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042,
         n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052,
         n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062,
         n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
         n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082,
         n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092,
         n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102,
         n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112,
         n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122,
         n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132,
         n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142,
         n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152,
         n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162,
         n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172,
         n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182,
         n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192,
         n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202,
         n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212,
         n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222,
         n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232,
         n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242,
         n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252,
         n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262,
         n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272,
         n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282,
         n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292,
         n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302,
         n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312,
         n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322,
         n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332,
         n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342,
         n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352,
         n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362,
         n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372,
         n1373, n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382,
         n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392,
         n1393, n1394, n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402,
         n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412,
         n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422,
         n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432,
         n1433, n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442,
         n1443, n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452,
         n1453, n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462,
         n1463, n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472,
         n1473, n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482,
         n1483, n1484, n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492,
         n1493, n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502,
         n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512,
         n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522,
         n1523, n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532,
         n1533, n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542,
         n1543, n1544, n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552,
         n1553, n1554, n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562,
         n1563, n1564, n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572,
         n1573, n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582,
         n1583, n1584, n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592,
         n1593, n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602,
         n1603, n1604, n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612,
         n1613, n1614, n1615, n1616, n1617, n1618, n1619, n1620, n1621, n1622,
         n1623, n1624, n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632,
         n1633, n1634, n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642,
         n1643, n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652,
         n1653, n1654, n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662,
         n1663, n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672,
         n1673, n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682,
         n1683, n1684, n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692,
         n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702,
         n1703, n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712,
         n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722,
         n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731, n1732,
         n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740, n1741, n1742,
         n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751, n1752,
         n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760, n1761, n1762,
         n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770, n1771, n1772,
         n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780, n1781, n1782,
         n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790, n1791, n1792,
         n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800, n1801, n1802,
         n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810, n1811, n1812,
         n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821, n1822,
         n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830, n1831, n1832,
         n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841, n1842,
         n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851, n1852,
         n1853, n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862,
         n1863, n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872,
         n1873, n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881, n1882,
         n1883, n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891, n1892,
         n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901, n1902,
         n1903, n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911, n1912,
         n1913, n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921, n1922,
         n1923, n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931, n1932,
         n1933, n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941, n1942,
         n1943, n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951, n1952,
         n1953, n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962,
         n1963, n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971, n1972,
         n1973, n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981, n1982,
         n1983, n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991, n1992,
         n1993, n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001, n2002,
         n2003, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012,
         n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022,
         n2023, n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031, n2032,
         n2033, n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041, n2042,
         n2043, n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051, n2052,
         n2053, n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061, n2062,
         n2063, n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071, n2072,
         n2073, n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081, n2082,
         n2083, n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091, n2092,
         n2093, n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101, n2102,
         n2103, n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111, n2112,
         n2113, n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121, n2122,
         n2123, n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131, n2132,
         n2133, n2134, \FIR_out2_7[2] , n2138;
  wire   [3:0] ap_2;
  wire   [4:0] hh_2;
  wire   [5:0] mm_2;
  wire   [3:0] h0;
  wire   [3:0] h1;
  wire   [3:0] m0;
  wire   [3:0] m1;
  wire   [15:1] \bcd_fir/bin_reg ;
  wire   [7:0] \UFIRROOT/FIRouttemp ;
  wire   SYNOPSYS_UNCONNECTED__0;
  assign ap[8] = ap_2[3];
  assign FIR_out2_7[6] = \FIR_out2[1] ;
  assign h1_7[2] = \h1_7[5] ;
  assign h1_7[5] = \h1_7[5] ;
  assign FIR_out2_7[1] = \FIR_out2_7[2] ;
  assign FIR_out2_7[5] = \FIR_out2_7[2] ;
  assign FIR_out2_7[2] = \FIR_out2_7[2] ;
  assign ap[0] = 1'b1;
  assign h1_7[4] = 1'b1;
  assign FIR_out2_7[4] = 1'b1;

  RTC RTC ( .clk(clk), .rst_n(rst_n), .initial_time_hh(initial_time_hh), 
        .initial_time_mm(initial_time_mm), .initial_time_valid(
        initial_time_valid), .hh(hh_2), .mm(mm_2) );
  bcd_1 bcd_RTC_hh ( .clk(clk), .rst_n(rst_n), .bin_in({1'b0, 1'b0, 1'b0, hh_2}), .dec_out0(h0), .\dec_out1[1]_BAR (h1[1]), .\dec_out1[0] (h1[0]) );
  bcd_0 bcd_RTC_mm ( .clk(clk), .rst_n(rst_n), .bin_in({1'b0, 1'b0, mm_2}), 
        .dec_out0(m0), .dec_out1({SYNOPSYS_UNCONNECTED__0, m1[2:0]}) );
  DFFRHQXL \bcd_fir/bin_reg_reg[0]  ( .D(out[0]), .CK(clk), .RN(rst_n), .Q(
        \FIR_out0[0] ) );
  DFFRHQXL \bcd_fir/bin_reg_reg[1]  ( .D(out[1]), .CK(clk), .RN(rst_n), .Q(
        \bcd_fir/bin_reg [1]) );
  DFFRHQXL \bcd_fir/bin_reg_reg[2]  ( .D(out[2]), .CK(clk), .RN(rst_n), .Q(
        \bcd_fir/bin_reg [2]) );
  DFFRHQX1 \bcd_fir/bin_reg_reg[4]  ( .D(out[4]), .CK(clk), .RN(rst_n), .Q(
        \bcd_fir/bin_reg [4]) );
  DFFHQX1 \UFIRROOT/UROOT/X_r3_reg[7]  ( .D(\UFIRROOT/UROOT/X_r2[7] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r3[7] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r2_reg[7]  ( .D(\UFIRROOT/UROOT/X_r1[7] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r2[7] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r1_reg[7]  ( .D(\UFIRROOT/FIRouttemp [7]), .CK(clk), .Q(\UFIRROOT/UROOT/X_r1[7] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r3_reg[6]  ( .D(\UFIRROOT/UROOT/X_r2[6] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r3[6] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r2_reg[6]  ( .D(\UFIRROOT/UROOT/X_r1[6] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r2[6] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r1_reg[6]  ( .D(\UFIRROOT/FIRouttemp [6]), .CK(clk), .Q(\UFIRROOT/UROOT/X_r1[6] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r3_reg[5]  ( .D(\UFIRROOT/UROOT/X_r2[5] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r3[5] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r2_reg[5]  ( .D(\UFIRROOT/UROOT/X_r1[5] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r2[5] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r1_reg[5]  ( .D(\UFIRROOT/FIRouttemp [5]), .CK(clk), .Q(\UFIRROOT/UROOT/X_r1[5] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r3_reg[4]  ( .D(\UFIRROOT/UROOT/X_r2[4] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r3[4] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r2_reg[4]  ( .D(\UFIRROOT/UROOT/X_r1[4] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r2[4] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r1_reg[4]  ( .D(\UFIRROOT/FIRouttemp [4]), .CK(clk), .Q(\UFIRROOT/UROOT/X_r1[4] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r3_reg[3]  ( .D(\UFIRROOT/UROOT/X_r2[3] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r3[3] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r2_reg[3]  ( .D(\UFIRROOT/UROOT/X_r1[3] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r2[3] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r1_reg[3]  ( .D(\UFIRROOT/FIRouttemp [3]), .CK(clk), .Q(\UFIRROOT/UROOT/X_r1[3] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r3_reg[2]  ( .D(\UFIRROOT/UROOT/X_r2[2] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r3[2] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r2_reg[2]  ( .D(\UFIRROOT/UROOT/X_r1[2] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r2[2] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r1_reg[2]  ( .D(\UFIRROOT/FIRouttemp [2]), .CK(clk), .Q(\UFIRROOT/UROOT/X_r1[2] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r2_reg[1]  ( .D(\UFIRROOT/UROOT/X_r1[1] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r2[1] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r1_reg[1]  ( .D(\UFIRROOT/FIRouttemp [1]), .CK(clk), .Q(\UFIRROOT/UROOT/X_r1[1] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r3_reg[0]  ( .D(\UFIRROOT/UROOT/X_r2[0] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r3[0] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r2_reg[0]  ( .D(\UFIRROOT/UROOT/X_r1[0] ), .CK(clk), .Q(\UFIRROOT/UROOT/X_r2[0] ) );
  DFFHQX1 \UFIRROOT/UROOT/X_r1_reg[0]  ( .D(\UFIRROOT/FIRouttemp [0]), .CK(clk), .Q(\UFIRROOT/UROOT/X_r1[0] ) );
  DFFHQX1 \UFIRROOT/UROOT/C3_1_reg  ( .D(\UFIRROOT/UROOT/C3_2 ), .CK(clk), .Q(
        \UFIRROOT/UROOT/C3_1 ) );
  DFFHQX1 \UFIRROOT/UROOT/C3_2_reg  ( .D(\UFIRROOT/UROOT/C3_3 ), .CK(clk), .Q(
        \UFIRROOT/UROOT/C3_2 ) );
  DFFHQX1 \UFIRROOT/UROOT/C3_3_reg  ( .D(\UFIRROOT/n29 ), .CK(clk), .Q(
        \UFIRROOT/UROOT/C3_3 ) );
  DFFHQX1 \UFIRROOT/UROOT/C2_1_reg  ( .D(\UFIRROOT/UROOT/C2_2 ), .CK(clk), .Q(
        \UFIRROOT/UROOT/C2_1 ) );
  DFFHQX1 \UFIRROOT/UROOT/C2_2_reg  ( .D(\UFIRROOT/UROOT/U2/N0 ), .CK(clk), 
        .Q(\UFIRROOT/UROOT/C2_2 ) );
  DFFHQX1 \UFIRROOT/UROOT/C1_1_reg  ( .D(\UFIRROOT/UROOT/U3/N0 ), .CK(clk), 
        .Q(\UFIRROOT/UROOT/C1_1 ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[14]  ( .D(\UFIRROOT/UFIR/Reg1_d[15] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg1[14] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[13]  ( .D(\UFIRROOT/UFIR/Reg1_d[14] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg1[13] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[12]  ( .D(\UFIRROOT/UFIR/Reg1_d[13] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg1[12] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[11]  ( .D(\UFIRROOT/UFIR/Reg1_d[12] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg1[11] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[10]  ( .D(\UFIRROOT/UFIR/Reg1_d[11] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg1[10] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[9]  ( .D(\UFIRROOT/UFIR/Reg1_d[10] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg1[9] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[8]  ( .D(\UFIRROOT/UFIR/Reg1_d[9] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg1[8] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[7]  ( .D(\UFIRROOT/UFIR/Reg1_d[8] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg1[7] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[6]  ( .D(\UFIRROOT/UFIR/Reg1_d[7] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg1[6] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[5]  ( .D(\UFIRROOT/UFIR/Reg1_d[6] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg1[5] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[4]  ( .D(\UFIRROOT/UFIR/Reg1_d[5] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg1[4] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[3]  ( .D(\UFIRROOT/UFIR/Reg1_d[4] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg1[3] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[2]  ( .D(\UFIRROOT/UFIR/Reg1_d[3] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg1[2] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[1]  ( .D(\UFIRROOT/UFIR/Reg1_d[2] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg1[1] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg1_reg[0]  ( .D(\UFIRROOT/UFIR/Reg1_d[1] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg1[0] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[15]  ( .D(\UFIRROOT/UFIR/Reg2_d[15] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg2[15] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[12]  ( .D(\UFIRROOT/UFIR/Reg2_d[12] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg2[12] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[11]  ( .D(\UFIRROOT/UFIR/Reg2_d[11] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg2[11] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[10]  ( .D(\UFIRROOT/UFIR/Reg2_d[10] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg2[10] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[9]  ( .D(\UFIRROOT/UFIR/Reg2_d[9] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[9] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[8]  ( .D(\UFIRROOT/UFIR/Reg2_d[8] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[8] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[7]  ( .D(\UFIRROOT/UFIR/Reg2_d[7] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[7] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[6]  ( .D(\UFIRROOT/UFIR/Reg2_d[6] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[6] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[5]  ( .D(\UFIRROOT/UFIR/Reg2_d[5] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[5] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[4]  ( .D(\UFIRROOT/UFIR/Reg2_d[4] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[4] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[3]  ( .D(\UFIRROOT/UFIR/Reg2_d[3] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[3] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[2]  ( .D(\UFIRROOT/UFIR/Reg2_d[2] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[2] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[1]  ( .D(\UFIRROOT/UFIR/Reg2_d[1] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[1] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg2_reg[0]  ( .D(\UFIRROOT/UFIR/Reg2_d[0] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg2[0] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[12]  ( .D(\UFIRROOT/UFIR/Reg3_d[12] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg3[12] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[11]  ( .D(\UFIRROOT/UFIR/Reg3_d[11] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg3[11] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[10]  ( .D(\UFIRROOT/UFIR/Reg3_d[10] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg3[10] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[9]  ( .D(\UFIRROOT/UFIR/Reg3_d[9] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg3[9] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[8]  ( .D(\UFIRROOT/UFIR/Reg3_d[8] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg3[8] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[7]  ( .D(\UFIRROOT/UFIR/Reg3_d[7] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg3[7] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[6]  ( .D(\UFIRROOT/UFIR/Reg3_d[6] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg3[6] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[5]  ( .D(\UFIRROOT/UFIR/Reg3_d[5] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg3[5] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[4]  ( .D(\UFIRROOT/UFIR/Reg3_d[4] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg3[4] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[2]  ( .D(\UFIRROOT/UFIR/Reg3_d[2] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg3[2] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[1]  ( .D(\UFIRROOT/UFIR/Reg3_d[1] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg3[1] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg3_reg[0]  ( .D(\UFIRROOT/UFIR/Reg3_d[0] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg3[0] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[12]  ( .D(\UFIRROOT/UFIR/Reg4_d[12] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg4[12] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[11]  ( .D(\UFIRROOT/UFIR/Reg4_d[11] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg4[11] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[10]  ( .D(\UFIRROOT/UFIR/Reg4_d[10] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg4[10] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[9]  ( .D(\UFIRROOT/UFIR/Reg4_d[9] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[9] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[8]  ( .D(\UFIRROOT/UFIR/Reg4_d[8] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[8] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[7]  ( .D(\UFIRROOT/UFIR/Reg4_d[7] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[7] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[6]  ( .D(\UFIRROOT/UFIR/Reg4_d[6] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[6] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[5]  ( .D(\UFIRROOT/UFIR/Reg4_d[5] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[5] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[4]  ( .D(\UFIRROOT/UFIR/Reg4_d[4] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[4] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[3]  ( .D(\UFIRROOT/UFIR/Reg4_d[3] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[3] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[2]  ( .D(\UFIRROOT/UFIR/Reg4_d[2] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[2] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[1]  ( .D(\UFIRROOT/UFIR/Reg4_d[1] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[1] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[0]  ( .D(\UFIRROOT/UFIR/Reg4_d[0] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg4[0] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[13]  ( .D(\UFIRROOT/UFIR/Reg5_d[13] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg5[13] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[11]  ( .D(\UFIRROOT/UFIR/Reg5_d[11] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg5[11] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[10]  ( .D(\UFIRROOT/UFIR/Reg5_d[10] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg5[10] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[9]  ( .D(\UFIRROOT/UFIR/Reg5_d[9] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[9] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[8]  ( .D(\UFIRROOT/UFIR/Reg5_d[8] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[8] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[7]  ( .D(\UFIRROOT/UFIR/Reg5_d[7] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[7] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[6]  ( .D(\UFIRROOT/UFIR/Reg5_d[6] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[6] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[5]  ( .D(\UFIRROOT/UFIR/Reg5_d[5] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[5] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[4]  ( .D(\UFIRROOT/UFIR/Reg5_d[4] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[4] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[3]  ( .D(\UFIRROOT/UFIR/Reg5_d[3] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[3] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[2]  ( .D(\UFIRROOT/UFIR/Reg5_d[2] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[2] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[1]  ( .D(\UFIRROOT/UFIR/Reg5_d[1] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[1] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[0]  ( .D(\UFIRROOT/UFIR/Reg5_d[0] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg5[0] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[13]  ( .D(\UFIRROOT/UFIR/Reg6_d[13] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg6[13] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[12]  ( .D(\UFIRROOT/UFIR/Reg6_d[12] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg6[12] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[11]  ( .D(\UFIRROOT/UFIR/Reg6_d[11] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg6[11] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[10]  ( .D(\UFIRROOT/UFIR/Reg6_d[10] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg6[10] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[9]  ( .D(\UFIRROOT/UFIR/Reg6_d[9] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[9] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[8]  ( .D(\UFIRROOT/UFIR/Reg6_d[8] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[8] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[7]  ( .D(\UFIRROOT/UFIR/Reg6_d[7] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[7] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[6]  ( .D(\UFIRROOT/UFIR/Reg6_d[6] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[6] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[5]  ( .D(\UFIRROOT/UFIR/Reg6_d[5] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[5] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[4]  ( .D(\UFIRROOT/UFIR/Reg6_d[4] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[4] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[3]  ( .D(\UFIRROOT/UFIR/Reg6_d[3] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[3] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[2]  ( .D(\UFIRROOT/UFIR/Reg6_d[2] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[2] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[1]  ( .D(\UFIRROOT/UFIR/Reg6_d[1] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[1] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[0]  ( .D(\UFIRROOT/UFIR/Reg6_d[0] ), .CK(clk), .Q(\UFIRROOT/UFIR/Reg6[0] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg7_reg[15]  ( .D(\UFIRROOT/UFIR/Reg7_d[15] ), .CK(
        clk), .Q(\UFIRROOT/FIRouttemp [7]) );
  DFFHQX1 \UFIRROOT/UFIR/Reg7_reg[14]  ( .D(\UFIRROOT/UFIR/Reg7_d[14] ), .CK(
        clk), .Q(\UFIRROOT/FIRouttemp [6]) );
  DFFHQX1 \UFIRROOT/UFIR/Reg7_reg[13]  ( .D(\UFIRROOT/UFIR/Reg7_d[13] ), .CK(
        clk), .Q(\UFIRROOT/FIRouttemp [5]) );
  DFFHQX1 \UFIRROOT/UFIR/Reg7_reg[12]  ( .D(\UFIRROOT/UFIR/Reg7_d[12] ), .CK(
        clk), .Q(\UFIRROOT/FIRouttemp [4]) );
  DFFHQX1 \UFIRROOT/UFIR/Reg7_reg[11]  ( .D(\UFIRROOT/UFIR/Reg7_d[11] ), .CK(
        clk), .Q(\UFIRROOT/FIRouttemp [3]) );
  DFFHQX1 \UFIRROOT/UFIR/Reg7_reg[10]  ( .D(\UFIRROOT/UFIR/Reg7_d[10] ), .CK(
        clk), .Q(\UFIRROOT/FIRouttemp [2]) );
  DFFHQX1 \UFIRROOT/UFIR/Reg7_reg[9]  ( .D(\UFIRROOT/UFIR/Reg7_d[9] ), .CK(clk), .Q(\UFIRROOT/FIRouttemp [1]) );
  DFFHQX1 \UFIRROOT/UFIR/Reg7_reg[8]  ( .D(\UFIRROOT/UFIR/Reg7_d[8] ), .CK(clk), .Q(\UFIRROOT/FIRouttemp [0]) );
  DFFHQX1 \UFIRROOT/UROOT/X_r4_reg[3]  ( .D(\UFIRROOT/UROOT/X_r3[3] ), .CK(clk), .Q(out[3]) );
  DFFHQX1 \UFIRROOT/UROOT/X_r4_reg[2]  ( .D(\UFIRROOT/UROOT/X_r3[2] ), .CK(clk), .Q(out[2]) );
  DFFHQX1 \UFIRROOT/UROOT/X_r4_reg[1]  ( .D(\UFIRROOT/UROOT/X_r3[1] ), .CK(clk), .Q(out[1]) );
  DFFHQX1 \UFIRROOT/UROOT/X_r4_reg[0]  ( .D(\UFIRROOT/UROOT/X_r3[0] ), .CK(clk), .Q(out[0]) );
  DFFHQX1 \UFIRROOT/UROOT/X_r4_reg[6]  ( .D(\UFIRROOT/UROOT/X_r3[6] ), .CK(clk), .Q(out[6]) );
  DFFHQX1 \UFIRROOT/UROOT/X_r4_reg[5]  ( .D(\UFIRROOT/UROOT/X_r3[5] ), .CK(clk), .Q(out[5]) );
  DFFHQX1 \UFIRROOT/UROOT/X_r4_reg[4]  ( .D(\UFIRROOT/UROOT/X_r3[4] ), .CK(clk), .Q(out[4]) );
  DFFHQX1 \UFIRROOT/UROOT/X_r4_reg[7]  ( .D(\UFIRROOT/UROOT/X_r3[7] ), .CK(clk), .Q(out[7]) );
  DFFHQX1 \UFIRROOT/UROOT/C1_0_reg  ( .D(\UFIRROOT/UROOT/C1_1 ), .CK(clk), .Q(
        ap_2[1]) );
  DFFHQX1 \UFIRROOT/UROOT/C0_0_reg  ( .D(\UFIRROOT/UROOT/U4/N0 ), .CK(clk), 
        .Q(ap_2[0]) );
  DFFHQX1 \UFIRROOT/UROOT/C2_0_reg  ( .D(\UFIRROOT/UROOT/C2_1 ), .CK(clk), .Q(
        ap_2[2]) );
  DFFHQX1 \UFIRROOT/UROOT/C3_0_reg  ( .D(\UFIRROOT/UROOT/C3_1 ), .CK(clk), .Q(
        ap_2[3]) );
  DFFRHQX1 \bcd_fir/bin_reg_reg[5]  ( .D(out[5]), .CK(clk), .RN(rst_n), .Q(
        \bcd_fir/bin_reg [5]) );
  CMPR42X1 \UFIRROOT/mult_x_4/U145  ( .A(\UFIRROOT/mult_x_4/n236 ), .B(
        \UFIRROOT/mult_x_4/n222 ), .C(\UFIRROOT/mult_x_4/n229 ), .D(
        \UFIRROOT/mult_x_4/n170 ), .ICI(\UFIRROOT/mult_x_4/n173 ), .S(
        \UFIRROOT/mult_x_4/n168 ), .ICO(\UFIRROOT/mult_x_4/n166 ), .CO(
        \UFIRROOT/mult_x_4/n167 ) );
  CMPR42X1 \UFIRROOT/mult_x_4/U140  ( .A(\UFIRROOT/mult_x_4/n220 ), .B(
        \UFIRROOT/mult_x_4/n206 ), .C(\UFIRROOT/mult_x_4/n234 ), .D(
        \UFIRROOT/mult_x_4/n164 ), .ICI(\UFIRROOT/mult_x_4/n159 ), .S(
        \UFIRROOT/mult_x_4/n156 ), .ICO(\UFIRROOT/mult_x_4/n154 ), .CO(
        \UFIRROOT/mult_x_4/n155 ) );
  CMPR42X1 \UFIRROOT/mult_x_4/U136  ( .A(\UFIRROOT/mult_x_4/n226 ), .B(
        \UFIRROOT/mult_x_4/n205 ), .C(\UFIRROOT/mult_x_4/n219 ), .D(
        \UFIRROOT/mult_x_4/n154 ), .ICI(\UFIRROOT/mult_x_4/n151 ), .S(
        \UFIRROOT/mult_x_4/n146 ), .ICO(\UFIRROOT/mult_x_4/n144 ), .CO(
        \UFIRROOT/mult_x_4/n145 ) );
  CMPR42X2 \UFIRROOT/mult_x_4/U135  ( .A(\UFIRROOT/mult_x_4/n150 ), .B(
        \UFIRROOT/mult_x_4/n157 ), .C(\UFIRROOT/mult_x_4/n148 ), .D(
        \UFIRROOT/mult_x_4/n155 ), .ICI(\UFIRROOT/mult_x_4/n146 ), .S(
        \UFIRROOT/mult_x_4/n143 ), .ICO(\UFIRROOT/mult_x_4/n141 ), .CO(
        \UFIRROOT/mult_x_4/n142 ) );
  CMPR42X2 \UFIRROOT/mult_x_4/U131  ( .A(\UFIRROOT/mult_x_4/n149 ), .B(
        \UFIRROOT/mult_x_4/n147 ), .C(\UFIRROOT/mult_x_4/n141 ), .D(
        \UFIRROOT/mult_x_4/n145 ), .ICI(\UFIRROOT/mult_x_4/n136 ), .S(
        \UFIRROOT/mult_x_4/n133 ), .ICO(\UFIRROOT/mult_x_4/n131 ), .CO(
        \UFIRROOT/mult_x_4/n132 ) );
  CMPR42X1 \UFIRROOT/mult_x_4/U126  ( .A(\UFIRROOT/mult_x_4/n202 ), .B(
        \UFIRROOT/mult_x_4/n188 ), .C(\UFIRROOT/mult_x_4/n127 ), .D(
        \UFIRROOT/mult_x_4/n122 ), .ICI(\UFIRROOT/mult_x_4/n123 ), .S(
        \UFIRROOT/mult_x_4/n119 ), .ICO(\UFIRROOT/mult_x_4/n117 ), .CO(
        \UFIRROOT/mult_x_4/n118 ) );
  CMPR42X1 \UFIRROOT/mult_x_4/U124  ( .A(\UFIRROOT/mult_x_4/n187 ), .B(
        \UFIRROOT/mult_x_4/n120 ), .C(\UFIRROOT/mult_x_4/n116 ), .D(
        \UFIRROOT/mult_x_4/n121 ), .ICI(\UFIRROOT/mult_x_4/n117 ), .S(
        \UFIRROOT/mult_x_4/n114 ), .ICO(\UFIRROOT/mult_x_4/n112 ), .CO(
        \UFIRROOT/mult_x_4/n113 ) );
  CMPR42X1 \UFIRROOT/mult_x_4/U123  ( .A(\UFIRROOT/mult_x_4/n193 ), .B(
        \UFIRROOT/mult_x_4/n179 ), .C(\UFIRROOT/mult_x_4/n186 ), .D(
        \UFIRROOT/mult_x_4/n115 ), .ICI(\UFIRROOT/mult_x_4/n112 ), .S(
        \UFIRROOT/mult_x_4/n111 ), .ICO(\UFIRROOT/mult_x_4/n109 ), .CO(
        \UFIRROOT/mult_x_4/n110 ) );
  DFFHQX4 \UFIRROOT/UFIR/Reg2_reg[14]  ( .D(\UFIRROOT/UFIR/Reg2_d[14] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg2[14] ) );
  DFFHQX4 \UFIRROOT/UFIR/Reg2_reg[13]  ( .D(\UFIRROOT/UFIR/Reg2_d[13] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg2[13] ) );
  DFFHQX4 \UFIRROOT/UFIR/Reg3_reg[15]  ( .D(\UFIRROOT/UFIR/Reg3_d[15] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg3[15] ) );
  DFFHQX4 \UFIRROOT/UFIR/Reg3_reg[14]  ( .D(\UFIRROOT/UFIR/Reg3_d[14] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg3[14] ) );
  DFFHQX4 \UFIRROOT/UFIR/Reg3_reg[13]  ( .D(\UFIRROOT/UFIR/Reg3_d[13] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg3[13] ) );
  DFFRX1 \bcd_fir/bin_reg_reg[3]  ( .D(out[3]), .CK(clk), .RN(rst_n), .Q(
        \bcd_fir/bin_reg [3]), .QN(n2138) );
  DFFX1 \UFIRROOT/UROOT/X_r3_reg[1]  ( .D(\UFIRROOT/UROOT/X_r2[1] ), .CK(clk), 
        .Q(\UFIRROOT/UROOT/X_r3[1] ) );
  DFFX1 \UFIRROOT/UFIR/Reg3_reg[3]  ( .D(\UFIRROOT/UFIR/Reg3_d[3] ), .CK(clk), 
        .Q(\UFIRROOT/UFIR/Reg3[3] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[12]  ( .D(\UFIRROOT/UFIR/Reg5_d[12] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg5[12] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[15]  ( .D(\UFIRROOT/UFIR/Reg6_d[15] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg6[15] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[15]  ( .D(\UFIRROOT/UFIR/Reg4_d[15] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg4[15] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[14]  ( .D(\UFIRROOT/UFIR/Reg4_d[14] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg4[14] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg4_reg[13]  ( .D(\UFIRROOT/UFIR/Reg4_d[13] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg4[13] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg6_reg[14]  ( .D(\UFIRROOT/UFIR/Reg6_d[14] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg6[14] ) );
  DFFRHQX1 \bcd_fir/bin_reg_reg[7]  ( .D(out[7]), .CK(clk), .RN(rst_n), .Q(
        \bcd_fir/bin_reg [7]) );
  DFFRHQX1 \bcd_fir/bin_reg_reg[6]  ( .D(out[6]), .CK(clk), .RN(rst_n), .Q(
        \bcd_fir/bin_reg [6]) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[14]  ( .D(\UFIRROOT/UFIR/Reg5_d[14] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg5[14] ) );
  DFFHQX1 \UFIRROOT/UFIR/Reg5_reg[15]  ( .D(\UFIRROOT/UFIR/Reg5_d[15] ), .CK(
        clk), .Q(\UFIRROOT/UFIR/Reg5[15] ) );
  NOR2X1 U207 ( .A(n2099), .B(\FIR_out2[1] ), .Y(FIR_out2_7[0]) );
  NOR2X1 U208 ( .A(h1[0]), .B(h1_7[6]), .Y(h1_7[0]) );
  NOR2X1 U209 ( .A(m0[0]), .B(n2112), .Y(n2043) );
  NOR2X1 U210 ( .A(n874), .B(n1012), .Y(n965) );
  NOR2X1 U211 ( .A(n1904), .B(n1916), .Y(n1908) );
  NOR2X1 U212 ( .A(m1[0]), .B(n2116), .Y(m1_7[1]) );
  NOR2X1 U213 ( .A(n413), .B(n414), .Y(n409) );
  AOI21X1 U214 ( .A0(n1518), .A1(n1684), .B0(n1517), .Y(n1639) );
  AOI21X1 U215 ( .A0(n1812), .A1(n1990), .B0(n1811), .Y(n1946) );
  AOI21X1 U216 ( .A0(n1376), .A1(n1319), .B0(n1318), .Y(n1320) );
  NOR2X1 U217 ( .A(\UFIRROOT/UROOT/C3_1 ), .B(\UFIRROOT/UROOT/C2_1 ), .Y(n2018) );
  NOR2X1 U218 ( .A(n401), .B(n400), .Y(n414) );
  NOR2X1 U219 ( .A(n607), .B(n606), .Y(n621) );
  NOR2X1 U220 ( .A(n1685), .B(n1690), .Y(n1518) );
  OAI21X1 U221 ( .A0(n1699), .A1(n1695), .B0(n1696), .Y(n1684) );
  NOR2X1 U222 ( .A(n578), .B(n577), .Y(n1921) );
  NOR2X1 U223 ( .A(n1808), .B(n1807), .Y(n1996) );
  NOR2X1 U224 ( .A(\UFIRROOT/mult_x_4/n110 ), .B(n703), .Y(n752) );
  NOR2X1 U225 ( .A(n499), .B(n498), .Y(n501) );
  NOR2X1 U226 ( .A(n1239), .B(n1238), .Y(n1433) );
  NOR2X1 U227 ( .A(n1587), .B(n1588), .Y(n1657) );
  OR2X1 U228 ( .A(n941), .B(n940), .Y(n1071) );
  OR2X1 U229 ( .A(n1797), .B(n1796), .Y(n1970) );
  ADDFX1 U230 ( .A(n494), .B(n493), .CI(n492), .CO(n503), .S(n499) );
  ADDFX1 U231 ( .A(n1234), .B(n1233), .CI(n1232), .CO(n1240), .S(n1239) );
  ADDFX1 U232 ( .A(n591), .B(n590), .CI(n589), .CO(n607), .S(n583) );
  NOR2X1 U233 ( .A(n473), .B(n472), .Y(n475) );
  ADDFX1 U234 ( .A(n534), .B(n533), .CI(n532), .CO(n551), .S(n548) );
  ADDFX1 U235 ( .A(n888), .B(n887), .CI(n886), .CO(n876), .S(n889) );
  ADDFX1 U236 ( .A(n436), .B(n435), .CI(n434), .CO(n530), .S(n437) );
  ADDFX1 U237 ( .A(n576), .B(n575), .CI(n574), .CO(n589), .S(n565) );
  ADDFX2 U238 ( .A(n1253), .B(n1252), .CI(n1251), .CO(n1265), .S(n1261) );
  NOR2X1 U239 ( .A(n1340), .B(n1339), .Y(n1347) );
  ADDFX1 U240 ( .A(n868), .B(n867), .CI(n866), .CO(n967), .S(n861) );
  NOR2X1 U241 ( .A(n1783), .B(n1782), .Y(n2006) );
  ADDFHX1 U242 ( .A(n557), .B(n556), .CI(n555), .CO(n566), .S(n549) );
  NOR2X1 U243 ( .A(n1572), .B(n817), .Y(\UFIRROOT/mult_x_4/n187 ) );
  NOR2X1 U244 ( .A(n1572), .B(n786), .Y(\UFIRROOT/mult_x_4/n219 ) );
  ADDFX1 U245 ( .A(n428), .B(n427), .CI(n426), .CO(n520), .S(n439) );
  ADDFX1 U246 ( .A(n540), .B(n539), .CI(n538), .CO(n557), .S(n537) );
  ADDFX1 U247 ( .A(n442), .B(n441), .CI(n440), .CO(n434), .S(n494) );
  ADDFX1 U248 ( .A(n1501), .B(n1500), .CI(n1499), .CO(n1502), .S(n1489) );
  ADDFX1 U249 ( .A(n340), .B(n339), .CI(n338), .CO(n351), .S(n330) );
  NOR2X1 U250 ( .A(n1572), .B(n334), .Y(n228) );
  NOR2X1 U251 ( .A(n1340), .B(n1028), .Y(n1038) );
  NOR2X1 U252 ( .A(n1303), .B(n1339), .Y(n1331) );
  NOR2X1 U253 ( .A(n337), .B(n594), .Y(n602) );
  ADDFX1 U254 ( .A(n1757), .B(n1756), .CI(n1755), .CO(n1749), .S(n1801) );
  ADDFX1 U255 ( .A(n485), .B(n484), .CI(n483), .CO(n493), .S(n495) );
  ADDFX1 U256 ( .A(\UFIRROOT/UFIR/Reg6[10] ), .B(n573), .CI(n572), .CO(n596), 
        .S(n576) );
  ADDFX2 U257 ( .A(\UFIRROOT/UFIR/Reg1[10] ), .B(n1714), .CI(n1713), .CO(n1721), .S(n1873) );
  ADDFX1 U258 ( .A(\UFIRROOT/UFIR/Reg6[11] ), .B(n593), .CI(n592), .CO(n600), 
        .S(n595) );
  ADDFX1 U259 ( .A(n1498), .B(n1497), .CI(n1496), .CO(n1506), .S(n1508) );
  NOR2X1 U260 ( .A(n1572), .B(n601), .Y(n592) );
  NOR2X1 U261 ( .A(n901), .B(n541), .Y(n485) );
  NOR2X1 U262 ( .A(n1340), .B(n1210), .Y(n1167) );
  NOR2X1 U263 ( .A(n1550), .B(n1828), .Y(n1852) );
  NOR2X1 U264 ( .A(n1572), .B(n515), .Y(n423) );
  NOR2X1 U265 ( .A(n1572), .B(n1818), .Y(n1717) );
  NOR2X1 U266 ( .A(n1572), .B(n1028), .Y(n971) );
  NOR2X1 U267 ( .A(n1340), .B(n918), .Y(n824) );
  NOR2X1 U268 ( .A(n1340), .B(n1306), .Y(n1326) );
  NOR2X1 U269 ( .A(n1572), .B(n284), .Y(n252) );
  NOR2X1 U270 ( .A(n901), .B(n571), .Y(n421) );
  NOR2X1 U271 ( .A(n1572), .B(n900), .Y(n840) );
  NOR2X1 U272 ( .A(n1572), .B(n1819), .Y(n1834) );
  NOR2X1 U273 ( .A(n1340), .B(n1164), .Y(n1305) );
  NOR2X1 U274 ( .A(n1572), .B(n1826), .Y(n1851) );
  NOR2X1 U275 ( .A(n1572), .B(n974), .Y(n870) );
  NOR2X1 U276 ( .A(n1303), .B(n562), .Y(n539) );
  NOR2X1 U277 ( .A(n1328), .B(n1306), .Y(n1304) );
  NOR2X1 U278 ( .A(n333), .B(n1028), .Y(n869) );
  NOR2X1 U279 ( .A(n736), .B(n1552), .Y(n1531) );
  NOR2X1 U280 ( .A(n275), .B(n274), .Y(n1128) );
  NOR2X1 U281 ( .A(n910), .B(n909), .Y(n1002) );
  NOR2X1 U282 ( .A(n901), .B(n1611), .Y(n1548) );
  NOR2X1 U283 ( .A(n1572), .B(n1306), .Y(n1292) );
  ADDFX1 U284 ( .A(\UFIRROOT/UFIR/Reg3[6] ), .B(n243), .CI(n242), .CO(n338), 
        .S(n248) );
  ADDFX1 U285 ( .A(\UFIRROOT/UFIR/Reg1[5] ), .B(n1745), .CI(n1744), .CO(n1743), 
        .S(n1762) );
  ADDFX1 U286 ( .A(\UFIRROOT/UFIR/Reg4[6] ), .B(n1169), .CI(n1168), .CO(n1255), 
        .S(n1174) );
  ADDFX1 U287 ( .A(n479), .B(n478), .CI(n477), .CO(n497), .S(n486) );
  ADDFX1 U288 ( .A(\UFIRROOT/UFIR/Reg1[7] ), .B(n1814), .CI(n1813), .CO(n1843), 
        .S(n1837) );
  ADDFX1 U289 ( .A(\UFIRROOT/UFIR/Reg6[7] ), .B(n514), .CI(n513), .CO(n534), 
        .S(n528) );
  NOR2X1 U290 ( .A(n1572), .B(n735), .Y(\UFIRROOT/mult_x_4/n235 ) );
  NOR2X1 U291 ( .A(n335), .B(n786), .Y(\UFIRROOT/mult_x_4/n222 ) );
  NOR2X1 U292 ( .A(n1550), .B(n515), .Y(n443) );
  NOR2X1 U293 ( .A(n195), .B(n1306), .Y(n1250) );
  NOR2X1 U294 ( .A(n1572), .B(n1164), .Y(n1279) );
  NOR2X1 U295 ( .A(n788), .B(n284), .Y(n290) );
  NOR2X1 U296 ( .A(n1572), .B(n1562), .Y(n1553) );
  NOR2X1 U297 ( .A(n1462), .B(n594), .Y(n419) );
  NOR2X1 U298 ( .A(n516), .B(n1164), .Y(n1176) );
  NOR2X1 U299 ( .A(n333), .B(n1482), .Y(n1492) );
  NOR2X1 U300 ( .A(n736), .B(n328), .Y(n362) );
  NOR2X1 U301 ( .A(n1527), .B(n452), .Y(n463) );
  NOR2X1 U302 ( .A(n1294), .B(n326), .Y(n244) );
  NOR2X1 U303 ( .A(n1604), .B(n1562), .Y(n1567) );
  NOR2X1 U304 ( .A(n1572), .B(n1777), .Y(n1789) );
  NOR2X1 U305 ( .A(n1820), .B(n1830), .Y(n1815) );
  NOR2X1 U306 ( .A(n468), .B(n541), .Y(n470) );
  NOR2X1 U307 ( .A(n921), .B(n1826), .Y(n1788) );
  NOR2X1 U308 ( .A(n1340), .B(n1254), .Y(n1277) );
  ADDFX2 U309 ( .A(\UFIRROOT/UFIR/Reg3[2] ), .B(n280), .CI(n279), .CO(n301), 
        .S(n276) );
  ADDFX2 U310 ( .A(\UFIRROOT/UFIR/Reg6[1] ), .B(n450), .CI(n449), .CO(n469), 
        .S(n456) );
  NOR2X1 U311 ( .A(n202), .B(n332), .Y(n251) );
  NOR2X1 U312 ( .A(n819), .B(n1830), .Y(n1768) );
  NOR2X1 U313 ( .A(n201), .B(n1028), .Y(n826) );
  NOR2X1 U314 ( .A(n901), .B(n1254), .Y(n1208) );
  NOR2X1 U315 ( .A(n1462), .B(n452), .Y(n449) );
  NOR2X1 U316 ( .A(n1276), .B(n283), .Y(n279) );
  INVX2 U317 ( .A(n1710), .Y(n1566) );
  NOR2X1 U318 ( .A(n901), .B(n336), .Y(n281) );
  NOR2X1 U319 ( .A(n921), .B(n900), .Y(n924) );
  NOR2X1 U320 ( .A(n1462), .B(n1254), .Y(n1207) );
  INVX2 U321 ( .A(n1710), .Y(n333) );
  INVX2 U322 ( .A(B0[6]), .Y(n594) );
  NOR2X1 U323 ( .A(n902), .B(n451), .Y(n453) );
  NOR2X1 U324 ( .A(n902), .B(n1278), .Y(n1209) );
  INVX2 U325 ( .A(B3[5]), .Y(n332) );
  ADDFX1 U326 ( .A(n687), .B(n686), .CI(n685), .CO(n696), .S(n693) );
  INVX2 U327 ( .A(B0[7]), .Y(n601) );
  INVX2 U328 ( .A(B0[3]), .Y(n541) );
  INVX2 U329 ( .A(B3[6]), .Y(n324) );
  NOR2X1 U330 ( .A(n661), .B(n652), .Y(n663) );
  NOR2X1 U331 ( .A(n901), .B(n1482), .Y(n1469) );
  CLKINVX2 U332 ( .A(n199), .Y(n201) );
  INVX2 U333 ( .A(n193), .Y(n1276) );
  INVX2 U334 ( .A(B2[2]), .Y(n1254) );
  INVX2 U335 ( .A(B3[4]), .Y(n328) );
  INVX2 U336 ( .A(B3[3]), .Y(n326) );
  INVX2 U337 ( .A(n1731), .Y(n902) );
  INVX2 U338 ( .A(B3[2]), .Y(n336) );
  INVX2 U339 ( .A(B5[3]), .Y(n1819) );
  INVX2 U340 ( .A(B0[0]), .Y(n451) );
  INVX2 U341 ( .A(B1[2]), .Y(n1528) );
  INVX2 U342 ( .A(B0[1]), .Y(n452) );
  NAND3X1 U343 ( .A(PEbar), .B(data_2[1]), .C(data_1[1]), .Y(n198) );
  INVX2 U344 ( .A(n1730), .Y(n335) );
  INVX2 U345 ( .A(B6[1]), .Y(n774) );
  INVX2 U346 ( .A(B3[1]), .Y(n284) );
  NAND3X2 U347 ( .A(PEbar), .B(data_2[5]), .C(data_1[5]), .Y(n215) );
  NAND3X2 U348 ( .A(PEbar), .B(data_2[6]), .C(data_1[6]), .Y(n218) );
  NAND3X2 U349 ( .A(PEbar), .B(data_2[0]), .C(data_1[0]), .Y(n238) );
  INVXL U350 ( .A(B0[2]), .Y(n515) );
  ADDFX2 U351 ( .A(\UFIRROOT/UFIR/Reg6[4] ), .B(n444), .CI(n443), .CO(n440), 
        .S(n483) );
  INVXL U352 ( .A(B4[4]), .Y(n920) );
  INVXL U353 ( .A(B3[7]), .Y(n334) );
  ADDFX2 U354 ( .A(n355), .B(n354), .CI(n353), .CO(n376), .S(n352) );
  ADDFX2 U355 ( .A(\UFIRROOT/UFIR/Reg2[6] ), .B(n826), .CI(n825), .CO(n838), 
        .S(n879) );
  INVXL U356 ( .A(B5[7]), .Y(n1828) );
  INVXL U357 ( .A(B6[3]), .Y(n773) );
  NOR2XL U358 ( .A(n638), .B(\bcd_fir/bin_reg [4]), .Y(n635) );
  INVXL U359 ( .A(\bcd_fir/bin_reg [4]), .Y(n636) );
  INVXL U360 ( .A(B1[0]), .Y(n1482) );
  OAI21X1 U361 ( .A0(n1657), .A1(n1680), .B0(n1658), .Y(n1648) );
  INVXL U362 ( .A(B2[0]), .Y(n1210) );
  OR2X1 U363 ( .A(n1230), .B(n1229), .Y(n1395) );
  OAI21X1 U364 ( .A0(n1389), .A1(n1417), .B0(n1390), .Y(n1376) );
  INVXL U365 ( .A(n1905), .Y(n1931) );
  XOR2XL U366 ( .A(n627), .B(n626), .Y(\UFIRROOT/UFIR/Reg7_d[13] ) );
  XOR2XL U367 ( .A(n1158), .B(n1157), .Y(\UFIRROOT/UFIR/Reg4_d[5] ) );
  XOR2XL U368 ( .A(n1069), .B(n1068), .Y(\UFIRROOT/UFIR/Reg3_d[5] ) );
  XOR2XL U369 ( .A(n2005), .B(n2004), .Y(\UFIRROOT/UFIR/Reg2_d[5] ) );
  XOR2XL U370 ( .A(n780), .B(n739), .Y(\UFIRROOT/UFIR/Reg1_d[8] ) );
  INVXL U371 ( .A(n628), .Y(n631) );
  INVX2 U372 ( .A(n218), .Y(n1712) );
  INVX2 U373 ( .A(n215), .Y(n1709) );
  AND3X4 U374 ( .A(data_2[3]), .B(PEbar), .C(data_1[3]), .Y(n193) );
  INVX2 U375 ( .A(n217), .Y(n1711) );
  INVX2 U376 ( .A(n236), .Y(n1730) );
  INVX2 U377 ( .A(n1730), .Y(n1527) );
  INVX2 U378 ( .A(n200), .Y(n1731) );
  INVX4 U379 ( .A(n1731), .Y(n1462) );
  INVXL U380 ( .A(n663), .Y(n664) );
  NAND2X1 U381 ( .A(m0[0]), .B(n2104), .Y(n2108) );
  NOR2X1 U382 ( .A(n1638), .B(n1650), .Y(n1642) );
  NOR2X1 U383 ( .A(\FIR_out2[1] ), .B(n2050), .Y(n2062) );
  INVX2 U384 ( .A(m0[1]), .Y(n2046) );
  AOI21X1 U385 ( .A0(n1648), .A1(n1594), .B0(n1593), .Y(n1595) );
  OAI21XL U386 ( .A0(n1707), .A1(n1704), .B0(n1705), .Y(n1702) );
  AOI21XL U387 ( .A0(n491), .A1(n214), .B0(n213), .Y(n502) );
  AOI21XL U388 ( .A0(n1974), .A1(n1975), .B0(n1772), .Y(n2009) );
  INVXL U389 ( .A(n695), .Y(n815) );
  NAND2X1 U390 ( .A(n578), .B(n577), .Y(n1928) );
  NOR2X1 U391 ( .A(\UFIRROOT/mult_x_4/n119 ), .B(\UFIRROOT/mult_x_4/n124 ), 
        .Y(n765) );
  NOR2X1 U392 ( .A(n1516), .B(n1515), .Y(n1685) );
  OR2XL U393 ( .A(n1771), .B(n1770), .Y(n1974) );
  OR2X1 U394 ( .A(n1503), .B(n1502), .Y(n1701) );
  OR2XL U395 ( .A(n1204), .B(n1203), .Y(n1404) );
  OR2XL U396 ( .A(n912), .B(n911), .Y(n999) );
  CMPR42X1 U397 ( .A(\UFIRROOT/mult_x_4/n137 ), .B(\UFIRROOT/mult_x_4/n130 ), 
        .C(\UFIRROOT/mult_x_4/n131 ), .D(\UFIRROOT/mult_x_4/n135 ), .ICI(
        \UFIRROOT/mult_x_4/n128 ), .S(\UFIRROOT/mult_x_4/n125 ), .ICO(
        \UFIRROOT/mult_x_4/n123 ), .CO(\UFIRROOT/mult_x_4/n124 ) );
  NAND2XL U398 ( .A(n954), .B(n953), .Y(n1052) );
  NAND2XL U399 ( .A(n607), .B(n606), .Y(n1900) );
  INVXL U400 ( .A(n2050), .Y(n633) );
  ADDFX1 U401 ( .A(n600), .B(n599), .CI(n598), .CO(n609), .S(n606) );
  NAND2XL U402 ( .A(n638), .B(n636), .Y(n632) );
  ADDFX1 U403 ( .A(n597), .B(n596), .CI(n595), .CO(n598), .S(n590) );
  ADDFX1 U404 ( .A(n570), .B(n569), .CI(n568), .CO(n591), .S(n574) );
  AOI222XL U405 ( .A0(n2027), .A1(n2026), .B0(n2027), .B1(n2025), .C0(n2026), 
        .C1(n2025), .Y(n2030) );
  NAND2X1 U406 ( .A(n631), .B(n629), .Y(n630) );
  NOR2X1 U407 ( .A(n325), .B(n332), .Y(n323) );
  NOR2X1 U408 ( .A(n1820), .B(n562), .Y(n561) );
  NOR2X1 U409 ( .A(n1820), .B(n735), .Y(\UFIRROOT/mult_x_4/n234 ) );
  NOR2X1 U410 ( .A(n325), .B(n601), .Y(n563) );
  NOR2X1 U411 ( .A(n195), .B(n1818), .Y(n1858) );
  NOR2X1 U412 ( .A(n1820), .B(n452), .Y(n420) );
  NOR2X1 U413 ( .A(n325), .B(n571), .Y(n514) );
  NOR2X1 U414 ( .A(n325), .B(n541), .Y(n429) );
  NOR2X1 U415 ( .A(n325), .B(n336), .Y(n293) );
  NOR2X1 U416 ( .A(n1820), .B(n451), .Y(n433) );
  NOR2X1 U417 ( .A(n1820), .B(n541), .Y(n540) );
  NOR2X1 U418 ( .A(n901), .B(n562), .Y(n441) );
  NOR2X1 U419 ( .A(n325), .B(n735), .Y(n687) );
  NOR2X1 U420 ( .A(n901), .B(n1575), .Y(n1440) );
  NOR2X1 U421 ( .A(n1820), .B(n601), .Y(n603) );
  NOR2X1 U422 ( .A(n1029), .B(n786), .Y(n770) );
  NOR2X1 U423 ( .A(n195), .B(n905), .Y(n931) );
  NOR2X1 U424 ( .A(n327), .B(n794), .Y(n797) );
  NOR2X1 U425 ( .A(n901), .B(n1819), .Y(n1758) );
  NOR2X1 U426 ( .A(n901), .B(n817), .Y(n677) );
  NOR2X1 U427 ( .A(n901), .B(n974), .Y(n825) );
  NOR2X1 U428 ( .A(n1604), .B(n818), .Y(n701) );
  NOR2X1 U429 ( .A(n1328), .B(n792), .Y(\UFIRROOT/mult_x_4/n202 ) );
  NOR2X1 U430 ( .A(n901), .B(n922), .Y(n925) );
  NOR2X1 U431 ( .A(n1820), .B(n571), .Y(n572) );
  NOR2X1 U432 ( .A(n1820), .B(n817), .Y(\UFIRROOT/mult_x_4/n186 ) );
  NOR2X1 U433 ( .A(n325), .B(n792), .Y(\UFIRROOT/mult_x_4/n205 ) );
  NOR2X1 U434 ( .A(n327), .B(n774), .Y(\UFIRROOT/mult_x_4/n226 ) );
  NOR2X1 U435 ( .A(n195), .B(n974), .Y(n834) );
  NOR2X1 U436 ( .A(n1820), .B(n594), .Y(n593) );
  AOI222XL U437 ( .A0(n2021), .A1(n2020), .B0(n2021), .B1(n2019), .C0(n2020), 
        .C1(n2019), .Y(n2024) );
  INVX1 U438 ( .A(n196), .Y(n1737) );
  INVX3 U439 ( .A(n1730), .Y(n901) );
  INVX4 U440 ( .A(n199), .Y(n200) );
  INVX1 U441 ( .A(FIR_out0_7[1]), .Y(n2086) );
  INVX2 U442 ( .A(n2069), .Y(n669) );
  INVX2 U443 ( .A(n2081), .Y(n2078) );
  INVX1 U444 ( .A(n2057), .Y(n2075) );
  XOR2X1 U445 ( .A(n1954), .B(n1953), .Y(\UFIRROOT/UFIR/Reg2_d[11] ) );
  XOR2X1 U446 ( .A(n1968), .B(n1967), .Y(\UFIRROOT/UFIR/Reg2_d[9] ) );
  XOR2X1 U447 ( .A(n1913), .B(n1912), .Y(\UFIRROOT/UFIR/Reg7_d[11] ) );
  OAI21XL U448 ( .A0(n769), .A1(n717), .B0(n716), .Y(n722) );
  OAI21XL U449 ( .A0(n769), .A1(n751), .B0(n750), .Y(n756) );
  INVXL U450 ( .A(n2052), .Y(n2051) );
  XOR2X1 U451 ( .A(n1431), .B(n1430), .Y(\UFIRROOT/UFIR/Reg5_d[6] ) );
  OAI21X2 U452 ( .A0(n1639), .A1(n1596), .B0(n1595), .Y(n1679) );
  INVX2 U453 ( .A(n1639), .Y(n1683) );
  NAND2X1 U454 ( .A(n2115), .B(n2045), .Y(n2105) );
  OR2X1 U455 ( .A(n2044), .B(m0[3]), .Y(n2045) );
  INVX1 U456 ( .A(n2106), .Y(n2113) );
  AOI21X1 U457 ( .A0(n318), .A1(n1117), .B0(n317), .Y(n1094) );
  NAND2X1 U458 ( .A(m0[2]), .B(n2046), .Y(n2044) );
  NAND2X1 U459 ( .A(n657), .B(n645), .Y(n655) );
  AOI21X1 U460 ( .A0(n1702), .A1(n1701), .B0(n1504), .Y(n1699) );
  NAND2XL U461 ( .A(n1929), .B(n1928), .Y(n1930) );
  OAI21X1 U462 ( .A0(n1158), .A1(n1154), .B0(n1155), .Y(n1117) );
  NOR2X1 U463 ( .A(n1375), .B(n1378), .Y(n1381) );
  OR2X1 U464 ( .A(\FIR_out2[1] ), .B(n628), .Y(n2054) );
  NAND2X1 U465 ( .A(\UFIRROOT/mult_x_4/n119 ), .B(\UFIRROOT/mult_x_4/n124 ), 
        .Y(n766) );
  AOI21X1 U466 ( .A0(n1122), .A1(n1121), .B0(n304), .Y(n1158) );
  AOI21X1 U467 ( .A0(n814), .A1(n815), .B0(n697), .Y(n812) );
  OAI21X1 U468 ( .A0(n1923), .A1(n1928), .B0(n1924), .Y(n1914) );
  OAI21XL U469 ( .A0(n1909), .A1(n1917), .B0(n1910), .Y(n585) );
  AOI21X1 U470 ( .A0(n2017), .A1(n2016), .B0(n628), .Y(\FIR_out2[1] ) );
  NAND2X1 U471 ( .A(\UFIRROOT/mult_x_4/n133 ), .B(\UFIRROOT/mult_x_4/n142 ), 
        .Y(n778) );
  OAI21X1 U472 ( .A0(n650), .A1(\bcd_fir/bin_reg [3]), .B0(n641), .Y(n2017) );
  AOI21XL U473 ( .A0(n741), .A1(n742), .B0(n694), .Y(n695) );
  NAND2X1 U474 ( .A(n1881), .B(n1880), .Y(n1986) );
  INVXL U475 ( .A(n1700), .Y(n1504) );
  OAI21X1 U476 ( .A0(n636), .A1(n639), .B0(n646), .Y(n650) );
  INVX1 U477 ( .A(n1343), .Y(n1353) );
  INVXL U478 ( .A(n986), .Y(n1057) );
  INVXL U479 ( .A(n1056), .Y(n987) );
  INVX1 U480 ( .A(n1048), .Y(n1086) );
  OAI21XL U481 ( .A0(n1900), .A1(n623), .B0(n624), .Y(n616) );
  ADDFX1 U482 ( .A(n1861), .B(n1860), .CI(n1859), .CO(n1882), .S(n1881) );
  INVX1 U483 ( .A(n1631), .Y(n1677) );
  INVX1 U484 ( .A(n621), .Y(n1901) );
  INVX1 U485 ( .A(n1938), .Y(n1983) );
  NAND2X1 U486 ( .A(n633), .B(n636), .Y(n646) );
  OR2XL U487 ( .A(n277), .B(n276), .Y(n1125) );
  NAND2X1 U488 ( .A(n958), .B(n957), .Y(n1056) );
  NAND2X1 U489 ( .A(h0[2]), .B(n2039), .Y(n2037) );
  ADDFX1 U490 ( .A(n519), .B(n518), .CI(n517), .CO(n532), .S(n526) );
  OAI21X1 U491 ( .A0(n632), .A1(n634), .B0(n639), .Y(n2050) );
  NOR2X1 U492 ( .A(n1462), .B(n1778), .Y(n1763) );
  NOR2X1 U493 ( .A(n1462), .B(n1777), .Y(n2014) );
  ADDFHX1 U494 ( .A(n352), .B(n351), .CI(n350), .CO(n369), .S(n365) );
  OR2X1 U495 ( .A(n1348), .B(\UFIRROOT/UFIR/Reg4[14] ), .Y(n1362) );
  ADDFX1 U496 ( .A(n376), .B(n375), .CI(n374), .CO(n381), .S(n368) );
  NOR2X1 U497 ( .A(n1462), .B(n541), .Y(n478) );
  ADDFHX1 U498 ( .A(n1290), .B(n1289), .CI(n1288), .CO(n1298), .S(n1282) );
  NOR2X1 U499 ( .A(n1462), .B(n774), .Y(n688) );
  ADDFX1 U500 ( .A(n482), .B(n481), .CI(n480), .CO(n446), .S(n496) );
  NOR2X1 U501 ( .A(n1462), .B(n922), .Y(n903) );
  NOR2X1 U502 ( .A(n1462), .B(n1830), .Y(n1774) );
  NOR2X1 U503 ( .A(n1462), .B(n571), .Y(n432) );
  NOR2X1 U504 ( .A(n1462), .B(n1482), .Y(n1674) );
  ADDFX1 U505 ( .A(\UFIRROOT/UFIR/Reg6[3] ), .B(n466), .CI(n465), .CO(n484), 
        .S(n487) );
  ADDFX1 U506 ( .A(n423), .B(n422), .CI(n421), .CO(n522), .S(n435) );
  ADDFX1 U507 ( .A(\UFIRROOT/UFIR/Reg6[6] ), .B(n425), .CI(n424), .CO(n523), 
        .S(n427) );
  ADDFX1 U508 ( .A(n545), .B(n544), .CI(n543), .CO(n552), .S(n533) );
  INVX1 U509 ( .A(m1[2]), .Y(n2034) );
  NOR2X1 U510 ( .A(n788), .B(n773), .Y(\UFIRROOT/mult_x_4/n213 ) );
  NOR2X1 U511 ( .A(n921), .B(n974), .Y(n932) );
  NOR2X1 U512 ( .A(n337), .B(n334), .Y(n235) );
  NOR2X1 U513 ( .A(n921), .B(n1028), .Y(n884) );
  NOR2X1 U514 ( .A(n516), .B(n773), .Y(n776) );
  NOR2X1 U515 ( .A(n1822), .B(n922), .Y(n883) );
  NOR2X1 U516 ( .A(n788), .B(n774), .Y(\UFIRROOT/mult_x_4/n229 ) );
  NOR2X1 U517 ( .A(n1822), .B(n1611), .Y(n1607) );
  NOR2X1 U518 ( .A(n921), .B(n922), .Y(n906) );
  NOR2X1 U519 ( .A(n1822), .B(n1327), .Y(n1302) );
  NOR2X1 U520 ( .A(n921), .B(n905), .Y(n909) );
  NOR2X1 U521 ( .A(n793), .B(n601), .Y(n605) );
  NOR2X1 U522 ( .A(n1294), .B(n1339), .Y(n1301) );
  NOR2X1 U523 ( .A(n1831), .B(n1611), .Y(n1615) );
  NOR2X1 U524 ( .A(n1550), .B(n918), .Y(n914) );
  NOR2X1 U525 ( .A(n1550), .B(n1339), .Y(n1293) );
  NOR2X1 U526 ( .A(n1550), .B(n922), .Y(n928) );
  NOR2X1 U527 ( .A(n1483), .B(n1484), .Y(n1470) );
  NOR2X1 U528 ( .A(n921), .B(n920), .Y(n929) );
  NOR2X1 U529 ( .A(n1483), .B(n1528), .Y(n1473) );
  NOR2X1 U530 ( .A(n1294), .B(n918), .Y(n930) );
  NOR2X1 U531 ( .A(n1294), .B(n1327), .Y(n1291) );
  NOR2X1 U532 ( .A(n1822), .B(n1575), .Y(n1564) );
  NOR2X1 U533 ( .A(n1550), .B(n1611), .Y(n1565) );
  NOR2X1 U534 ( .A(n1822), .B(n918), .Y(n933) );
  NOR2X1 U535 ( .A(n201), .B(n900), .Y(n917) );
  NOR2X1 U536 ( .A(n1550), .B(n1254), .Y(n1220) );
  NOR2X1 U537 ( .A(n1483), .B(n332), .Y(n294) );
  NOR2X1 U538 ( .A(n1822), .B(n1210), .Y(n1222) );
  NOR2X1 U539 ( .A(n921), .B(n336), .Y(n274) );
  NOR2X1 U540 ( .A(n1550), .B(n326), .Y(n262) );
  NOR2X1 U541 ( .A(n921), .B(n324), .Y(n253) );
  NOR2X1 U542 ( .A(n1294), .B(n1210), .Y(n1219) );
  NOR2X1 U543 ( .A(n337), .B(n451), .Y(n422) );
  NOR2X1 U544 ( .A(n1483), .B(n334), .Y(n240) );
  NOR2X1 U545 ( .A(n1294), .B(n1254), .Y(n1189) );
  NOR2X1 U546 ( .A(n1550), .B(n562), .Y(n424) );
  NOR2X1 U547 ( .A(n1822), .B(n1211), .Y(n1178) );
  NOR2X1 U548 ( .A(n1483), .B(n1327), .Y(n1179) );
  NOR2X1 U549 ( .A(n200), .B(n334), .Y(n322) );
  NOR2X1 U550 ( .A(n1822), .B(n794), .Y(\UFIRROOT/mult_x_4/n195 ) );
  NOR2X1 U551 ( .A(n921), .B(n1339), .Y(n1166) );
  NOR2X1 U552 ( .A(n325), .B(n324), .Y(n364) );
  NOR2X1 U553 ( .A(n1572), .B(n792), .Y(\UFIRROOT/mult_x_4/n203 ) );
  NOR2X1 U554 ( .A(n1572), .B(n773), .Y(\UFIRROOT/mult_x_4/n211 ) );
  INVX2 U555 ( .A(n1731), .Y(n194) );
  NOR2X1 U556 ( .A(n325), .B(n1210), .Y(n1206) );
  NOR2X1 U557 ( .A(n1340), .B(n1036), .Y(n1044) );
  NOR2X1 U558 ( .A(n1822), .B(n332), .Y(n357) );
  NOR2X1 U559 ( .A(n1831), .B(n452), .Y(n524) );
  NOR2X1 U560 ( .A(n1550), .B(n334), .Y(n358) );
  NOR2X1 U561 ( .A(n1572), .B(n541), .Y(n525) );
  NOR2X1 U562 ( .A(n1572), .B(n1254), .Y(n1172) );
  NOR2X1 U563 ( .A(n1822), .B(n324), .Y(n223) );
  NOR2X1 U564 ( .A(n1822), .B(n1278), .Y(n1257) );
  NOR2X1 U565 ( .A(n1483), .B(n1602), .Y(n1451) );
  NOR2X1 U566 ( .A(n1483), .B(n1611), .Y(n1438) );
  NOR2X1 U567 ( .A(n788), .B(n1778), .Y(n1784) );
  NOR2X1 U568 ( .A(n788), .B(n1777), .Y(n1773) );
  NOR2X1 U569 ( .A(n788), .B(n1484), .Y(n1490) );
  NOR2X1 U570 ( .A(n1483), .B(n1575), .Y(n1494) );
  NOR2X1 U571 ( .A(n1527), .B(n1778), .Y(n1781) );
  NOR2X1 U572 ( .A(n200), .B(n1821), .Y(n1759) );
  NOR2X1 U573 ( .A(n1527), .B(n1484), .Y(n1487) );
  NOR2X1 U574 ( .A(n325), .B(n1562), .Y(n1443) );
  NOR2X1 U575 ( .A(n1822), .B(n1036), .Y(n1032) );
  NOR2X1 U576 ( .A(n1340), .B(n905), .Y(n850) );
  NOR2X1 U577 ( .A(n202), .B(n1819), .Y(n1776) );
  NOR2X1 U578 ( .A(n516), .B(n1562), .Y(n1448) );
  NOR2X1 U579 ( .A(n1550), .B(n1602), .Y(n1555) );
  NOR2X1 U580 ( .A(n1483), .B(n1562), .Y(n1491) );
  NOR2X1 U581 ( .A(n787), .B(n1777), .Y(n1764) );
  NOR2X1 U582 ( .A(n1527), .B(n1552), .Y(n1463) );
  NOR2X1 U583 ( .A(n1831), .B(n1528), .Y(n1551) );
  NOR2X1 U584 ( .A(n1483), .B(n1552), .Y(n1486) );
  NOR2X1 U585 ( .A(n1340), .B(n920), .Y(n973) );
  NOR2X1 U586 ( .A(n1527), .B(n1528), .Y(n1480) );
  NOR2X1 U587 ( .A(n1340), .B(n974), .Y(n1027) );
  NOR2X1 U588 ( .A(n200), .B(n1826), .Y(n1745) );
  NOR2X1 U589 ( .A(n201), .B(n1602), .Y(n1441) );
  NOR2X1 U590 ( .A(n1822), .B(n1484), .Y(n1450) );
  NOR2X1 U591 ( .A(n1340), .B(n922), .Y(n830) );
  NOR2X1 U592 ( .A(n1822), .B(n1821), .Y(n1856) );
  NOR2X1 U593 ( .A(n1527), .B(n1828), .Y(n1848) );
  NOR2X1 U594 ( .A(n921), .B(n1036), .Y(n823) );
  INVX1 U595 ( .A(n1730), .Y(n787) );
  INVX2 U596 ( .A(n1711), .Y(n793) );
  INVX2 U597 ( .A(\bcd_fir/bin_reg [1]), .Y(n667) );
  NOR2X1 U598 ( .A(n216), .B(n328), .Y(n339) );
  NAND2BXL U599 ( .AN(n198), .B(B5[6]), .Y(n196) );
  NOR2X1 U600 ( .A(n216), .B(n601), .Y(n573) );
  NOR2X1 U601 ( .A(n216), .B(n541), .Y(n425) );
  INVX3 U602 ( .A(n193), .Y(n195) );
  INVX2 U603 ( .A(B5[2]), .Y(n1830) );
  INVX2 U604 ( .A(B2[7]), .Y(n1339) );
  INVX2 U605 ( .A(B2[1]), .Y(n1211) );
  INVX2 U606 ( .A(B1[7]), .Y(n1611) );
  INVX2 U607 ( .A(B6[7]), .Y(n818) );
  INVX2 U608 ( .A(B6[6]), .Y(n817) );
  INVX2 U609 ( .A(B6[5]), .Y(n794) );
  INVX2 U610 ( .A(B5[0]), .Y(n1777) );
  INVX2 U611 ( .A(B6[4]), .Y(n792) );
  INVX2 U612 ( .A(B4[2]), .Y(n905) );
  INVX2 U613 ( .A(B4[1]), .Y(n922) );
  INVX2 U614 ( .A(B6[2]), .Y(n786) );
  INVX2 U615 ( .A(B6[0]), .Y(n735) );
  INVX2 U616 ( .A(B3[0]), .Y(n283) );
  INVX2 U617 ( .A(B4[7]), .Y(n1036) );
  INVX2 U618 ( .A(B4[6]), .Y(n1028) );
  INVX2 U619 ( .A(B5[6]), .Y(n1818) );
  INVX2 U620 ( .A(B5[1]), .Y(n1778) );
  INVX2 U621 ( .A(B5[5]), .Y(n1826) );
  INVX2 U622 ( .A(B5[4]), .Y(n1821) );
  INVX2 U623 ( .A(B1[1]), .Y(n1484) );
  INVX1 U624 ( .A(n2066), .Y(n2068) );
  NOR2X1 U625 ( .A(n2066), .B(n2067), .Y(n2065) );
  NOR2X1 U626 ( .A(n2066), .B(\FIR_out0[0] ), .Y(FIR_out0_7[1]) );
  NOR2X2 U627 ( .A(n669), .B(n2071), .Y(n2066) );
  OAI2BB1XL U628 ( .A0N(n2081), .A1N(n2080), .B0(n2079), .Y(n2083) );
  OAI21X2 U629 ( .A0(n671), .A1(n670), .B0(n665), .Y(n2069) );
  NOR2X1 U630 ( .A(n2075), .B(n2058), .Y(n2072) );
  NOR2X1 U631 ( .A(n2073), .B(n2081), .Y(FIR_out1_7[1]) );
  NAND2X2 U632 ( .A(n666), .B(n664), .Y(n665) );
  NOR2X1 U633 ( .A(n2057), .B(n2074), .Y(n2073) );
  INVX1 U634 ( .A(n2074), .Y(n2058) );
  INVX1 U635 ( .A(n671), .Y(n672) );
  XOR2X1 U636 ( .A(n2099), .B(n2051), .Y(n2057) );
  AND2XL U637 ( .A(n2099), .B(n2060), .Y(n2063) );
  NAND2X2 U638 ( .A(n663), .B(n667), .Y(n671) );
  NOR2X1 U639 ( .A(n673), .B(n670), .Y(n674) );
  XOR2X1 U640 ( .A(n1350), .B(n1349), .Y(\UFIRROOT/UFIR/Reg5_d[14] ) );
  XOR2X1 U641 ( .A(n985), .B(n984), .Y(\UFIRROOT/UFIR/Reg3_d[10] ) );
  XOR2X1 U642 ( .A(n1630), .B(n1629), .Y(\UFIRROOT/UFIR/Reg6_d[14] ) );
  XOR2X1 U643 ( .A(n1393), .B(n1392), .Y(\UFIRROOT/UFIR/Reg5_d[9] ) );
  XOR2X1 U644 ( .A(n982), .B(n981), .Y(\UFIRROOT/UFIR/Reg3_d[11] ) );
  XOR2X1 U645 ( .A(n1373), .B(n1372), .Y(\UFIRROOT/UFIR/Reg5_d[10] ) );
  XOR2X1 U646 ( .A(n992), .B(n991), .Y(\UFIRROOT/UFIR/Reg3_d[9] ) );
  XOR2X1 U647 ( .A(n1661), .B(n1660), .Y(\UFIRROOT/UFIR/Reg6_d[9] ) );
  XOR2X1 U648 ( .A(n1386), .B(n1385), .Y(\UFIRROOT/UFIR/Reg5_d[11] ) );
  XOR2X1 U649 ( .A(n1654), .B(n1653), .Y(\UFIRROOT/UFIR/Reg6_d[10] ) );
  XOR2X1 U650 ( .A(n1647), .B(n1646), .Y(\UFIRROOT/UFIR/Reg6_d[11] ) );
  XOR2X1 U651 ( .A(n1624), .B(n1623), .Y(\UFIRROOT/UFIR/Reg6_d[15] ) );
  XOR2X1 U652 ( .A(n412), .B(n209), .Y(\UFIRROOT/UFIR/Reg4_d[14] ) );
  XOR2X1 U653 ( .A(n417), .B(n205), .Y(\UFIRROOT/UFIR/Reg4_d[13] ) );
  XOR2X1 U654 ( .A(n620), .B(n619), .Y(\UFIRROOT/UFIR/Reg7_d[14] ) );
  XOR2X1 U655 ( .A(n406), .B(\UFIRROOT/UFIR/Reg3[15] ), .Y(
        \UFIRROOT/UFIR/Reg4_d[15] ) );
  XOR2X1 U656 ( .A(n1920), .B(n1919), .Y(\UFIRROOT/UFIR/Reg7_d[10] ) );
  XOR2X1 U657 ( .A(n1116), .B(n1115), .Y(\UFIRROOT/UFIR/Reg4_d[9] ) );
  XOR2X1 U658 ( .A(n1103), .B(n1102), .Y(\UFIRROOT/UFIR/Reg4_d[11] ) );
  XOR2X1 U659 ( .A(n1109), .B(n1108), .Y(\UFIRROOT/UFIR/Reg4_d[10] ) );
  XOR2X1 U660 ( .A(n1927), .B(n1926), .Y(\UFIRROOT/UFIR/Reg7_d[9] ) );
  XOR2X1 U661 ( .A(n615), .B(n614), .Y(\UFIRROOT/UFIR/Reg7_d[15] ) );
  XOR2X1 U662 ( .A(n197), .B(n768), .Y(\UFIRROOT/UFIR/Reg1_d[10] ) );
  NAND2X1 U663 ( .A(n2052), .B(n2053), .Y(n2060) );
  XOR2X1 U664 ( .A(n2000), .B(n1999), .Y(\UFIRROOT/UFIR/Reg2_d[6] ) );
  XOR2X1 U665 ( .A(n1064), .B(n1063), .Y(\UFIRROOT/UFIR/Reg3_d[6] ) );
  INVX1 U666 ( .A(n737), .Y(n780) );
  XOR2X1 U667 ( .A(n1694), .B(n1693), .Y(\UFIRROOT/UFIR/Reg6_d[6] ) );
  INVX1 U668 ( .A(n1684), .Y(n1694) );
  INVX1 U669 ( .A(n1990), .Y(n2000) );
  XOR2X1 U670 ( .A(n1148), .B(n1119), .Y(\UFIRROOT/UFIR/Reg4_d[6] ) );
  INVX1 U671 ( .A(n1421), .Y(n1431) );
  INVX1 U672 ( .A(n1050), .Y(n1064) );
  INVX2 U673 ( .A(n1094), .Y(n1145) );
  OAI21X1 U674 ( .A0(n799), .A1(n802), .B0(n800), .Y(n737) );
  NOR2X1 U675 ( .A(n655), .B(\bcd_fir/bin_reg [2]), .Y(n651) );
  NAND2X1 U676 ( .A(n654), .B(n659), .Y(n653) );
  AOI21X1 U677 ( .A0(n806), .A1(n805), .B0(n698), .Y(n802) );
  XOR2X1 U678 ( .A(n1432), .B(n1436), .Y(\UFIRROOT/UFIR/Reg5_d[5] ) );
  XOR2X1 U679 ( .A(n1699), .B(n1698), .Y(\UFIRROOT/UFIR/Reg6_d[5] ) );
  INVX1 U680 ( .A(n1117), .Y(n1148) );
  OAI21XL U681 ( .A0(n1906), .A1(n1916), .B0(n1917), .Y(n1907) );
  NOR2X1 U682 ( .A(m0[2]), .B(n2046), .Y(n2106) );
  AOI21X1 U683 ( .A0(n657), .A1(n650), .B0(n649), .Y(n654) );
  NAND2XL U684 ( .A(n1925), .B(n1924), .Y(n1926) );
  NAND2XL U685 ( .A(n1918), .B(n1917), .Y(n1919) );
  NOR2X1 U686 ( .A(n765), .B(n723), .Y(n757) );
  XOR2X1 U687 ( .A(n812), .B(n811), .Y(\UFIRROOT/UFIR/Reg1_d[5] ) );
  NOR2X1 U688 ( .A(n1945), .B(n1957), .Y(n1949) );
  OAI21X1 U689 ( .A0(n812), .A1(n808), .B0(n809), .Y(n806) );
  AOI21X1 U690 ( .A0(n1396), .A1(n1395), .B0(n1231), .Y(n1432) );
  NAND2XL U691 ( .A(n762), .B(n761), .Y(n763) );
  NOR2X1 U692 ( .A(\UFIRROOT/mult_x_4/n118 ), .B(\UFIRROOT/mult_x_4/n114 ), 
        .Y(n723) );
  INVX1 U693 ( .A(n713), .Y(n762) );
  NOR2X1 U694 ( .A(n713), .B(n752), .Y(n715) );
  OAI21XL U695 ( .A0(n963), .A1(n1012), .B0(n1015), .Y(n964) );
  NOR2X1 U696 ( .A(n1957), .B(n1950), .Y(n1889) );
  NOR2X1 U697 ( .A(n1093), .B(n1105), .Y(n1098) );
  NOR2X1 U698 ( .A(n1378), .B(n1382), .Y(n1319) );
  NOR2X1 U699 ( .A(\UFIRROOT/mult_x_4/n113 ), .B(\UFIRROOT/mult_x_4/n111 ), 
        .Y(n713) );
  OAI21XL U700 ( .A0(n476), .A1(n475), .B0(n474), .Y(n491) );
  OAI21X1 U701 ( .A0(n1162), .A1(n1159), .B0(n1160), .Y(n1122) );
  NOR2X1 U702 ( .A(\UFIRROOT/mult_x_4/n143 ), .B(\UFIRROOT/mult_x_4/n152 ), 
        .Y(n799) );
  INVX1 U703 ( .A(m0[3]), .Y(n2112) );
  NOR2X1 U704 ( .A(m0[3]), .B(n2115), .Y(n2047) );
  NAND2XL U705 ( .A(n1911), .B(n1910), .Y(n1912) );
  NAND2X1 U706 ( .A(n1311), .B(n1310), .Y(n1417) );
  NAND2XL U707 ( .A(n1901), .B(n1900), .Y(n1902) );
  NOR2X1 U708 ( .A(n1586), .B(n1585), .Y(n1655) );
  OAI21XL U709 ( .A0(n1407), .A1(n1410), .B0(n1408), .Y(n1405) );
  AND2XL U710 ( .A(n1626), .B(n1628), .Y(n1622) );
  AOI21X1 U711 ( .A0(n1019), .A1(n1018), .B0(n1017), .Y(n1020) );
  OAI2BB1XL U712 ( .A0N(n1628), .A1N(n1625), .B0(n1627), .Y(n1621) );
  NOR2X1 U713 ( .A(n1881), .B(n1880), .Y(n1962) );
  ADDFHX2 U714 ( .A(n548), .B(n547), .CI(n546), .CO(n579), .S(n578) );
  OR2X1 U715 ( .A(\UFIRROOT/mult_x_4/n153 ), .B(\UFIRROOT/mult_x_4/n160 ), .Y(
        n805) );
  AND2XL U716 ( .A(n1074), .B(n1077), .Y(n1081) );
  AOI21X1 U717 ( .A0(n1095), .A1(n395), .B0(n394), .Y(n396) );
  AOI21XL U718 ( .A0(n616), .A1(n212), .B0(n611), .Y(n612) );
  NOR2X2 U719 ( .A(n1885), .B(n1884), .Y(n1957) );
  NOR2X1 U720 ( .A(n927), .B(n926), .Y(n993) );
  OAI21XL U721 ( .A0(n1002), .A1(n1005), .B0(n1003), .Y(n1000) );
  NAND2XL U722 ( .A(n504), .B(n503), .Y(n508) );
  NAND2XL U723 ( .A(n1356), .B(n1355), .Y(n1357) );
  INVXL U724 ( .A(n1070), .Y(n942) );
  NAND2XL U725 ( .A(n499), .B(n498), .Y(n500) );
  OAI21XL U726 ( .A0(n1128), .A1(n1131), .B0(n1129), .Y(n1126) );
  NOR2X1 U727 ( .A(n1343), .B(n1354), .Y(n1359) );
  NAND2XL U728 ( .A(n754), .B(n753), .Y(n755) );
  NAND2XL U729 ( .A(n1942), .B(n1941), .Y(n1943) );
  NOR2X1 U730 ( .A(n621), .B(n623), .Y(n617) );
  NOR2X1 U731 ( .A(n289), .B(n288), .Y(n1159) );
  NOR2X1 U732 ( .A(n1048), .B(n1088), .Y(n1074) );
  NAND2XL U733 ( .A(n1635), .B(n1634), .Y(n1636) );
  NAND2XL U734 ( .A(n1090), .B(n1089), .Y(n1091) );
  OR2XL U735 ( .A(n1476), .B(n1475), .Y(n1663) );
  OAI21XL U736 ( .A0(n1666), .A1(n1669), .B0(n1667), .Y(n1664) );
  NOR2X1 U737 ( .A(n1489), .B(n1488), .Y(n1704) );
  NAND2XL U738 ( .A(n1489), .B(n1488), .Y(n1705) );
  NOR2X1 U739 ( .A(n1512), .B(n1511), .Y(n1695) );
  NAND2X1 U740 ( .A(n1512), .B(n1511), .Y(n1696) );
  NOR2X1 U741 ( .A(n1810), .B(n1809), .Y(n1991) );
  ADDFHX2 U742 ( .A(n531), .B(n530), .CI(n529), .CO(n577), .S(n506) );
  NOR2X1 U743 ( .A(n1631), .B(n1633), .Y(n1626) );
  NAND2XL U744 ( .A(n625), .B(n624), .Y(n626) );
  NOR2X1 U745 ( .A(n1938), .B(n1940), .Y(n1933) );
  ADDFHX2 U746 ( .A(n537), .B(n536), .CI(n535), .CO(n550), .S(n546) );
  NOR2X1 U747 ( .A(n1216), .B(n1215), .Y(n1398) );
  NOR2X1 U748 ( .A(n1040), .B(n1039), .Y(n1048) );
  OR2X1 U749 ( .A(\UFIRROOT/mult_x_4/n168 ), .B(n696), .Y(n814) );
  NOR2X1 U750 ( .A(n691), .B(n690), .Y(n744) );
  NOR2X1 U751 ( .A(n1333), .B(n1332), .Y(n1343) );
  NOR2X1 U752 ( .A(\UFIRROOT/mult_x_4/n161 ), .B(\UFIRROOT/mult_x_4/n167 ), 
        .Y(n808) );
  NAND2XL U753 ( .A(n584), .B(n583), .Y(n1910) );
  NOR2X1 U754 ( .A(n752), .B(n718), .Y(n707) );
  ADDFX1 U755 ( .A(n439), .B(n438), .CI(n437), .CO(n505), .S(n504) );
  ADDFX1 U756 ( .A(n497), .B(n496), .CI(n495), .CO(n498), .S(n490) );
  NOR2X1 U757 ( .A(n1317), .B(n1316), .Y(n1382) );
  ADDFX1 U758 ( .A(n488), .B(n487), .CI(n486), .CO(n489), .S(n473) );
  NOR2X1 U759 ( .A(n954), .B(n953), .Y(n1051) );
  NOR2X1 U760 ( .A(n1474), .B(n1473), .Y(n1666) );
  ADDFX1 U761 ( .A(n301), .B(n300), .CI(n299), .CO(n302), .S(n289) );
  NOR2X1 U762 ( .A(n1769), .B(n1768), .Y(n1977) );
  NOR2X1 U763 ( .A(n399), .B(n398), .Y(n413) );
  NOR2X1 U764 ( .A(n1202), .B(n1201), .Y(n1407) );
  ADDFX1 U765 ( .A(n925), .B(n924), .CI(n923), .CO(n926), .S(n912) );
  NOR2X1 U766 ( .A(n1893), .B(n1892), .Y(n1938) );
  ADDFX1 U767 ( .A(n1487), .B(n1486), .CI(n1485), .CO(n1488), .S(n1476) );
  NOR2X1 U768 ( .A(n1592), .B(n1591), .Y(n1643) );
  ADDFHX2 U769 ( .A(n1546), .B(n1545), .CI(n1544), .CO(n1580), .S(n1538) );
  NOR2X1 U770 ( .A(n957), .B(n958), .Y(n986) );
  NOR2X1 U771 ( .A(n1617), .B(n1616), .Y(n1631) );
  NOR2X1 U772 ( .A(n1887), .B(n1886), .Y(n1950) );
  INVX1 U773 ( .A(n641), .Y(n644) );
  NOR2X1 U774 ( .A(h0[0]), .B(n2126), .Y(n2036) );
  NOR2X1 U775 ( .A(h0[2]), .B(n2039), .Y(n2120) );
  NOR2X1 U776 ( .A(n1042), .B(n1041), .Y(n1088) );
  NAND2XL U777 ( .A(n1077), .B(n1075), .Y(n1046) );
  NAND2XL U778 ( .A(n1935), .B(n1934), .Y(n1936) );
  ADDFX1 U779 ( .A(n1599), .B(n1598), .CI(n1597), .CO(n1617), .S(n1591) );
  ADDFX1 U780 ( .A(\UFIRROOT/UFIR/Reg1[1] ), .B(n1764), .CI(n1763), .CO(n1779), 
        .S(n1769) );
  ADDFX1 U781 ( .A(\UFIRROOT/UFIR/Reg2[1] ), .B(n904), .CI(n903), .CO(n923), 
        .S(n910) );
  NOR2X1 U782 ( .A(n1619), .B(n1618), .Y(n1633) );
  NAND2XL U783 ( .A(n609), .B(n608), .Y(n624) );
  NAND2XL U784 ( .A(n212), .B(n618), .Y(n619) );
  NOR2X1 U785 ( .A(n609), .B(n608), .Y(n623) );
  ADDFX1 U786 ( .A(n287), .B(n286), .CI(n285), .CO(n288), .S(n277) );
  NOR2X1 U787 ( .A(n1345), .B(n1344), .Y(n1354) );
  ADDFX1 U788 ( .A(\UFIRROOT/UFIR/Reg4[1] ), .B(n1197), .CI(n1196), .CO(n1212), 
        .S(n1202) );
  ADDFX1 U789 ( .A(n346), .B(n345), .CI(n344), .CO(n386), .S(n316) );
  ADDFX1 U790 ( .A(\UFIRROOT/UFIR/Reg5[1] ), .B(n1469), .CI(n1468), .CO(n1485), 
        .S(n1474) );
  ADDFHX1 U791 ( .A(n447), .B(n446), .CI(n445), .CO(n438), .S(n492) );
  NOR2X1 U792 ( .A(n1895), .B(n1894), .Y(n1940) );
  NOR2X1 U793 ( .A(m1[1]), .B(n2034), .Y(n2116) );
  NOR2X1 U794 ( .A(h0[3]), .B(n2129), .Y(n2040) );
  INVX1 U795 ( .A(h0[3]), .Y(n2126) );
  INVX1 U796 ( .A(h0[1]), .Y(n2039) );
  NOR2X1 U797 ( .A(n1462), .B(n1211), .Y(n1196) );
  NOR2X1 U798 ( .A(n902), .B(n794), .Y(n682) );
  NOR2X1 U799 ( .A(n1462), .B(n1210), .Y(n1415) );
  ADDFX1 U800 ( .A(n231), .B(n230), .CI(n229), .CO(n401), .S(n398) );
  NAND2XL U801 ( .A(n610), .B(\UFIRROOT/UFIR/Reg6[14] ), .Y(n618) );
  NOR2X1 U802 ( .A(n1462), .B(n601), .Y(n517) );
  NOR2X1 U803 ( .A(n1462), .B(n1484), .Y(n1468) );
  NOR2X1 U804 ( .A(n705), .B(n704), .Y(n718) );
  OR2X1 U805 ( .A(n1045), .B(\UFIRROOT/UFIR/Reg2[14] ), .Y(n1077) );
  ADDFX1 U806 ( .A(\UFIRROOT/UFIR/Reg3[1] ), .B(n270), .CI(n269), .CO(n285), 
        .S(n275) );
  ADDFX1 U807 ( .A(n1338), .B(n1337), .CI(n1336), .CO(n1345), .S(n1332) );
  OR2X1 U808 ( .A(n610), .B(\UFIRROOT/UFIR/Reg6[14] ), .Y(n212) );
  ADDFX1 U809 ( .A(n433), .B(n432), .CI(n431), .CO(n426), .S(n445) );
  NOR2X1 U810 ( .A(n467), .B(n773), .Y(n734) );
  NOR2X1 U811 ( .A(n1195), .B(n792), .Y(n684) );
  NOR2X1 U812 ( .A(n467), .B(n562), .Y(n481) );
  NOR2X1 U813 ( .A(n1462), .B(n786), .Y(n732) );
  NOR2X1 U814 ( .A(n1462), .B(n905), .Y(n915) );
  NOR2X1 U815 ( .A(n467), .B(n283), .Y(n1136) );
  NOR2X1 U816 ( .A(n1462), .B(n735), .Y(n729) );
  ADDFX2 U817 ( .A(n1531), .B(n1530), .CI(n1529), .CO(n1545), .S(n1525) );
  NOR2X1 U818 ( .A(n1462), .B(n515), .Y(n471) );
  NOR2X1 U819 ( .A(n1462), .B(n918), .Y(n1010) );
  NOR2X1 U820 ( .A(n1462), .B(n284), .Y(n269) );
  ADDFX1 U821 ( .A(\UFIRROOT/UFIR/Reg6[13] ), .B(n605), .CI(n604), .CO(n610), 
        .S(n608) );
  NOR2X1 U822 ( .A(n194), .B(n1828), .Y(n1816) );
  NOR2X1 U823 ( .A(n1195), .B(n1339), .Y(n1249) );
  ADDFX1 U824 ( .A(n702), .B(n701), .CI(\UFIRROOT/mult_x_4/n109 ), .CO(n705), 
        .S(n703) );
  ADDFX1 U825 ( .A(\UFIRROOT/UFIR/Reg4[13] ), .B(n1347), .CI(n1346), .CO(n1348), .S(n1344) );
  ADDFX1 U826 ( .A(n936), .B(n935), .CI(n934), .CO(n944), .S(n946) );
  ADDFX1 U827 ( .A(\UFIRROOT/UFIR/Reg2[13] ), .B(n1044), .CI(n1043), .CO(n1045), .S(n1041) );
  ADDFX1 U828 ( .A(\UFIRROOT/UFIR/Reg5[13] ), .B(n1615), .CI(n1614), .CO(n1620), .S(n1618) );
  NOR2X1 U829 ( .A(n467), .B(n818), .Y(n676) );
  NOR2X1 U830 ( .A(n1462), .B(n817), .Y(n821) );
  ADDFX2 U831 ( .A(n525), .B(n524), .CI(n523), .CO(n536), .S(n521) );
  ADDFX1 U832 ( .A(n865), .B(n864), .CI(n863), .CO(n968), .S(n866) );
  ADDFX1 U833 ( .A(n373), .B(n372), .CI(n371), .CO(n382), .S(n374) );
  ADDFX1 U834 ( .A(n1257), .B(n1256), .CI(n1255), .CO(n1271), .S(n1252) );
  ADDFX1 U835 ( .A(\UFIRROOT/UFIR/Reg3[13] ), .B(n235), .CI(n234), .CO(n402), 
        .S(n400) );
  ADDFX1 U836 ( .A(n880), .B(n879), .CI(n878), .CO(n835), .S(n891) );
  ADDFX1 U837 ( .A(\UFIRROOT/UFIR/Reg1[13] ), .B(n1729), .CI(n1728), .CO(n1896), .S(n1894) );
  ADDFX1 U838 ( .A(n840), .B(n839), .CI(n838), .CO(n855), .S(n836) );
  ADDFX1 U839 ( .A(n1175), .B(n1174), .CI(n1173), .CO(n1251), .S(n1186) );
  ADDFX1 U840 ( .A(\UFIRROOT/UFIR/Reg3[3] ), .B(n282), .CI(n281), .CO(n297), 
        .S(n300) );
  ADDFX1 U841 ( .A(n834), .B(n833), .CI(n832), .CO(n845), .S(n841) );
  ADDFX1 U842 ( .A(\UFIRROOT/UFIR/Reg2[10] ), .B(n973), .CI(n972), .CO(n1031), 
        .S(n977) );
  NOR2X1 U843 ( .A(n271), .B(\UFIRROOT/UFIR/Reg3[0] ), .Y(n1133) );
  ADDFX1 U844 ( .A(\UFIRROOT/UFIR/Reg5[3] ), .B(n1481), .CI(n1480), .CO(n1497), 
        .S(n1500) );
  ADDFX1 U845 ( .A(\UFIRROOT/UFIR/Reg6[5] ), .B(n430), .CI(n429), .CO(n428), 
        .S(n447) );
  ADDFX1 U846 ( .A(\UFIRROOT/UFIR/Reg6[2] ), .B(n464), .CI(n463), .CO(n488), 
        .S(n460) );
  NOR2X1 U847 ( .A(n906), .B(\UFIRROOT/UFIR/Reg2[0] ), .Y(n1007) );
  ADDFX1 U848 ( .A(\UFIRROOT/UFIR/Reg6[12] ), .B(n603), .CI(n602), .CO(n604), 
        .S(n599) );
  ADDFX1 U849 ( .A(\UFIRROOT/UFIR/Reg5[12] ), .B(n1613), .CI(n1612), .CO(n1614), .S(n1609) );
  NOR2X1 U850 ( .A(n1470), .B(\UFIRROOT/UFIR/Reg5[0] ), .Y(n1671) );
  ADDFX1 U851 ( .A(\UFIRROOT/UFIR/Reg5[2] ), .B(n1479), .CI(n1478), .CO(n1501), 
        .S(n1475) );
  NOR2X1 U852 ( .A(n1198), .B(\UFIRROOT/UFIR/Reg4[0] ), .Y(n1412) );
  ADDFX2 U853 ( .A(n561), .B(n560), .CI(n559), .CO(n575), .S(n556) );
  NOR2X1 U854 ( .A(n1765), .B(\UFIRROOT/UFIR/Reg1[0] ), .Y(n2011) );
  ADDFX1 U855 ( .A(\UFIRROOT/UFIR/Reg1[12] ), .B(n1727), .CI(n1726), .CO(n1728), .S(n1724) );
  ADDFX1 U856 ( .A(\UFIRROOT/UFIR/Reg3[7] ), .B(n320), .CI(n319), .CO(n349), 
        .S(n343) );
  ADDFX1 U857 ( .A(\UFIRROOT/UFIR/Reg4[5] ), .B(n1177), .CI(n1176), .CO(n1175), 
        .S(n1194) );
  ADDFX1 U858 ( .A(\UFIRROOT/UFIR/Reg2[12] ), .B(n1038), .CI(n1037), .CO(n1043), .S(n1034) );
  ADDFX1 U859 ( .A(\UFIRROOT/UFIR/Reg2[5] ), .B(n882), .CI(n881), .CO(n880), 
        .S(n899) );
  ADDFX1 U860 ( .A(\UFIRROOT/UFIR/Reg5[5] ), .B(n1449), .CI(n1448), .CO(n1447), 
        .S(n1467) );
  ADDFX1 U861 ( .A(n824), .B(n823), .CI(n822), .CO(n837), .S(n887) );
  ADDFX1 U862 ( .A(\UFIRROOT/UFIR/Reg2[4] ), .B(n896), .CI(n895), .CO(n892), 
        .S(n934) );
  ADDFX1 U863 ( .A(\UFIRROOT/UFIR/Reg3[12] ), .B(n233), .CI(n232), .CO(n234), 
        .S(n230) );
  NOR2X1 U864 ( .A(n1527), .B(n920), .Y(n881) );
  NOR2X1 U865 ( .A(n819), .B(n1278), .Y(n1213) );
  NOR2X1 U866 ( .A(n335), .B(n792), .Y(\UFIRROOT/mult_x_4/n206 ) );
  NOR2X1 U867 ( .A(n1831), .B(n1830), .Y(n1853) );
  NOR2X1 U868 ( .A(n1527), .B(n601), .Y(n543) );
  NOR2X1 U869 ( .A(n819), .B(n1254), .Y(n1201) );
  NOR2X1 U870 ( .A(n1831), .B(n515), .Y(n544) );
  NOR2X1 U871 ( .A(n333), .B(n786), .Y(\UFIRROOT/mult_x_4/n220 ) );
  NOR2X1 U872 ( .A(n1029), .B(n918), .Y(n885) );
  NOR2X1 U873 ( .A(n736), .B(n774), .Y(\UFIRROOT/mult_x_4/n227 ) );
  NOR2X1 U874 ( .A(n819), .B(n1211), .Y(n1198) );
  NOR2X1 U875 ( .A(n1276), .B(n594), .Y(n545) );
  NOR2X1 U876 ( .A(n1566), .B(n571), .Y(n542) );
  NOR2X1 U877 ( .A(n1527), .B(n1211), .Y(n1214) );
  NOR2X1 U878 ( .A(n195), .B(n786), .Y(n777) );
  NOR2X1 U879 ( .A(n819), .B(n794), .Y(n683) );
  NOR2X1 U880 ( .A(n558), .B(n774), .Y(n775) );
  NOR2X1 U881 ( .A(n1527), .B(n1210), .Y(n1197) );
  NOR2X1 U882 ( .A(n793), .B(n541), .Y(n559) );
  NOR2X1 U883 ( .A(n819), .B(n773), .Y(n731) );
  NOR2X1 U884 ( .A(n1303), .B(n571), .Y(n560) );
  NOR2X1 U885 ( .A(n1328), .B(n1327), .Y(n1325) );
  NOR2X1 U886 ( .A(n1831), .B(n1575), .Y(n1601) );
  NOR2X1 U887 ( .A(n1566), .B(n735), .Y(\UFIRROOT/mult_x_4/n236 ) );
  NOR2X1 U888 ( .A(n819), .B(n786), .Y(n690) );
  NOR2X1 U889 ( .A(n819), .B(n774), .Y(n728) );
  NOR2X1 U890 ( .A(n333), .B(n1818), .Y(n1850) );
  NOR2X1 U891 ( .A(n819), .B(n792), .Y(n733) );
  NOR2X1 U892 ( .A(n1029), .B(n1036), .Y(n1037) );
  NOR2X1 U893 ( .A(n1328), .B(n1339), .Y(n1341) );
  NOR2X1 U894 ( .A(n337), .B(n562), .Y(n569) );
  NOR2X1 U895 ( .A(n335), .B(n735), .Y(n689) );
  NOR2X1 U896 ( .A(n736), .B(n594), .Y(n570) );
  NOR2X1 U897 ( .A(n1604), .B(n1602), .Y(n1600) );
  NOR2X1 U898 ( .A(n1603), .B(n1602), .Y(n1613) );
  NOR2X1 U899 ( .A(n333), .B(n1306), .Y(n1275) );
  NOR2X1 U900 ( .A(n1604), .B(n1611), .Y(n1612) );
  NOR2X1 U901 ( .A(n1831), .B(n571), .Y(n597) );
  NOR2X1 U902 ( .A(n202), .B(n920), .Y(n896) );
  NOR2X1 U903 ( .A(n1831), .B(n1562), .Y(n1574) );
  NOR2X1 U904 ( .A(n1831), .B(n1819), .Y(n1855) );
  NOR2X1 U905 ( .A(n1604), .B(n1575), .Y(n1573) );
  NOR2X1 U906 ( .A(n335), .B(n918), .Y(n904) );
  NOR2X1 U907 ( .A(n1566), .B(n1828), .Y(n1716) );
  NOR2X1 U908 ( .A(n736), .B(n1602), .Y(n1571) );
  NOR2X1 U909 ( .A(n1340), .B(n1278), .Y(n1296) );
  NOR2X1 U910 ( .A(n333), .B(n1611), .Y(n1570) );
  NOR2X1 U911 ( .A(n1328), .B(n1164), .Y(n1295) );
  NOR2X1 U912 ( .A(n335), .B(n900), .Y(n895) );
  NOR2X1 U913 ( .A(n1328), .B(n1278), .Y(n1280) );
  NOR2X1 U914 ( .A(n333), .B(n1602), .Y(n1563) );
  NOR2X1 U915 ( .A(n1831), .B(n1828), .Y(n1729) );
  NOR2X1 U916 ( .A(n195), .B(n1327), .Y(n1281) );
  NOR2X1 U917 ( .A(n1831), .B(n1818), .Y(n1727) );
  NOR2X1 U918 ( .A(n1820), .B(n1828), .Y(n1726) );
  NOR2X1 U919 ( .A(n1527), .B(n905), .Y(n916) );
  NOR2X1 U920 ( .A(n1566), .B(n922), .Y(n936) );
  NOR2X1 U921 ( .A(n1831), .B(n1826), .Y(n1719) );
  NOR2X1 U922 ( .A(n1820), .B(n1818), .Y(n1718) );
  NOR2X1 U923 ( .A(n736), .B(n1828), .Y(n1722) );
  NOR2X1 U924 ( .A(n468), .B(n328), .Y(n291) );
  NOR2X1 U925 ( .A(n468), .B(n515), .Y(n455) );
  NOR2X1 U926 ( .A(n1566), .B(n283), .Y(n292) );
  NOR2X1 U927 ( .A(n195), .B(n451), .Y(n464) );
  NOR2X1 U928 ( .A(n468), .B(n1306), .Y(n1221) );
  NOR2X1 U929 ( .A(n468), .B(n562), .Y(n477) );
  NOR2X1 U930 ( .A(n468), .B(n452), .Y(n454) );
  NOR2X1 U931 ( .A(n335), .B(n284), .Y(n287) );
  NOR2X1 U932 ( .A(n1566), .B(n284), .Y(n298) );
  NOR2X1 U933 ( .A(n558), .B(n451), .Y(n466) );
  NOR2X1 U934 ( .A(n795), .B(n1211), .Y(n1225) );
  NOR2X1 U935 ( .A(n1483), .B(n326), .Y(n286) );
  NOR2X1 U936 ( .A(n1527), .B(n283), .Y(n270) );
  NOR2X1 U937 ( .A(n736), .B(n283), .Y(n295) );
  NOR2X1 U938 ( .A(n468), .B(n571), .Y(n480) );
  NOR2X1 U939 ( .A(n1303), .B(n451), .Y(n482) );
  NOR2X1 U940 ( .A(n335), .B(n326), .Y(n264) );
  NOR2X1 U941 ( .A(n201), .B(n328), .Y(n265) );
  NOR2X1 U942 ( .A(n736), .B(n452), .Y(n442) );
  NOR2X1 U943 ( .A(n468), .B(n284), .Y(n271) );
  NOR2X1 U944 ( .A(n1566), .B(n336), .Y(n263) );
  NOR2X1 U945 ( .A(n468), .B(n594), .Y(n431) );
  NOR2X1 U946 ( .A(n327), .B(n283), .Y(n254) );
  NOR2X1 U947 ( .A(n327), .B(n284), .Y(n239) );
  NOR2X1 U948 ( .A(n1276), .B(n1278), .Y(n1188) );
  NOR2X1 U949 ( .A(n468), .B(n601), .Y(n418) );
  NOR2X1 U950 ( .A(n337), .B(n283), .Y(n241) );
  NOR2X1 U951 ( .A(n819), .B(n1164), .Y(n1218) );
  NOR2X1 U952 ( .A(n1276), .B(n1211), .Y(n1217) );
  NOR2X1 U953 ( .A(n1303), .B(n326), .Y(n340) );
  NOR2X1 U954 ( .A(n327), .B(n336), .Y(n321) );
  NOR2X1 U955 ( .A(n793), .B(n818), .Y(n704) );
  NOR2X1 U956 ( .A(n793), .B(n817), .Y(n702) );
  NOR2X1 U957 ( .A(n793), .B(n794), .Y(\UFIRROOT/mult_x_4/n193 ) );
  NOR2X1 U958 ( .A(n1303), .B(n818), .Y(\UFIRROOT/mult_x_4/n179 ) );
  NOR2X1 U959 ( .A(n1328), .B(n1210), .Y(n1180) );
  NOR2X1 U960 ( .A(n337), .B(n284), .Y(n319) );
  NOR2X1 U961 ( .A(n1829), .B(n324), .Y(n320) );
  NOR2X1 U962 ( .A(n195), .B(n818), .Y(\UFIRROOT/mult_x_4/n181 ) );
  NOR2X1 U963 ( .A(n793), .B(n773), .Y(\UFIRROOT/mult_x_4/n209 ) );
  NOR2X1 U964 ( .A(n793), .B(n792), .Y(n798) );
  NOR2X1 U965 ( .A(n333), .B(n818), .Y(n796) );
  NOR2X1 U966 ( .A(n1328), .B(n1211), .Y(n1165) );
  NOR2X1 U967 ( .A(n327), .B(n326), .Y(n363) );
  NOR2X1 U968 ( .A(n1566), .B(n817), .Y(\UFIRROOT/mult_x_4/n188 ) );
  NOR2X1 U969 ( .A(n333), .B(n794), .Y(\UFIRROOT/mult_x_4/n196 ) );
  NOR2X1 U970 ( .A(n327), .B(n773), .Y(\UFIRROOT/mult_x_4/n210 ) );
  NOR2X1 U971 ( .A(n337), .B(n336), .Y(n359) );
  NOR2X1 U972 ( .A(n1276), .B(n794), .Y(\UFIRROOT/mult_x_4/n197 ) );
  NOR2X1 U973 ( .A(n333), .B(n324), .Y(n356) );
  NOR2X1 U974 ( .A(n558), .B(n1278), .Y(n1170) );
  NOR2X1 U975 ( .A(n793), .B(n786), .Y(n791) );
  NOR2X1 U976 ( .A(n335), .B(n818), .Y(n790) );
  NOR2X1 U977 ( .A(n1276), .B(n817), .Y(n789) );
  NOR2X1 U978 ( .A(n327), .B(n328), .Y(n360) );
  NOR2X1 U979 ( .A(n195), .B(n1164), .Y(n1171) );
  NOR2X1 U980 ( .A(n333), .B(n334), .Y(n222) );
  NOR2X1 U981 ( .A(n1820), .B(n515), .Y(n519) );
  NOR2X1 U982 ( .A(n558), .B(n792), .Y(n772) );
  NOR2X1 U983 ( .A(n793), .B(n774), .Y(n771) );
  NOR2X1 U984 ( .A(n1527), .B(n1306), .Y(n1168) );
  NOR2X1 U985 ( .A(n327), .B(n332), .Y(n219) );
  NOR2X1 U986 ( .A(n819), .B(n818), .Y(n820) );
  NOR2X1 U987 ( .A(n337), .B(n328), .Y(n220) );
  NOR2X1 U988 ( .A(n1827), .B(n773), .Y(n680) );
  NOR2X1 U989 ( .A(n558), .B(n1164), .Y(n1256) );
  NOR2X1 U990 ( .A(n793), .B(n735), .Y(n679) );
  NOR2X1 U991 ( .A(n335), .B(n794), .Y(n678) );
  NOR2X1 U992 ( .A(n327), .B(n334), .Y(n232) );
  NOR2X1 U993 ( .A(n819), .B(n817), .Y(n681) );
  NOR2X1 U994 ( .A(n1328), .B(n1254), .Y(n1248) );
  NOR2X1 U995 ( .A(n337), .B(n324), .Y(n233) );
  NOR2X1 U996 ( .A(n327), .B(n324), .Y(n224) );
  NOR2X1 U997 ( .A(n333), .B(n562), .Y(n513) );
  NOR2X1 U998 ( .A(n337), .B(n332), .Y(n225) );
  NOR2X1 U999 ( .A(n1527), .B(n1339), .Y(n1274) );
  NOR2X1 U1000 ( .A(n1604), .B(n1484), .Y(n1437) );
  NOR2X1 U1001 ( .A(n1294), .B(n1552), .Y(n1442) );
  NOR2X1 U1002 ( .A(n195), .B(n1528), .Y(n1493) );
  NOR2X1 U1003 ( .A(n1276), .B(n1552), .Y(n1460) );
  NOR2X1 U1004 ( .A(n819), .B(n1818), .Y(n1747) );
  NOR2X1 U1005 ( .A(n1603), .B(n1482), .Y(n1439) );
  NOR2X1 U1006 ( .A(n1822), .B(n920), .Y(n851) );
  NOR2X1 U1007 ( .A(n736), .B(n1778), .Y(n1746) );
  NOR2X1 U1008 ( .A(n1566), .B(n1575), .Y(n1549) );
  NOR2X1 U1009 ( .A(n1029), .B(n900), .Y(n852) );
  NOR2X1 U1010 ( .A(n1566), .B(n1036), .Y(n970) );
  NOR2X1 U1011 ( .A(n1566), .B(n974), .Y(n849) );
  NOR2X1 U1012 ( .A(n819), .B(n1821), .Y(n1785) );
  NOR2X1 U1013 ( .A(n558), .B(n1777), .Y(n1786) );
  NOR2X1 U1014 ( .A(n325), .B(n1028), .Y(n853) );
  NOR2X1 U1015 ( .A(n1822), .B(n1830), .Y(n1740) );
  NOR2X1 U1016 ( .A(n1822), .B(n1482), .Y(n1495) );
  NOR2X1 U1017 ( .A(n333), .B(n1821), .Y(n1833) );
  NOR2X1 U1018 ( .A(n195), .B(n1575), .Y(n1523) );
  NOR2X1 U1019 ( .A(n325), .B(n1821), .Y(n1739) );
  NOR2X1 U1020 ( .A(n1527), .B(n1036), .Y(n848) );
  NOR2X1 U1021 ( .A(n1294), .B(n1528), .Y(n1461) );
  NOR2X1 U1022 ( .A(n1822), .B(n905), .Y(n829) );
  NOR2X1 U1023 ( .A(n819), .B(n1819), .Y(n1780) );
  NOR2X1 U1024 ( .A(n1566), .B(n920), .Y(n839) );
  NOR2X1 U1025 ( .A(n1604), .B(n1552), .Y(n1554) );
  NOR2X1 U1026 ( .A(n788), .B(n920), .Y(n828) );
  NOR2X1 U1027 ( .A(n1029), .B(n920), .Y(n872) );
  NOR2X1 U1028 ( .A(n1294), .B(n900), .Y(n827) );
  NOR2X1 U1029 ( .A(n335), .B(n1830), .Y(n1775) );
  NOR2X1 U1030 ( .A(n1550), .B(n1826), .Y(n1817) );
  NOR2X1 U1031 ( .A(n1029), .B(n905), .Y(n832) );
  NOR2X1 U1032 ( .A(n1294), .B(n1778), .Y(n1792) );
  NOR2X1 U1033 ( .A(n202), .B(n1036), .Y(n833) );
  NOR2X1 U1034 ( .A(n1566), .B(n1562), .Y(n1530) );
  NOR2X1 U1035 ( .A(n1604), .B(n1482), .Y(n1452) );
  NOR2X1 U1036 ( .A(n1294), .B(n1484), .Y(n1498) );
  NOR2X1 U1037 ( .A(n1294), .B(n1819), .Y(n1738) );
  NOR2X1 U1038 ( .A(n516), .B(n1028), .Y(n831) );
  NOR2X1 U1039 ( .A(n1029), .B(n1028), .Y(n1026) );
  NOR2X1 U1040 ( .A(n1566), .B(n1826), .Y(n1849) );
  NOR2X1 U1041 ( .A(n1572), .B(n1528), .Y(n1444) );
  NOR2X1 U1042 ( .A(n819), .B(n1828), .Y(n1734) );
  NOR2X1 U1043 ( .A(n1029), .B(n974), .Y(n972) );
  NOR2X1 U1044 ( .A(n202), .B(n1552), .Y(n1481) );
  NOR2X1 U1045 ( .A(n819), .B(n1778), .Y(n1765) );
  NOR2X1 U1046 ( .A(n1276), .B(n1830), .Y(n1787) );
  NOR2X1 U1047 ( .A(n1831), .B(n1777), .Y(n1735) );
  NOR2X1 U1048 ( .A(n202), .B(n974), .Y(n882) );
  NOR2X1 U1049 ( .A(n195), .B(n1482), .Y(n1478) );
  NOR2X1 U1050 ( .A(n1550), .B(n1036), .Y(n871) );
  NOR2X1 U1051 ( .A(n1029), .B(n922), .Y(n822) );
  INVX4 U1052 ( .A(n1711), .Y(n1340) );
  INVX1 U1053 ( .A(h0[0]), .Y(n2129) );
  INVX1 U1054 ( .A(m0[0]), .Y(n2115) );
  NOR2X1 U1055 ( .A(n198), .B(n1528), .Y(n1479) );
  INVX3 U1056 ( .A(n237), .Y(n199) );
  INVX2 U1057 ( .A(B2[5]), .Y(n1306) );
  INVX2 U1058 ( .A(B2[3]), .Y(n1278) );
  INVX2 U1059 ( .A(B1[6]), .Y(n1602) );
  INVX2 U1060 ( .A(B1[5]), .Y(n1575) );
  INVX2 U1061 ( .A(B1[3]), .Y(n1552) );
  INVX2 U1062 ( .A(B4[5]), .Y(n974) );
  INVX2 U1063 ( .A(B4[3]), .Y(n900) );
  INVX2 U1064 ( .A(B4[0]), .Y(n918) );
  NOR2X1 U1065 ( .A(n201), .B(n1575), .Y(n1449) );
  XNOR2XL U1066 ( .A(n1679), .B(n1678), .Y(\UFIRROOT/UFIR/Reg6_d[12] ) );
  AOI21X1 U1067 ( .A0(n1679), .A1(n1622), .B0(n1621), .Y(n1624) );
  AOI21X1 U1068 ( .A0(n1679), .A1(n1626), .B0(n1625), .Y(n1630) );
  ADDFHX1 U1069 ( .A(n1581), .B(n1580), .CI(n1579), .CO(n1590), .S(n1588) );
  NOR2X1 U1070 ( .A(n1603), .B(n1552), .Y(n1568) );
  NOR2X1 U1071 ( .A(n1827), .B(n1830), .Y(n1757) );
  NOR2X1 U1072 ( .A(n204), .B(n1819), .Y(n1756) );
  AOI21X1 U1073 ( .A0(n1989), .A1(n1987), .B0(n1963), .Y(n1968) );
  XOR2X1 U1074 ( .A(n1961), .B(n1960), .Y(\UFIRROOT/UFIR/Reg2_d[10] ) );
  NOR2X1 U1075 ( .A(n1312), .B(n1313), .Y(n1389) );
  NOR2X1 U1076 ( .A(n1311), .B(n1310), .Y(n1387) );
  ADDFHX1 U1077 ( .A(n1266), .B(n1265), .CI(n1264), .CO(n1312), .S(n1311) );
  OAI21X1 U1078 ( .A0(n1094), .A1(n397), .B0(n396), .Y(n1141) );
  NOR2X1 U1079 ( .A(n1294), .B(n515), .Y(n430) );
  INVX2 U1080 ( .A(n1710), .Y(n1294) );
  AOI21X1 U1081 ( .A0(n1642), .A1(n1683), .B0(n1641), .Y(n1647) );
  AOI21X1 U1082 ( .A0(n1908), .A1(n1931), .B0(n1907), .Y(n1913) );
  AOI21X1 U1083 ( .A0(n1949), .A1(n1989), .B0(n1948), .Y(n1954) );
  INVX2 U1084 ( .A(n1946), .Y(n1989) );
  BUFX2 U1085 ( .A(n1367), .Y(n1335) );
  INVX2 U1086 ( .A(n1022), .Y(n1059) );
  NOR2X1 U1087 ( .A(n1820), .B(n1819), .Y(n1857) );
  NOR2X1 U1088 ( .A(n1820), .B(n1821), .Y(n1854) );
  NOR2X1 U1089 ( .A(n1820), .B(n1777), .Y(n1748) );
  NOR2X1 U1090 ( .A(n1820), .B(n1778), .Y(n1733) );
  INVX2 U1091 ( .A(n1712), .Y(n1820) );
  AOI21X1 U1092 ( .A0(n1903), .A1(n1901), .B0(n622), .Y(n627) );
  AOI21X1 U1093 ( .A0(n1903), .A1(n617), .B0(n616), .Y(n620) );
  AOI21X1 U1094 ( .A0(n1903), .A1(n206), .B0(n613), .Y(n615) );
  NOR2X1 U1095 ( .A(n335), .B(n774), .Y(n686) );
  AOI21X1 U1096 ( .A0(n700), .A1(n737), .B0(n699), .Y(n197) );
  AOI21X1 U1097 ( .A0(n700), .A1(n737), .B0(n699), .Y(n769) );
  INVX2 U1098 ( .A(n1709), .Y(n736) );
  OAI21X1 U1099 ( .A0(n1149), .A1(n1146), .B0(n1150), .Y(n317) );
  NAND2X1 U1100 ( .A(n1649), .B(n1594), .Y(n1596) );
  NOR2X1 U1101 ( .A(n2069), .B(n668), .Y(n2067) );
  ADDFHX1 U1102 ( .A(\UFIRROOT/UFIR/Reg2[9] ), .B(n873), .CI(n872), .CO(n969), 
        .S(n864) );
  NOR2X1 U1103 ( .A(n198), .B(n1327), .Y(n1169) );
  NOR2X1 U1104 ( .A(n198), .B(n1306), .Y(n1177) );
  NOR2X2 U1105 ( .A(n1110), .B(n1112), .Y(n1104) );
  NOR2X1 U1106 ( .A(n1921), .B(n1923), .Y(n1915) );
  NOR2X1 U1107 ( .A(n781), .B(n779), .Y(n700) );
  NOR2X1 U1108 ( .A(\UFIRROOT/mult_x_4/n133 ), .B(\UFIRROOT/mult_x_4/n142 ), 
        .Y(n779) );
  NOR2X1 U1109 ( .A(n902), .B(n336), .Y(n280) );
  NOR2X2 U1110 ( .A(n962), .B(n961), .Y(n1012) );
  INVX4 U1111 ( .A(n193), .Y(n788) );
  NOR2X1 U1112 ( .A(n333), .B(n594), .Y(n564) );
  NAND3X2 U1113 ( .A(PEbar), .B(data_2[1]), .C(data_1[1]), .Y(n237) );
  NAND3X4 U1114 ( .A(PEbar), .B(data_2[2]), .C(data_1[2]), .Y(n236) );
  NOR2X2 U1115 ( .A(\UFIRROOT/mult_x_4/n125 ), .B(\UFIRROOT/mult_x_4/n132 ), 
        .Y(n781) );
  OAI21X2 U1116 ( .A0(n988), .A1(n1056), .B0(n989), .Y(n1019) );
  NOR2X2 U1117 ( .A(n960), .B(n959), .Y(n988) );
  ADDFHX1 U1118 ( .A(\UFIRROOT/UFIR/Reg3[9] ), .B(n361), .CI(n360), .CO(n221), 
        .S(n372) );
  NOR2X2 U1119 ( .A(n337), .B(n326), .Y(n361) );
  ADDFHX1 U1120 ( .A(n1864), .B(n1863), .CI(n1862), .CO(n1885), .S(n1883) );
  NOR2X1 U1121 ( .A(n1643), .B(n1650), .Y(n1594) );
  AOI21X2 U1122 ( .A0(n956), .A1(n1050), .B0(n955), .Y(n1022) );
  NOR2X1 U1123 ( .A(n1387), .B(n1389), .Y(n1374) );
  OAI21X1 U1124 ( .A0(n769), .A1(n765), .B0(n766), .Y(n727) );
  NOR2X2 U1125 ( .A(n2052), .B(\bcd_fir/bin_reg [2]), .Y(n661) );
  NOR2X1 U1126 ( .A(n1105), .B(n1099), .Y(n395) );
  NOR2X1 U1127 ( .A(n393), .B(n392), .Y(n1099) );
  INVX2 U1128 ( .A(n199), .Y(n202) );
  NOR2X1 U1129 ( .A(n919), .B(n332), .Y(n355) );
  INVX2 U1130 ( .A(n1731), .Y(n467) );
  NAND2X1 U1131 ( .A(n1104), .B(n395), .Y(n397) );
  AOI21X1 U1132 ( .A0(n1679), .A1(n1677), .B0(n1632), .Y(n1637) );
  NAND3X1 U1133 ( .A(data_2[3]), .B(PEbar), .C(data_1[3]), .Y(n204) );
  INVXL U1134 ( .A(n1730), .Y(n1829) );
  NAND3X4 U1135 ( .A(PEbar), .B(data_2[4]), .C(data_1[4]), .Y(n216) );
  NOR2X1 U1136 ( .A(n1241), .B(n1240), .Y(n1427) );
  NAND3XL U1137 ( .A(PEbar), .B(data_2[4]), .C(data_1[4]), .Y(n203) );
  INVX2 U1138 ( .A(n1710), .Y(n558) );
  INVXL U1139 ( .A(n1710), .Y(n919) );
  INVXL U1140 ( .A(n1710), .Y(n795) );
  INVXL U1141 ( .A(n1710), .Y(n1827) );
  INVX2 U1142 ( .A(n216), .Y(n1710) );
  ADDFHX1 U1143 ( .A(n343), .B(n342), .CI(n341), .CO(n350), .S(n346) );
  ADDFHX1 U1144 ( .A(n554), .B(n553), .CI(n552), .CO(n567), .S(n555) );
  ADDFHX1 U1145 ( .A(n420), .B(n419), .CI(n418), .CO(n527), .S(n436) );
  INVX2 U1146 ( .A(n193), .Y(n325) );
  NOR2X1 U1147 ( .A(n1550), .B(n328), .Y(n245) );
  INVXL U1148 ( .A(n1730), .Y(n516) );
  NOR2X1 U1149 ( .A(n215), .B(n336), .Y(n246) );
  AOI21X1 U1150 ( .A0(n965), .A1(n1059), .B0(n964), .Y(n982) );
  ADDFHX1 U1151 ( .A(\UFIRROOT/UFIR/Reg6[9] ), .B(n564), .CI(n563), .CO(n568), 
        .S(n553) );
  INVXL U1152 ( .A(n1709), .Y(n1303) );
  INVX4 U1153 ( .A(n1709), .Y(n1572) );
  INVX4 U1154 ( .A(n1709), .Y(n1822) );
  INVX4 U1155 ( .A(n193), .Y(n1550) );
  OAI21X2 U1156 ( .A0(n1112), .A1(n1142), .B0(n1113), .Y(n1095) );
  ADDFHX1 U1157 ( .A(n1447), .B(n1446), .CI(n1445), .CO(n1524), .S(n1458) );
  ADDFHX1 U1158 ( .A(\UFIRROOT/UFIR/Reg5[6] ), .B(n1441), .CI(n1440), .CO(
        n1529), .S(n1446) );
  NOR2X1 U1159 ( .A(n1655), .B(n1657), .Y(n1649) );
  NOR2X1 U1160 ( .A(n509), .B(n448), .Y(n512) );
  NOR2X1 U1161 ( .A(n504), .B(n503), .Y(n448) );
  NAND3X4 U1162 ( .A(PEbar), .B(data_2[7]), .C(data_1[7]), .Y(n217) );
  AOI21X2 U1163 ( .A0(n512), .A1(n511), .B0(n510), .Y(n1905) );
  NOR2X2 U1164 ( .A(n580), .B(n579), .Y(n1923) );
  NOR2X2 U1165 ( .A(n581), .B(n582), .Y(n1916) );
  ADDFHX1 U1166 ( .A(n551), .B(n550), .CI(n549), .CO(n581), .S(n580) );
  ADDFHX1 U1167 ( .A(n567), .B(n566), .CI(n565), .CO(n584), .S(n582) );
  ADDFXL U1168 ( .A(n471), .B(n470), .CI(n469), .CO(n472), .S(n461) );
  INVX2 U1169 ( .A(n1712), .Y(n1604) );
  INVX2 U1170 ( .A(n1712), .Y(n1328) );
  NAND2X1 U1171 ( .A(n2060), .B(n2062), .Y(n2061) );
  NAND2XL U1172 ( .A(n657), .B(n656), .Y(n658) );
  OAI21X1 U1173 ( .A0(n502), .A1(n501), .B0(n500), .Y(n511) );
  OAI21X1 U1174 ( .A0(n509), .A1(n508), .B0(n507), .Y(n510) );
  ADDFHX1 U1175 ( .A(n1284), .B(n1283), .CI(n1282), .CO(n1315), .S(n1313) );
  NAND2XL U1176 ( .A(n1216), .B(n1215), .Y(n1399) );
  AOI21X1 U1177 ( .A0(n1404), .A1(n1405), .B0(n1205), .Y(n1401) );
  INVXL U1178 ( .A(n1403), .Y(n1205) );
  OAI21X1 U1179 ( .A0(n1401), .A1(n1398), .B0(n1399), .Y(n1396) );
  NAND2XL U1180 ( .A(n271), .B(\UFIRROOT/UFIR/Reg3[0] ), .Y(n1134) );
  NAND2XL U1181 ( .A(n906), .B(\UFIRROOT/UFIR/Reg2[0] ), .Y(n1008) );
  NAND2XL U1182 ( .A(n1765), .B(\UFIRROOT/UFIR/Reg1[0] ), .Y(n2012) );
  NAND2XL U1183 ( .A(n1883), .B(n1882), .Y(n1965) );
  NAND2XL U1184 ( .A(n1885), .B(n1884), .Y(n1958) );
  NAND2XL U1185 ( .A(n1887), .B(n1886), .Y(n1951) );
  NAND2XL U1186 ( .A(\UFIRROOT/mult_x_4/n161 ), .B(\UFIRROOT/mult_x_4/n167 ), 
        .Y(n809) );
  AOI21XL U1187 ( .A0(n211), .A1(n462), .B0(n210), .Y(n476) );
  NAND2XL U1188 ( .A(n473), .B(n472), .Y(n474) );
  NOR2X1 U1189 ( .A(n194), .B(n1562), .Y(n1464) );
  ADDFHX1 U1190 ( .A(\UFIRROOT/UFIR/Reg5[9] ), .B(n1568), .CI(n1567), .CO(
        n1569), .S(n1557) );
  ADDFHX1 U1191 ( .A(\UFIRROOT/UFIR/Reg1[9] ), .B(n1855), .CI(n1854), .CO(
        n1715), .S(n1866) );
  NAND2X1 U1192 ( .A(n2016), .B(n638), .Y(n639) );
  AOI2BB2X1 U1193 ( .B0(n2056), .B1(n2055), .A0N(n2054), .A1N(n2060), .Y(n2074) );
  NAND2XL U1194 ( .A(n2099), .B(n2052), .Y(n2056) );
  ADDFX1 U1195 ( .A(n385), .B(n384), .CI(n383), .CO(n399), .S(n392) );
  ADDFHX1 U1196 ( .A(n859), .B(n858), .CI(n857), .CO(n959), .S(n958) );
  INVXL U1197 ( .A(n2073), .Y(n2064) );
  INVXL U1198 ( .A(FIR_out1_7[1]), .Y(n2076) );
  NAND2X2 U1199 ( .A(n671), .B(n673), .Y(n662) );
  NOR2X1 U1200 ( .A(n2073), .B(n2072), .Y(n2080) );
  OAI21XL U1201 ( .A0(n2063), .A1(n2062), .B0(n2061), .Y(n2082) );
  MXI2XL U1202 ( .A(n674), .B(n673), .S0(n672), .Y(n2085) );
  NAND2XL U1203 ( .A(n2113), .B(n2044), .Y(n2104) );
  NAND2XL U1204 ( .A(n2111), .B(n2046), .Y(n2107) );
  NAND2XL U1205 ( .A(m0[3]), .B(n2044), .Y(n2109) );
  INVXL U1206 ( .A(n2116), .Y(n2100) );
  NAND2XL U1207 ( .A(m1[1]), .B(n2034), .Y(n2103) );
  INVXL U1208 ( .A(n2120), .Y(n2127) );
  INVXL U1209 ( .A(h0[2]), .Y(n2125) );
  NAND2XL U1210 ( .A(n1333), .B(n1332), .Y(n1351) );
  NAND2XL U1211 ( .A(n927), .B(n926), .Y(n994) );
  AOI21X1 U1212 ( .A0(n999), .A1(n1000), .B0(n913), .Y(n996) );
  INVXL U1213 ( .A(n998), .Y(n913) );
  NAND2XL U1214 ( .A(n1042), .B(n1041), .Y(n1089) );
  NAND2XL U1215 ( .A(n1045), .B(\UFIRROOT/UFIR/Reg2[14] ), .Y(n1075) );
  NAND2XL U1216 ( .A(n1348), .B(\UFIRROOT/UFIR/Reg4[14] ), .Y(n1360) );
  OAI21XL U1217 ( .A0(n1351), .A1(n1354), .B0(n1355), .Y(n1363) );
  NAND2XL U1218 ( .A(n1895), .B(n1894), .Y(n1941) );
  NAND2XL U1219 ( .A(n401), .B(n400), .Y(n415) );
  INVXL U1220 ( .A(n1900), .Y(n622) );
  INVXL U1221 ( .A(n618), .Y(n611) );
  AND2XL U1222 ( .A(n617), .B(n212), .Y(n206) );
  NAND2X1 U1223 ( .A(n1915), .B(n586), .Y(n588) );
  NAND2XL U1224 ( .A(n1474), .B(n1473), .Y(n1667) );
  INVXL U1225 ( .A(n1472), .Y(n1669) );
  OAI21XL U1226 ( .A0(n1640), .A1(n1650), .B0(n1651), .Y(n1641) );
  NAND2XL U1227 ( .A(n1202), .B(n1201), .Y(n1408) );
  INVXL U1228 ( .A(n1200), .Y(n1410) );
  NAND2XL U1229 ( .A(n1239), .B(n1238), .Y(n1434) );
  NAND2XL U1230 ( .A(n1241), .B(n1240), .Y(n1428) );
  OAI21XL U1231 ( .A0(n1379), .A1(n1378), .B0(n1377), .Y(n1380) );
  INVX2 U1232 ( .A(n1370), .Y(n1420) );
  NAND2XL U1233 ( .A(n1345), .B(n1344), .Y(n1355) );
  NAND2XL U1234 ( .A(n275), .B(n274), .Y(n1129) );
  INVXL U1235 ( .A(n273), .Y(n1131) );
  NAND2XL U1236 ( .A(n312), .B(n311), .Y(n1155) );
  OAI21XL U1237 ( .A0(n1096), .A1(n1105), .B0(n1106), .Y(n1097) );
  NAND2XL U1238 ( .A(n399), .B(n398), .Y(n1138) );
  NAND2XL U1239 ( .A(n910), .B(n909), .Y(n1003) );
  INVXL U1240 ( .A(n908), .Y(n1005) );
  NAND2XL U1241 ( .A(n912), .B(n911), .Y(n998) );
  OAI21X1 U1242 ( .A0(n996), .A1(n993), .B0(n994), .Y(n1072) );
  NAND2XL U1243 ( .A(n962), .B(n961), .Y(n1015) );
  NAND2XL U1244 ( .A(n979), .B(n978), .Y(n1014) );
  NAND2XL U1245 ( .A(n1769), .B(n1768), .Y(n1978) );
  INVXL U1246 ( .A(n1767), .Y(n1980) );
  OAI21XL U1247 ( .A0(n2011), .A1(n1766), .B0(n2012), .Y(n1767) );
  OAI21XL U1248 ( .A0(n1977), .A1(n1980), .B0(n1978), .Y(n1975) );
  INVXL U1249 ( .A(n1973), .Y(n1772) );
  NAND2XL U1250 ( .A(n1783), .B(n1782), .Y(n2007) );
  OAI21X1 U1251 ( .A0(n2009), .A1(n2006), .B0(n2007), .Y(n1971) );
  INVXL U1252 ( .A(n1962), .Y(n1987) );
  INVXL U1253 ( .A(n1986), .Y(n1963) );
  OAI21XL U1254 ( .A0(n1947), .A1(n1957), .B0(n1958), .Y(n1948) );
  NAND2XL U1255 ( .A(n1896), .B(\UFIRROOT/UFIR/Reg1[14] ), .Y(n1934) );
  OR2XL U1256 ( .A(n1896), .B(\UFIRROOT/UFIR/Reg1[14] ), .Y(n1935) );
  NAND2X1 U1257 ( .A(n1956), .B(n1889), .Y(n1891) );
  NAND2XL U1258 ( .A(n691), .B(n690), .Y(n745) );
  NAND2XL U1259 ( .A(n729), .B(n728), .Y(n747) );
  INVXL U1260 ( .A(n804), .Y(n698) );
  NAND2XL U1261 ( .A(\UFIRROOT/mult_x_4/n143 ), .B(\UFIRROOT/mult_x_4/n152 ), 
        .Y(n800) );
  NAND2XL U1262 ( .A(\UFIRROOT/mult_x_4/n125 ), .B(\UFIRROOT/mult_x_4/n132 ), 
        .Y(n782) );
  NAND2XL U1263 ( .A(\UFIRROOT/mult_x_4/n118 ), .B(\UFIRROOT/mult_x_4/n114 ), 
        .Y(n724) );
  NAND2XL U1264 ( .A(\UFIRROOT/mult_x_4/n113 ), .B(\UFIRROOT/mult_x_4/n111 ), 
        .Y(n761) );
  NAND2XL U1265 ( .A(\UFIRROOT/mult_x_4/n110 ), .B(n703), .Y(n753) );
  AOI21XL U1266 ( .A0(n758), .A1(n715), .B0(n714), .Y(n716) );
  OAI21XL U1267 ( .A0(n761), .A1(n752), .B0(n753), .Y(n714) );
  NAND2XL U1268 ( .A(n757), .B(n715), .Y(n717) );
  NAND2XL U1269 ( .A(n705), .B(n704), .Y(n719) );
  OAI21XL U1270 ( .A0(n766), .A1(n723), .B0(n724), .Y(n758) );
  OAI21X1 U1271 ( .A0(n781), .A1(n778), .B0(n782), .Y(n699) );
  NOR2X1 U1272 ( .A(n203), .B(n452), .Y(n444) );
  NOR2X1 U1273 ( .A(n456), .B(n455), .Y(n459) );
  NOR2XL U1274 ( .A(n236), .B(n594), .Y(n518) );
  ADDHXL U1275 ( .A(\UFIRROOT/UFIR/Reg6[8] ), .B(n542), .CO(n554), .S(n538) );
  INVX2 U1276 ( .A(B0[4]), .Y(n562) );
  INVX2 U1277 ( .A(B0[5]), .Y(n571) );
  NOR2XL U1278 ( .A(n236), .B(n334), .Y(n354) );
  NOR2XL U1279 ( .A(n787), .B(n1821), .Y(n1744) );
  NAND2X1 U1280 ( .A(n628), .B(\bcd_fir/bin_reg [7]), .Y(n638) );
  MXI2XL U1281 ( .A(n628), .B(\bcd_fir/bin_reg [7]), .S0(\bcd_fir/bin_reg [5]), 
        .Y(n634) );
  NAND3XL U1282 ( .A(n648), .B(\bcd_fir/bin_reg [3]), .C(n644), .Y(n645) );
  MXI2X1 U1283 ( .A(n2049), .B(n642), .S0(n644), .Y(n659) );
  NOR3XL U1284 ( .A(n648), .B(n647), .C(\bcd_fir/bin_reg [3]), .Y(n649) );
  INVX2 U1285 ( .A(n1711), .Y(n337) );
  ADDFHX1 U1286 ( .A(n528), .B(n527), .CI(n526), .CO(n535), .S(n531) );
  NAND2X1 U1287 ( .A(n506), .B(n505), .Y(n507) );
  AND2XL U1288 ( .A(n490), .B(n489), .Y(n213) );
  OR2XL U1289 ( .A(n490), .B(n489), .Y(n214) );
  ADDFHX1 U1290 ( .A(n1526), .B(n1525), .CI(n1524), .CO(n1539), .S(n1535) );
  ADDFHX1 U1291 ( .A(n1558), .B(n1557), .CI(n1556), .CO(n1584), .S(n1559) );
  ADDFHX1 U1292 ( .A(n1287), .B(n1286), .CI(n1285), .CO(n1299), .S(n1288) );
  NOR2XL U1293 ( .A(n1340), .B(n1327), .Y(n1342) );
  ADDFHX1 U1294 ( .A(n331), .B(n330), .CI(n329), .CO(n366), .S(n344) );
  ADDFHX1 U1295 ( .A(n837), .B(n836), .CI(n835), .CO(n858), .S(n875) );
  ADDFHX1 U1296 ( .A(n1751), .B(n1750), .CI(n1749), .CO(n1839), .S(n1752) );
  ADDFHX1 U1297 ( .A(n1867), .B(n1866), .CI(n1865), .CO(n1876), .S(n1868) );
  ADDFX1 U1298 ( .A(n1610), .B(n1609), .CI(n1608), .CO(n1619), .S(n1616) );
  ADDFX1 U1299 ( .A(n1324), .B(n1323), .CI(n1322), .CO(n1333), .S(n1316) );
  ADDFX1 U1300 ( .A(n1035), .B(n1034), .CI(n1033), .CO(n1042), .S(n1039) );
  OAI21XL U1301 ( .A0(n1016), .A1(n1015), .B0(n1014), .Y(n1017) );
  ADDFX1 U1302 ( .A(n1725), .B(n1724), .CI(n1723), .CO(n1895), .S(n1892) );
  OAI21XL U1303 ( .A0(n1950), .A1(n1958), .B0(n1951), .Y(n1888) );
  AND2XL U1304 ( .A(ap_2[0]), .B(ap_2[1]), .Y(n2134) );
  NAND2XL U1305 ( .A(ap_2[2]), .B(ap_2[3]), .Y(n2130) );
  NAND2X1 U1306 ( .A(n2061), .B(n2054), .Y(n2099) );
  NAND2X1 U1307 ( .A(n630), .B(\bcd_fir/bin_reg [6]), .Y(n2016) );
  OR2XL U1308 ( .A(n2037), .B(h0[3]), .Y(n2038) );
  NAND2XL U1309 ( .A(n2127), .B(n2037), .Y(n2118) );
  NAND2XL U1310 ( .A(n2129), .B(n2038), .Y(n2119) );
  NAND2XL U1311 ( .A(n2125), .B(n2039), .Y(n2121) );
  NAND2XL U1312 ( .A(h0[0]), .B(n2118), .Y(n2122) );
  NAND2XL U1313 ( .A(h0[3]), .B(n2037), .Y(n2123) );
  INVXL U1314 ( .A(n1079), .Y(n1080) );
  NAND2XL U1315 ( .A(n1620), .B(\UFIRROOT/UFIR/Reg5[14] ), .Y(n1627) );
  AOI21XL U1316 ( .A0(n1363), .A1(n1362), .B0(n1361), .Y(n1364) );
  AND2XL U1317 ( .A(n1359), .B(n1362), .Y(n1366) );
  NAND2XL U1318 ( .A(n402), .B(\UFIRROOT/UFIR/Reg3[14] ), .Y(n410) );
  OAI21XL U1319 ( .A0(n1138), .A1(n414), .B0(n415), .Y(n407) );
  OR2XL U1320 ( .A(n402), .B(\UFIRROOT/UFIR/Reg3[14] ), .Y(n411) );
  OR2XL U1321 ( .A(n1620), .B(\UFIRROOT/UFIR/Reg5[14] ), .Y(n1628) );
  INVXL U1322 ( .A(n1921), .Y(n1929) );
  INVXL U1323 ( .A(n1928), .Y(n1922) );
  NAND2X1 U1324 ( .A(n580), .B(n579), .Y(n1924) );
  NAND2X1 U1325 ( .A(n582), .B(n581), .Y(n1917) );
  NOR2X1 U1326 ( .A(n584), .B(n583), .Y(n1909) );
  INVXL U1327 ( .A(n1915), .Y(n1904) );
  INVXL U1328 ( .A(n1914), .Y(n1906) );
  NAND2XL U1329 ( .A(n1476), .B(n1475), .Y(n1662) );
  AOI21X1 U1330 ( .A0(n1663), .A1(n1664), .B0(n1477), .Y(n1707) );
  INVXL U1331 ( .A(n1662), .Y(n1477) );
  NAND2XL U1332 ( .A(n1503), .B(n1502), .Y(n1700) );
  NAND2XL U1333 ( .A(n1619), .B(n1618), .Y(n1634) );
  NAND2XL U1334 ( .A(n1204), .B(n1203), .Y(n1403) );
  NAND2XL U1335 ( .A(n1230), .B(n1229), .Y(n1394) );
  NAND2XL U1336 ( .A(n277), .B(n276), .Y(n1124) );
  AOI21X1 U1337 ( .A0(n1125), .A1(n1126), .B0(n278), .Y(n1162) );
  INVXL U1338 ( .A(n1124), .Y(n278) );
  NAND2XL U1339 ( .A(n289), .B(n288), .Y(n1160) );
  NAND2XL U1340 ( .A(n303), .B(n302), .Y(n1120) );
  NAND2XL U1341 ( .A(n941), .B(n940), .Y(n1070) );
  NAND2XL U1342 ( .A(n1771), .B(n1770), .Y(n1973) );
  NAND2XL U1343 ( .A(n1797), .B(n1796), .Y(n1969) );
  NAND2XL U1344 ( .A(n693), .B(n692), .Y(n740) );
  OR2XL U1345 ( .A(n693), .B(n692), .Y(n741) );
  OAI21XL U1346 ( .A0(n744), .A1(n747), .B0(n745), .Y(n742) );
  NAND2XL U1347 ( .A(\UFIRROOT/mult_x_4/n168 ), .B(n696), .Y(n813) );
  NAND2XL U1348 ( .A(\UFIRROOT/mult_x_4/n153 ), .B(\UFIRROOT/mult_x_4/n160 ), 
        .Y(n804) );
  AOI21XL U1349 ( .A0(n758), .A1(n762), .B0(n749), .Y(n750) );
  NAND2XL U1350 ( .A(n757), .B(n762), .Y(n751) );
  INVXL U1351 ( .A(n708), .Y(n709) );
  AOI21XL U1352 ( .A0(n749), .A1(n707), .B0(n706), .Y(n708) );
  OR2XL U1353 ( .A(ap_2[1]), .B(ap[4]), .Y(ap[2]) );
  OR2XL U1354 ( .A(ap_2[2]), .B(ap_2[3]), .Y(ap[4]) );
  OAI2BB1XL U1355 ( .A0N(ap_2[2]), .A1N(ap_2[1]), .B0(n2132), .Y(ap[6]) );
  INVXL U1356 ( .A(n2130), .Y(ap[12]) );
  AND2XL U1357 ( .A(ap_2[1]), .B(ap[12]), .Y(ap[14]) );
  MXI2XL U1358 ( .A(n2064), .B(n2075), .S0(n2078), .Y(n2059) );
  INVXL U1359 ( .A(n2079), .Y(n2077) );
  NAND2XL U1360 ( .A(n2068), .B(\FIR_out0[0] ), .Y(n2070) );
  INVXL U1361 ( .A(n2084), .Y(n2088) );
  OAI2BB1XL U1362 ( .A0N(m0[3]), .A1N(n2107), .B0(n2105), .Y(m0_7[1]) );
  OAI32XL U1363 ( .A0(m0[3]), .A1(m0[0]), .A2(n2113), .B0(n2112), .B1(n2111), 
        .Y(n2114) );
  AOI22XL U1364 ( .A0(n2047), .A1(n2044), .B0(n2115), .B1(n2111), .Y(n2042) );
  NAND2XL U1365 ( .A(n2047), .B(n2107), .Y(n2048) );
  NAND2XL U1366 ( .A(n2112), .B(n2107), .Y(n2110) );
  OAI2BB1XL U1367 ( .A0N(m1[0]), .A1N(n2102), .B0(n2101), .Y(m1_7[2]) );
  OAI21XL U1368 ( .A0(m1[1]), .A1(m1[2]), .B0(m1[0]), .Y(n2098) );
  OAI32XL U1369 ( .A0(h0[3]), .A1(h0[0]), .A2(n2127), .B0(n2126), .B1(n2125), 
        .Y(n2128) );
  AOI22XL U1370 ( .A0(n2040), .A1(n2037), .B0(n2129), .B1(n2125), .Y(n2035) );
  XNOR2X1 U1371 ( .A(n1335), .B(n1334), .Y(\UFIRROOT/UFIR/Reg5_d[12] ) );
  NAND2XL U1372 ( .A(n1353), .B(n1351), .Y(n1334) );
  XOR2XL U1373 ( .A(n997), .B(n996), .Y(\UFIRROOT/UFIR/Reg3_d[3] ) );
  NAND2XL U1374 ( .A(n995), .B(n994), .Y(n997) );
  NAND2XL U1375 ( .A(n1362), .B(n1360), .Y(n1349) );
  NAND2XL U1376 ( .A(n1628), .B(n1627), .Y(n1629) );
  AND2XL U1377 ( .A(n416), .B(n415), .Y(n205) );
  OAI2BB1X1 U1378 ( .A0N(n1139), .A1N(n1141), .B0(n1138), .Y(n417) );
  AND2XL U1379 ( .A(n411), .B(n410), .Y(n209) );
  OAI2BB1X1 U1380 ( .A0N(n409), .A1N(n1141), .B0(n408), .Y(n412) );
  INVXL U1381 ( .A(n407), .Y(n408) );
  OAI2BB1X1 U1382 ( .A0N(n405), .A1N(n1141), .B0(n404), .Y(n406) );
  AND2XL U1383 ( .A(n409), .B(n411), .Y(n405) );
  AOI21XL U1384 ( .A0(n407), .A1(n411), .B0(n403), .Y(n404) );
  XNOR2XL U1385 ( .A(n1931), .B(n1930), .Y(\UFIRROOT/UFIR/Reg7_d[8] ) );
  AOI21XL U1386 ( .A0(n1931), .A1(n1929), .B0(n1922), .Y(n1927) );
  INVXL U1387 ( .A(n1923), .Y(n1925) );
  AOI21XL U1388 ( .A0(n1931), .A1(n1915), .B0(n1914), .Y(n1920) );
  INVXL U1389 ( .A(n1916), .Y(n1918) );
  INVXL U1390 ( .A(n1909), .Y(n1911) );
  XNOR2XL U1391 ( .A(n1903), .B(n1902), .Y(\UFIRROOT/UFIR/Reg7_d[12] ) );
  INVXL U1392 ( .A(n623), .Y(n625) );
  INVXL U1393 ( .A(n612), .Y(n613) );
  XNOR2XL U1394 ( .A(n1675), .B(n1674), .Y(\UFIRROOT/UFIR/Reg6_d[0] ) );
  XOR2XL U1395 ( .A(n1670), .B(n1669), .Y(\UFIRROOT/UFIR/Reg6_d[1] ) );
  NAND2XL U1396 ( .A(n1668), .B(n1667), .Y(n1670) );
  XNOR2XL U1397 ( .A(n1665), .B(n1664), .Y(\UFIRROOT/UFIR/Reg6_d[2] ) );
  NAND2XL U1398 ( .A(n1663), .B(n1662), .Y(n1665) );
  XOR2XL U1399 ( .A(n1708), .B(n1707), .Y(\UFIRROOT/UFIR/Reg6_d[3] ) );
  NAND2XL U1400 ( .A(n1706), .B(n1705), .Y(n1708) );
  INVXL U1401 ( .A(n1704), .Y(n1706) );
  XNOR2XL U1402 ( .A(n1703), .B(n1702), .Y(\UFIRROOT/UFIR/Reg6_d[4] ) );
  NAND2XL U1403 ( .A(n1701), .B(n1700), .Y(n1703) );
  NAND2XL U1404 ( .A(n1697), .B(n1696), .Y(n1698) );
  NAND2XL U1405 ( .A(n1692), .B(n1691), .Y(n1693) );
  XNOR2XL U1406 ( .A(n1689), .B(n1688), .Y(\UFIRROOT/UFIR/Reg6_d[7] ) );
  NAND2XL U1407 ( .A(n1687), .B(n1686), .Y(n1688) );
  OAI21XL U1408 ( .A0(n1694), .A1(n1690), .B0(n1691), .Y(n1689) );
  XNOR2XL U1409 ( .A(n1683), .B(n1682), .Y(\UFIRROOT/UFIR/Reg6_d[8] ) );
  NAND2XL U1410 ( .A(n1681), .B(n1680), .Y(n1682) );
  NAND2XL U1411 ( .A(n1659), .B(n1658), .Y(n1660) );
  AOI21XL U1412 ( .A0(n1683), .A1(n1681), .B0(n1656), .Y(n1661) );
  NAND2XL U1413 ( .A(n1652), .B(n1651), .Y(n1653) );
  AOI21XL U1414 ( .A0(n1683), .A1(n1649), .B0(n1648), .Y(n1654) );
  NAND2XL U1415 ( .A(n1645), .B(n1644), .Y(n1646) );
  NAND2XL U1416 ( .A(n1677), .B(n1676), .Y(n1678) );
  XNOR2XL U1417 ( .A(n1416), .B(n1415), .Y(\UFIRROOT/UFIR/Reg5_d[0] ) );
  XOR2XL U1418 ( .A(n1411), .B(n1410), .Y(\UFIRROOT/UFIR/Reg5_d[1] ) );
  NAND2XL U1419 ( .A(n1409), .B(n1408), .Y(n1411) );
  XNOR2XL U1420 ( .A(n1406), .B(n1405), .Y(\UFIRROOT/UFIR/Reg5_d[2] ) );
  NAND2XL U1421 ( .A(n1404), .B(n1403), .Y(n1406) );
  XOR2XL U1422 ( .A(n1402), .B(n1401), .Y(\UFIRROOT/UFIR/Reg5_d[3] ) );
  NAND2XL U1423 ( .A(n1400), .B(n1399), .Y(n1402) );
  XNOR2XL U1424 ( .A(n1397), .B(n1396), .Y(\UFIRROOT/UFIR/Reg5_d[4] ) );
  NAND2XL U1425 ( .A(n1395), .B(n1394), .Y(n1397) );
  NAND2XL U1426 ( .A(n1435), .B(n1434), .Y(n1436) );
  NAND2XL U1427 ( .A(n1429), .B(n1428), .Y(n1430) );
  XNOR2XL U1428 ( .A(n1426), .B(n1425), .Y(\UFIRROOT/UFIR/Reg5_d[7] ) );
  NAND2XL U1429 ( .A(n1424), .B(n1423), .Y(n1425) );
  OAI21XL U1430 ( .A0(n1431), .A1(n1427), .B0(n1428), .Y(n1426) );
  XNOR2XL U1431 ( .A(n1420), .B(n1419), .Y(\UFIRROOT/UFIR/Reg5_d[8] ) );
  NAND2XL U1432 ( .A(n1418), .B(n1417), .Y(n1419) );
  NAND2XL U1433 ( .A(n1391), .B(n1390), .Y(n1392) );
  AOI21XL U1434 ( .A0(n1420), .A1(n1418), .B0(n1388), .Y(n1393) );
  NAND2XL U1435 ( .A(n1371), .B(n1377), .Y(n1372) );
  AOI21XL U1436 ( .A0(n1420), .A1(n1374), .B0(n1376), .Y(n1373) );
  NAND2XL U1437 ( .A(n1384), .B(n1383), .Y(n1385) );
  AOI21XL U1438 ( .A0(n1381), .A1(n1420), .B0(n1380), .Y(n1386) );
  NAND2XL U1439 ( .A(n1135), .B(n1134), .Y(n1137) );
  XOR2XL U1440 ( .A(n1132), .B(n1131), .Y(\UFIRROOT/UFIR/Reg4_d[1] ) );
  NAND2XL U1441 ( .A(n1130), .B(n1129), .Y(n1132) );
  XNOR2XL U1442 ( .A(n1127), .B(n1126), .Y(\UFIRROOT/UFIR/Reg4_d[2] ) );
  NAND2XL U1443 ( .A(n1125), .B(n1124), .Y(n1127) );
  XOR2XL U1444 ( .A(n1163), .B(n1162), .Y(\UFIRROOT/UFIR/Reg4_d[3] ) );
  NAND2XL U1445 ( .A(n1161), .B(n1160), .Y(n1163) );
  INVXL U1446 ( .A(n1159), .Y(n1161) );
  XNOR2XL U1447 ( .A(n1123), .B(n1122), .Y(\UFIRROOT/UFIR/Reg4_d[4] ) );
  NAND2XL U1448 ( .A(n1121), .B(n1120), .Y(n1123) );
  NAND2XL U1449 ( .A(n1156), .B(n1155), .Y(n1157) );
  NAND2XL U1450 ( .A(n1118), .B(n1146), .Y(n1119) );
  XNOR2XL U1451 ( .A(n1153), .B(n1152), .Y(\UFIRROOT/UFIR/Reg4_d[7] ) );
  NAND2XL U1452 ( .A(n1151), .B(n1150), .Y(n1152) );
  OAI21XL U1453 ( .A0(n1148), .A1(n1147), .B0(n1146), .Y(n1153) );
  XNOR2XL U1454 ( .A(n1145), .B(n1144), .Y(\UFIRROOT/UFIR/Reg4_d[8] ) );
  NAND2XL U1455 ( .A(n1143), .B(n1142), .Y(n1144) );
  NAND2XL U1456 ( .A(n1114), .B(n1113), .Y(n1115) );
  AOI21XL U1457 ( .A0(n1145), .A1(n1143), .B0(n1111), .Y(n1116) );
  NAND2XL U1458 ( .A(n1107), .B(n1106), .Y(n1108) );
  AOI21XL U1459 ( .A0(n1145), .A1(n1104), .B0(n1095), .Y(n1109) );
  NAND2XL U1460 ( .A(n1101), .B(n1100), .Y(n1102) );
  AOI21XL U1461 ( .A0(n1098), .A1(n1145), .B0(n1097), .Y(n1103) );
  XNOR2XL U1462 ( .A(n1140), .B(n1141), .Y(\UFIRROOT/UFIR/Reg4_d[12] ) );
  NAND2XL U1463 ( .A(n1139), .B(n1138), .Y(n1140) );
  XNOR2XL U1464 ( .A(n1011), .B(n1010), .Y(\UFIRROOT/UFIR/Reg3_d[0] ) );
  XOR2XL U1465 ( .A(n1006), .B(n1005), .Y(\UFIRROOT/UFIR/Reg3_d[1] ) );
  NAND2XL U1466 ( .A(n1004), .B(n1003), .Y(n1006) );
  NAND2XL U1467 ( .A(n999), .B(n998), .Y(n1001) );
  XNOR2XL U1468 ( .A(n1073), .B(n1072), .Y(\UFIRROOT/UFIR/Reg3_d[4] ) );
  NAND2XL U1469 ( .A(n1071), .B(n1070), .Y(n1073) );
  NAND2XL U1470 ( .A(n1067), .B(n1066), .Y(n1068) );
  NAND2XL U1471 ( .A(n1062), .B(n1061), .Y(n1063) );
  XNOR2XL U1472 ( .A(n1055), .B(n1054), .Y(\UFIRROOT/UFIR/Reg3_d[7] ) );
  NAND2XL U1473 ( .A(n1053), .B(n1052), .Y(n1054) );
  OAI21XL U1474 ( .A0(n1064), .A1(n1060), .B0(n1061), .Y(n1055) );
  XNOR2XL U1475 ( .A(n1059), .B(n1058), .Y(\UFIRROOT/UFIR/Reg3_d[8] ) );
  NAND2XL U1476 ( .A(n1057), .B(n1056), .Y(n1058) );
  NAND2XL U1477 ( .A(n990), .B(n989), .Y(n991) );
  AOI21XL U1478 ( .A0(n1059), .A1(n1057), .B0(n987), .Y(n992) );
  NAND2XL U1479 ( .A(n983), .B(n1015), .Y(n984) );
  AOI21XL U1480 ( .A0(n1059), .A1(n1013), .B0(n1019), .Y(n985) );
  NAND2XL U1481 ( .A(n980), .B(n1014), .Y(n981) );
  XNOR2XL U1482 ( .A(n1087), .B(n1049), .Y(\UFIRROOT/UFIR/Reg3_d[12] ) );
  NAND2XL U1483 ( .A(n1086), .B(n1084), .Y(n1049) );
  XNOR2XL U1484 ( .A(n2015), .B(n2014), .Y(\UFIRROOT/UFIR/Reg2_d[0] ) );
  NAND2XL U1485 ( .A(n2013), .B(n2012), .Y(n2015) );
  XOR2XL U1486 ( .A(n1981), .B(n1980), .Y(\UFIRROOT/UFIR/Reg2_d[1] ) );
  NAND2XL U1487 ( .A(n1979), .B(n1978), .Y(n1981) );
  XNOR2XL U1488 ( .A(n1976), .B(n1975), .Y(\UFIRROOT/UFIR/Reg2_d[2] ) );
  NAND2XL U1489 ( .A(n1974), .B(n1973), .Y(n1976) );
  XOR2XL U1490 ( .A(n2010), .B(n2009), .Y(\UFIRROOT/UFIR/Reg2_d[3] ) );
  NAND2XL U1491 ( .A(n2008), .B(n2007), .Y(n2010) );
  XNOR2XL U1492 ( .A(n1972), .B(n1971), .Y(\UFIRROOT/UFIR/Reg2_d[4] ) );
  NAND2XL U1493 ( .A(n1970), .B(n1969), .Y(n1972) );
  NAND2XL U1494 ( .A(n2003), .B(n2002), .Y(n2004) );
  NAND2XL U1495 ( .A(n1998), .B(n1997), .Y(n1999) );
  XNOR2XL U1496 ( .A(n1995), .B(n1994), .Y(\UFIRROOT/UFIR/Reg2_d[7] ) );
  NAND2XL U1497 ( .A(n1993), .B(n1992), .Y(n1994) );
  OAI21XL U1498 ( .A0(n2000), .A1(n1996), .B0(n1997), .Y(n1995) );
  XNOR2XL U1499 ( .A(n1989), .B(n1988), .Y(\UFIRROOT/UFIR/Reg2_d[8] ) );
  NAND2XL U1500 ( .A(n1987), .B(n1986), .Y(n1988) );
  NAND2XL U1501 ( .A(n1966), .B(n1965), .Y(n1967) );
  NAND2XL U1502 ( .A(n1959), .B(n1958), .Y(n1960) );
  AOI21XL U1503 ( .A0(n1989), .A1(n1956), .B0(n1955), .Y(n1961) );
  NAND2XL U1504 ( .A(n1952), .B(n1951), .Y(n1953) );
  XNOR2XL U1505 ( .A(n1984), .B(n1985), .Y(\UFIRROOT/UFIR/Reg2_d[12] ) );
  NAND2XL U1506 ( .A(n1983), .B(n1982), .Y(n1984) );
  OAI2BB1XL U1507 ( .A0N(n1899), .A1N(n1985), .B0(n1898), .Y(
        \UFIRROOT/UFIR/Reg2_d[15] ) );
  AND2XL U1508 ( .A(n1933), .B(n1935), .Y(n1899) );
  AND2XL U1509 ( .A(n730), .B(n747), .Y(\UFIRROOT/UFIR/Reg1_d[1] ) );
  OR2XL U1510 ( .A(n729), .B(n728), .Y(n730) );
  XOR2XL U1511 ( .A(n748), .B(n747), .Y(\UFIRROOT/UFIR/Reg1_d[2] ) );
  NAND2XL U1512 ( .A(n746), .B(n745), .Y(n748) );
  XNOR2XL U1513 ( .A(n743), .B(n742), .Y(\UFIRROOT/UFIR/Reg1_d[3] ) );
  NAND2XL U1514 ( .A(n741), .B(n740), .Y(n743) );
  XNOR2XL U1515 ( .A(n816), .B(n815), .Y(\UFIRROOT/UFIR/Reg1_d[4] ) );
  NAND2XL U1516 ( .A(n814), .B(n813), .Y(n816) );
  NAND2XL U1517 ( .A(n810), .B(n809), .Y(n811) );
  XNOR2XL U1518 ( .A(n807), .B(n806), .Y(\UFIRROOT/UFIR/Reg1_d[6] ) );
  NAND2XL U1519 ( .A(n805), .B(n804), .Y(n807) );
  NAND2XL U1520 ( .A(n801), .B(n800), .Y(n803) );
  NAND2XL U1521 ( .A(n738), .B(n778), .Y(n739) );
  XNOR2XL U1522 ( .A(n785), .B(n784), .Y(\UFIRROOT/UFIR/Reg1_d[9] ) );
  NAND2XL U1523 ( .A(n783), .B(n782), .Y(n784) );
  OAI21XL U1524 ( .A0(n780), .A1(n779), .B0(n778), .Y(n785) );
  NAND2XL U1525 ( .A(n767), .B(n766), .Y(n768) );
  NAND2XL U1526 ( .A(n725), .B(n724), .Y(n726) );
  NAND2XL U1527 ( .A(n720), .B(n719), .Y(n721) );
  OAI21XL U1528 ( .A0(n197), .A1(n712), .B0(n711), .Y(
        \UFIRROOT/UFIR/Reg1_d[15] ) );
  NAND2XL U1529 ( .A(n757), .B(n710), .Y(n712) );
  AOI21XL U1530 ( .A0(n758), .A1(n710), .B0(n709), .Y(n711) );
  AND2XL U1531 ( .A(n762), .B(n707), .Y(n710) );
  INVXL U1532 ( .A(n1711), .Y(n1603) );
  INVX2 U1533 ( .A(n1731), .Y(n1195) );
  INVX2 U1534 ( .A(n238), .Y(n1732) );
  INVX2 U1535 ( .A(n1732), .Y(n468) );
  INVX2 U1536 ( .A(n1732), .Y(n921) );
  INVX2 U1537 ( .A(n1732), .Y(n1483) );
  INVX2 U1538 ( .A(n1732), .Y(n819) );
  OR2XL U1539 ( .A(n453), .B(\UFIRROOT/UFIR/Reg6[0] ), .Y(n207) );
  AND2XL U1540 ( .A(n453), .B(\UFIRROOT/UFIR/Reg6[0] ), .Y(n208) );
  AND2XL U1541 ( .A(n461), .B(n460), .Y(n210) );
  OR2XL U1542 ( .A(n461), .B(n460), .Y(n211) );
  OAI21XL U1543 ( .A0(n459), .A1(n458), .B0(n457), .Y(n462) );
  INVX2 U1544 ( .A(n1712), .Y(n1029) );
  INVXL U1545 ( .A(n646), .Y(n647) );
  INVXL U1546 ( .A(\UFIRROOT/UROOT/X_r3[5] ), .Y(n2025) );
  NOR2X1 U1547 ( .A(n1916), .B(n1909), .Y(n586) );
  OR2X1 U1548 ( .A(n303), .B(n302), .Y(n1121) );
  AOI21X1 U1549 ( .A0(n1955), .A1(n1889), .B0(n1888), .Y(n1890) );
  OAI22X1 U1550 ( .A0(n661), .A1(n660), .B0(n659), .B1(n658), .Y(n673) );
  INVXL U1551 ( .A(n2022), .Y(n2033) );
  INVXL U1552 ( .A(ap[6]), .Y(n2133) );
  INVXL U1553 ( .A(m1_7[1]), .Y(n2101) );
  XNOR2XL U1554 ( .A(n1137), .B(n1136), .Y(\UFIRROOT/UFIR/Reg4_d[0] ) );
  XNOR2XL U1555 ( .A(n1001), .B(n1000), .Y(\UFIRROOT/UFIR/Reg3_d[2] ) );
  XOR2XL U1556 ( .A(n803), .B(n802), .Y(\UFIRROOT/UFIR/Reg1_d[7] ) );
  INVX2 U1557 ( .A(n1712), .Y(n327) );
  ADDFX1 U1558 ( .A(\UFIRROOT/UFIR/Reg3[10] ), .B(n220), .CI(n219), .CO(n227), 
        .S(n379) );
  ADDFX1 U1559 ( .A(n223), .B(n222), .CI(n221), .CO(n385), .S(n377) );
  ADDFX1 U1560 ( .A(\UFIRROOT/UFIR/Reg3[11] ), .B(n225), .CI(n224), .CO(n231), 
        .S(n226) );
  ADDFX1 U1561 ( .A(n228), .B(n227), .CI(n226), .CO(n229), .S(n384) );
  ADDFX1 U1562 ( .A(n241), .B(n240), .CI(n239), .CO(n331), .S(n256) );
  NOR2X1 U1563 ( .A(n200), .B(n324), .Y(n243) );
  NOR2X1 U1564 ( .A(n901), .B(n332), .Y(n242) );
  NOR2X1 U1565 ( .A(n1527), .B(n328), .Y(n250) );
  ADDFX1 U1566 ( .A(n246), .B(n245), .CI(n244), .CO(n342), .S(n247) );
  ADDFX1 U1567 ( .A(n249), .B(n248), .CI(n247), .CO(n329), .S(n260) );
  ADDFX1 U1568 ( .A(\UFIRROOT/UFIR/Reg3[5] ), .B(n251), .CI(n250), .CO(n249), 
        .S(n268) );
  ADDFX1 U1569 ( .A(n254), .B(n253), .CI(n252), .CO(n257), .S(n266) );
  ADDFX1 U1570 ( .A(n257), .B(n256), .CI(n255), .CO(n345), .S(n258) );
  NOR2X1 U1571 ( .A(n316), .B(n315), .Y(n1149) );
  ADDFX1 U1572 ( .A(n260), .B(n259), .CI(n258), .CO(n315), .S(n314) );
  ADDFX1 U1573 ( .A(n263), .B(n262), .CI(n261), .CO(n255), .S(n307) );
  NOR2X1 U1574 ( .A(n200), .B(n326), .Y(n282) );
  ADDFX1 U1575 ( .A(\UFIRROOT/UFIR/Reg3[4] ), .B(n265), .CI(n264), .CO(n261), 
        .S(n296) );
  ADDFX1 U1576 ( .A(n268), .B(n267), .CI(n266), .CO(n259), .S(n305) );
  NOR2X1 U1577 ( .A(n314), .B(n313), .Y(n1147) );
  NOR2X1 U1578 ( .A(n1149), .B(n1147), .Y(n318) );
  INVXL U1579 ( .A(n1136), .Y(n272) );
  OAI21XL U1580 ( .A0(n1133), .A1(n272), .B0(n1134), .Y(n273) );
  ADDFX1 U1581 ( .A(n292), .B(n291), .CI(n290), .CO(n310), .S(n299) );
  ADDFX1 U1582 ( .A(n295), .B(n294), .CI(n293), .CO(n267), .S(n309) );
  ADDFX1 U1583 ( .A(n298), .B(n297), .CI(n296), .CO(n306), .S(n308) );
  INVXL U1584 ( .A(n1120), .Y(n304) );
  ADDFX1 U1585 ( .A(n307), .B(n306), .CI(n305), .CO(n313), .S(n312) );
  ADDFX1 U1586 ( .A(n310), .B(n309), .CI(n308), .CO(n311), .S(n303) );
  NOR2X1 U1587 ( .A(n312), .B(n311), .Y(n1154) );
  NAND2X1 U1588 ( .A(n314), .B(n313), .Y(n1146) );
  NAND2X1 U1589 ( .A(n316), .B(n315), .Y(n1150) );
  ADDFX1 U1590 ( .A(n323), .B(n322), .CI(n321), .CO(n348), .S(n341) );
  NOR2X1 U1591 ( .A(n387), .B(n386), .Y(n1110) );
  ADDFX1 U1592 ( .A(n349), .B(n348), .CI(n347), .CO(n370), .S(n367) );
  ADDFX1 U1593 ( .A(n358), .B(n357), .CI(n356), .CO(n378), .S(n375) );
  ADDHXL U1594 ( .A(\UFIRROOT/UFIR/Reg3[8] ), .B(n359), .CO(n373), .S(n353) );
  ADDFX1 U1595 ( .A(n364), .B(n363), .CI(n362), .CO(n371), .S(n347) );
  ADDFX1 U1596 ( .A(n367), .B(n366), .CI(n365), .CO(n388), .S(n387) );
  NOR2X2 U1597 ( .A(n389), .B(n388), .Y(n1112) );
  ADDFX1 U1598 ( .A(n370), .B(n369), .CI(n368), .CO(n391), .S(n389) );
  ADDFX1 U1599 ( .A(n379), .B(n378), .CI(n377), .CO(n383), .S(n380) );
  NOR2X2 U1600 ( .A(n391), .B(n390), .Y(n1105) );
  ADDFHX1 U1601 ( .A(n382), .B(n381), .CI(n380), .CO(n393), .S(n390) );
  NAND2X1 U1602 ( .A(n387), .B(n386), .Y(n1142) );
  NAND2X1 U1603 ( .A(n389), .B(n388), .Y(n1113) );
  NAND2X1 U1604 ( .A(n391), .B(n390), .Y(n1106) );
  NAND2XL U1605 ( .A(n393), .B(n392), .Y(n1100) );
  OAI21XL U1606 ( .A0(n1099), .A1(n1106), .B0(n1100), .Y(n394) );
  INVXL U1607 ( .A(n410), .Y(n403) );
  INVXL U1608 ( .A(n413), .Y(n1139) );
  INVXL U1609 ( .A(n414), .Y(n416) );
  NOR2X2 U1610 ( .A(n506), .B(n505), .Y(n509) );
  NOR2X1 U1611 ( .A(n788), .B(n452), .Y(n465) );
  NOR2X1 U1612 ( .A(n335), .B(n451), .Y(n450) );
  AOI21XL U1613 ( .A0(n207), .A1(n454), .B0(n208), .Y(n458) );
  NAND2XL U1614 ( .A(n456), .B(n455), .Y(n457) );
  NOR2X1 U1615 ( .A(n901), .B(n515), .Y(n479) );
  ADDFHX4 U1616 ( .A(n522), .B(n521), .CI(n520), .CO(n547), .S(n529) );
  AOI21X1 U1617 ( .A0(n1914), .A1(n586), .B0(n585), .Y(n587) );
  OAI21X2 U1618 ( .A0(n1905), .A1(n588), .B0(n587), .Y(n1903) );
  INVXL U1619 ( .A(\UFIRROOT/UFIR/Reg6[15] ), .Y(n614) );
  OAI21X1 U1620 ( .A0(\bcd_fir/bin_reg [5]), .A1(\bcd_fir/bin_reg [6]), .B0(
        \bcd_fir/bin_reg [7]), .Y(n628) );
  INVXL U1621 ( .A(\bcd_fir/bin_reg [5]), .Y(n629) );
  INVXL U1622 ( .A(n2016), .Y(n637) );
  AOI2BB2X1 U1623 ( .B0(n637), .B1(n636), .A0N(n635), .A1N(n634), .Y(n641) );
  INVXL U1624 ( .A(n638), .Y(n640) );
  OAI21X1 U1625 ( .A0(n2050), .A1(n640), .B0(n639), .Y(n648) );
  NAND2X2 U1626 ( .A(n2017), .B(n648), .Y(n643) );
  INVX2 U1627 ( .A(n643), .Y(n2049) );
  INVXL U1628 ( .A(n648), .Y(n642) );
  NAND2X2 U1629 ( .A(n643), .B(n2138), .Y(n657) );
  OAI2BB1X2 U1630 ( .A0N(n659), .A1N(n651), .B0(n653), .Y(n2052) );
  INVXL U1631 ( .A(\bcd_fir/bin_reg [2]), .Y(n656) );
  NOR2X1 U1632 ( .A(n653), .B(n656), .Y(n652) );
  OAI21X1 U1633 ( .A0(n2052), .A1(n654), .B0(n653), .Y(n670) );
  INVXL U1634 ( .A(n655), .Y(n660) );
  NAND2X4 U1635 ( .A(n662), .B(n670), .Y(n2081) );
  NAND2X4 U1636 ( .A(n2081), .B(n667), .Y(n666) );
  OAI21X4 U1637 ( .A0(n2081), .A1(n667), .B0(n666), .Y(n2071) );
  INVX2 U1638 ( .A(n2071), .Y(n668) );
  NAND2X1 U1639 ( .A(n669), .B(n668), .Y(n2084) );
  OAI2BB1X2 U1640 ( .A0N(\FIR_out0[0] ), .A1N(n2065), .B0(n2084), .Y(n675) );
  NAND2XL U1641 ( .A(n675), .B(n2085), .Y(FIR_out0_7[6]) );
  ADDHXL U1642 ( .A(n677), .B(n676), .CO(\UFIRROOT/mult_x_4/n139 ), .S(
        \UFIRROOT/mult_x_4/n140 ) );
  ADDFX1 U1643 ( .A(n680), .B(n679), .CI(n678), .CO(\UFIRROOT/mult_x_4/n147 ), 
        .S(\UFIRROOT/mult_x_4/n148 ) );
  ADDHXL U1644 ( .A(n682), .B(n681), .CO(\UFIRROOT/mult_x_4/n157 ), .S(
        \UFIRROOT/mult_x_4/n158 ) );
  ADDHXL U1645 ( .A(n684), .B(n683), .CO(\UFIRROOT/mult_x_4/n164 ), .S(
        \UFIRROOT/mult_x_4/n165 ) );
  ADDHXL U1646 ( .A(n689), .B(n688), .CO(n692), .S(n691) );
  INVXL U1647 ( .A(n740), .Y(n694) );
  INVXL U1648 ( .A(n813), .Y(n697) );
  INVXL U1649 ( .A(n761), .Y(n749) );
  OAI21XL U1650 ( .A0(n753), .A1(n718), .B0(n719), .Y(n706) );
  INVXL U1651 ( .A(n718), .Y(n720) );
  XNOR2X1 U1652 ( .A(n722), .B(n721), .Y(\UFIRROOT/UFIR/Reg1_d[14] ) );
  INVXL U1653 ( .A(n723), .Y(n725) );
  XNOR2X1 U1654 ( .A(n727), .B(n726), .Y(\UFIRROOT/UFIR/Reg1_d[11] ) );
  ADDHXL U1655 ( .A(n732), .B(n731), .CO(\UFIRROOT/mult_x_4/n173 ), .S(n685)
         );
  ADDHXL U1656 ( .A(n734), .B(n733), .CO(\UFIRROOT/mult_x_4/n169 ), .S(
        \UFIRROOT/mult_x_4/n170 ) );
  INVXL U1657 ( .A(n779), .Y(n738) );
  INVXL U1658 ( .A(n744), .Y(n746) );
  INVXL U1659 ( .A(n752), .Y(n754) );
  XNOR2X1 U1660 ( .A(n756), .B(n755), .Y(\UFIRROOT/UFIR/Reg1_d[13] ) );
  INVXL U1661 ( .A(n757), .Y(n760) );
  INVXL U1662 ( .A(n758), .Y(n759) );
  OAI21X1 U1663 ( .A0(n197), .A1(n760), .B0(n759), .Y(n764) );
  XNOR2X1 U1664 ( .A(n764), .B(n763), .Y(\UFIRROOT/UFIR/Reg1_d[12] ) );
  INVXL U1665 ( .A(n765), .Y(n767) );
  ADDFX1 U1666 ( .A(n772), .B(n771), .CI(n770), .CO(\UFIRROOT/mult_x_4/n137 ), 
        .S(\UFIRROOT/mult_x_4/n138 ) );
  ADDFX1 U1667 ( .A(n777), .B(n776), .CI(n775), .CO(\UFIRROOT/mult_x_4/n162 ), 
        .S(\UFIRROOT/mult_x_4/n163 ) );
  INVXL U1668 ( .A(n781), .Y(n783) );
  ADDFX1 U1669 ( .A(n791), .B(n790), .CI(n789), .CO(\UFIRROOT/mult_x_4/n129 ), 
        .S(\UFIRROOT/mult_x_4/n130 ) );
  ADDFX1 U1670 ( .A(n798), .B(n797), .CI(n796), .CO(\UFIRROOT/mult_x_4/n115 ), 
        .S(\UFIRROOT/mult_x_4/n116 ) );
  INVXL U1671 ( .A(n799), .Y(n801) );
  INVXL U1672 ( .A(n808), .Y(n810) );
  ADDHXL U1673 ( .A(n821), .B(n820), .CO(\UFIRROOT/mult_x_4/n149 ), .S(
        \UFIRROOT/mult_x_4/n150 ) );
  NOR2X1 U1674 ( .A(n333), .B(n905), .Y(n894) );
  NOR2X1 U1675 ( .A(n788), .B(n900), .Y(n893) );
  ADDFX1 U1676 ( .A(n829), .B(n828), .CI(n827), .CO(n842), .S(n878) );
  ADDFX1 U1677 ( .A(\UFIRROOT/UFIR/Reg2[7] ), .B(n831), .CI(n830), .CO(n846), 
        .S(n843) );
  ADDFX1 U1678 ( .A(n843), .B(n842), .CI(n841), .CO(n854), .S(n877) );
  ADDFX1 U1679 ( .A(n846), .B(n845), .CI(n844), .CO(n862), .S(n859) );
  ADDFX1 U1680 ( .A(n849), .B(n848), .CI(n847), .CO(n868), .S(n856) );
  ADDHXL U1681 ( .A(\UFIRROOT/UFIR/Reg2[8] ), .B(n850), .CO(n865), .S(n847) );
  NOR2X1 U1682 ( .A(n1340), .B(n900), .Y(n873) );
  ADDFX1 U1683 ( .A(n853), .B(n852), .CI(n851), .CO(n863), .S(n844) );
  ADDFX1 U1684 ( .A(n856), .B(n855), .CI(n854), .CO(n860), .S(n857) );
  NOR2X1 U1685 ( .A(n986), .B(n988), .Y(n1013) );
  INVXL U1686 ( .A(n1013), .Y(n874) );
  ADDFHX1 U1687 ( .A(n862), .B(n861), .CI(n860), .CO(n962), .S(n960) );
  ADDFX1 U1688 ( .A(n871), .B(n870), .CI(n869), .CO(n976), .S(n867) );
  ADDFX1 U1689 ( .A(n877), .B(n876), .CI(n875), .CO(n957), .S(n954) );
  ADDFX1 U1690 ( .A(n885), .B(n884), .CI(n883), .CO(n888), .S(n897) );
  ADDFX1 U1691 ( .A(n891), .B(n890), .CI(n889), .CO(n953), .S(n952) );
  ADDFX1 U1692 ( .A(n894), .B(n893), .CI(n892), .CO(n886), .S(n945) );
  ADDFX1 U1693 ( .A(n899), .B(n898), .CI(n897), .CO(n890), .S(n943) );
  NOR2X1 U1694 ( .A(n952), .B(n951), .Y(n1060) );
  NOR2X1 U1695 ( .A(n1051), .B(n1060), .Y(n956) );
  INVXL U1696 ( .A(n1010), .Y(n907) );
  OAI21XL U1697 ( .A0(n1007), .A1(n907), .B0(n1008), .Y(n908) );
  ADDFX1 U1698 ( .A(\UFIRROOT/UFIR/Reg2[2] ), .B(n915), .CI(n914), .CO(n939), 
        .S(n911) );
  ADDFX1 U1699 ( .A(\UFIRROOT/UFIR/Reg2[3] ), .B(n917), .CI(n916), .CO(n935), 
        .S(n938) );
  ADDFX1 U1700 ( .A(n930), .B(n929), .CI(n928), .CO(n948), .S(n937) );
  ADDFX1 U1701 ( .A(n933), .B(n932), .CI(n931), .CO(n898), .S(n947) );
  ADDFX1 U1702 ( .A(n939), .B(n938), .CI(n937), .CO(n940), .S(n927) );
  AOI21X1 U1703 ( .A0(n1072), .A1(n1071), .B0(n942), .Y(n1069) );
  ADDFX1 U1704 ( .A(n945), .B(n944), .CI(n943), .CO(n951), .S(n950) );
  ADDFX1 U1705 ( .A(n948), .B(n947), .CI(n946), .CO(n949), .S(n941) );
  NOR2X1 U1706 ( .A(n950), .B(n949), .Y(n1065) );
  NAND2X1 U1707 ( .A(n950), .B(n949), .Y(n1066) );
  OAI21X1 U1708 ( .A0(n1069), .A1(n1065), .B0(n1066), .Y(n1050) );
  NAND2X1 U1709 ( .A(n952), .B(n951), .Y(n1061) );
  OAI21X1 U1710 ( .A0(n1051), .A1(n1061), .B0(n1052), .Y(n955) );
  NAND2X1 U1711 ( .A(n960), .B(n959), .Y(n989) );
  INVXL U1712 ( .A(n1019), .Y(n963) );
  ADDFHX1 U1713 ( .A(n968), .B(n967), .CI(n966), .CO(n979), .S(n961) );
  ADDFX1 U1714 ( .A(n971), .B(n970), .CI(n969), .CO(n1025), .S(n975) );
  ADDFX1 U1715 ( .A(n977), .B(n976), .CI(n975), .CO(n1023), .S(n966) );
  NOR2X1 U1716 ( .A(n979), .B(n978), .Y(n1016) );
  INVXL U1717 ( .A(n1016), .Y(n980) );
  INVXL U1718 ( .A(n1012), .Y(n983) );
  INVXL U1719 ( .A(n988), .Y(n990) );
  INVXL U1720 ( .A(n993), .Y(n995) );
  INVXL U1721 ( .A(n1002), .Y(n1004) );
  INVXL U1722 ( .A(n1007), .Y(n1009) );
  NAND2XL U1723 ( .A(n1009), .B(n1008), .Y(n1011) );
  NOR2X1 U1724 ( .A(n1012), .B(n1016), .Y(n1018) );
  NAND2X1 U1725 ( .A(n1013), .B(n1018), .Y(n1021) );
  OAI21X2 U1726 ( .A0(n1022), .A1(n1021), .B0(n1020), .Y(n1087) );
  ADDFX1 U1727 ( .A(n1025), .B(n1024), .CI(n1023), .CO(n1040), .S(n978) );
  ADDFX1 U1728 ( .A(\UFIRROOT/UFIR/Reg2[11] ), .B(n1027), .CI(n1026), .CO(
        n1035), .S(n1030) );
  ADDFX1 U1729 ( .A(n1032), .B(n1031), .CI(n1030), .CO(n1033), .S(n1024) );
  NAND2XL U1730 ( .A(n1040), .B(n1039), .Y(n1084) );
  OAI21XL U1731 ( .A0(n1084), .A1(n1088), .B0(n1089), .Y(n1078) );
  AOI21X1 U1732 ( .A0(n1087), .A1(n1074), .B0(n1078), .Y(n1047) );
  XOR2X1 U1733 ( .A(n1047), .B(n1046), .Y(\UFIRROOT/UFIR/Reg3_d[14] ) );
  INVXL U1734 ( .A(n1051), .Y(n1053) );
  INVXL U1735 ( .A(n1060), .Y(n1062) );
  INVXL U1736 ( .A(n1065), .Y(n1067) );
  INVXL U1737 ( .A(n1075), .Y(n1076) );
  AOI21XL U1738 ( .A0(n1078), .A1(n1077), .B0(n1076), .Y(n1079) );
  AOI21X1 U1739 ( .A0(n1087), .A1(n1081), .B0(n1080), .Y(n1083) );
  INVXL U1740 ( .A(\UFIRROOT/UFIR/Reg2[15] ), .Y(n1082) );
  XOR2X1 U1741 ( .A(n1083), .B(n1082), .Y(\UFIRROOT/UFIR/Reg3_d[15] ) );
  INVXL U1742 ( .A(n1084), .Y(n1085) );
  AOI21X1 U1743 ( .A0(n1087), .A1(n1086), .B0(n1085), .Y(n1092) );
  INVXL U1744 ( .A(n1088), .Y(n1090) );
  XOR2X1 U1745 ( .A(n1092), .B(n1091), .Y(\UFIRROOT/UFIR/Reg3_d[13] ) );
  INVXL U1746 ( .A(n1104), .Y(n1093) );
  INVXL U1747 ( .A(n1095), .Y(n1096) );
  INVXL U1748 ( .A(n1099), .Y(n1101) );
  INVXL U1749 ( .A(n1105), .Y(n1107) );
  INVXL U1750 ( .A(n1110), .Y(n1143) );
  INVXL U1751 ( .A(n1142), .Y(n1111) );
  INVXL U1752 ( .A(n1112), .Y(n1114) );
  INVXL U1753 ( .A(n1147), .Y(n1118) );
  INVXL U1754 ( .A(n1128), .Y(n1130) );
  INVXL U1755 ( .A(n1133), .Y(n1135) );
  INVXL U1756 ( .A(n1149), .Y(n1151) );
  INVXL U1757 ( .A(n1154), .Y(n1156) );
  INVX4 U1758 ( .A(B2[6]), .Y(n1327) );
  NOR2X1 U1759 ( .A(n787), .B(n1327), .Y(n1247) );
  NOR2X1 U1760 ( .A(n1340), .B(n1211), .Y(n1246) );
  INVX2 U1761 ( .A(B2[4]), .Y(n1164) );
  NOR2X1 U1762 ( .A(n201), .B(n1164), .Y(n1191) );
  NOR2X1 U1763 ( .A(n901), .B(n1278), .Y(n1190) );
  ADDFX1 U1764 ( .A(n1167), .B(n1166), .CI(n1165), .CO(n1253), .S(n1182) );
  ADDFX1 U1765 ( .A(n1172), .B(n1171), .CI(n1170), .CO(n1259), .S(n1173) );
  ADDFX1 U1766 ( .A(n1180), .B(n1179), .CI(n1178), .CO(n1183), .S(n1192) );
  ADDFX1 U1767 ( .A(n1183), .B(n1182), .CI(n1181), .CO(n1262), .S(n1184) );
  NOR2X1 U1768 ( .A(n1243), .B(n1242), .Y(n1422) );
  ADDFX1 U1769 ( .A(n1186), .B(n1185), .CI(n1184), .CO(n1242), .S(n1241) );
  ADDFX1 U1770 ( .A(n1189), .B(n1188), .CI(n1187), .CO(n1181), .S(n1234) );
  ADDFX1 U1771 ( .A(\UFIRROOT/UFIR/Reg4[4] ), .B(n1191), .CI(n1190), .CO(n1187), .S(n1223) );
  ADDFX1 U1772 ( .A(n1194), .B(n1193), .CI(n1192), .CO(n1185), .S(n1232) );
  NOR2X1 U1773 ( .A(n1422), .B(n1427), .Y(n1245) );
  INVXL U1774 ( .A(n1415), .Y(n1199) );
  NAND2XL U1775 ( .A(n1198), .B(\UFIRROOT/UFIR/Reg4[0] ), .Y(n1413) );
  OAI21XL U1776 ( .A0(n1412), .A1(n1199), .B0(n1413), .Y(n1200) );
  ADDFX1 U1777 ( .A(\UFIRROOT/UFIR/Reg4[2] ), .B(n1207), .CI(n1206), .CO(n1228), .S(n1203) );
  ADDFHX1 U1778 ( .A(\UFIRROOT/UFIR/Reg4[3] ), .B(n1209), .CI(n1208), .CO(
        n1224), .S(n1227) );
  ADDFX1 U1779 ( .A(n1214), .B(n1213), .CI(n1212), .CO(n1215), .S(n1204) );
  ADDFX1 U1780 ( .A(n1219), .B(n1218), .CI(n1217), .CO(n1237), .S(n1226) );
  ADDFX1 U1781 ( .A(n1222), .B(n1221), .CI(n1220), .CO(n1193), .S(n1236) );
  ADDFX1 U1782 ( .A(n1225), .B(n1224), .CI(n1223), .CO(n1233), .S(n1235) );
  ADDFX1 U1783 ( .A(n1228), .B(n1227), .CI(n1226), .CO(n1229), .S(n1216) );
  INVXL U1784 ( .A(n1394), .Y(n1231) );
  ADDFX1 U1785 ( .A(n1237), .B(n1236), .CI(n1235), .CO(n1238), .S(n1230) );
  OAI21X1 U1786 ( .A0(n1432), .A1(n1433), .B0(n1434), .Y(n1421) );
  NAND2X1 U1787 ( .A(n1243), .B(n1242), .Y(n1423) );
  OAI21X1 U1788 ( .A0(n1422), .A1(n1428), .B0(n1423), .Y(n1244) );
  AOI21X2 U1789 ( .A0(n1245), .A1(n1421), .B0(n1244), .Y(n1370) );
  ADDFX1 U1790 ( .A(\UFIRROOT/UFIR/Reg4[7] ), .B(n1247), .CI(n1246), .CO(n1269), .S(n1260) );
  ADDFX1 U1791 ( .A(n1250), .B(n1249), .CI(n1248), .CO(n1268), .S(n1258) );
  ADDFHX1 U1792 ( .A(n1260), .B(n1259), .CI(n1258), .CO(n1270), .S(n1263) );
  ADDFX1 U1793 ( .A(n1263), .B(n1262), .CI(n1261), .CO(n1310), .S(n1243) );
  ADDFX1 U1794 ( .A(n1269), .B(n1268), .CI(n1267), .CO(n1284), .S(n1266) );
  ADDFX2 U1795 ( .A(n1272), .B(n1271), .CI(n1270), .CO(n1283), .S(n1264) );
  ADDFX1 U1796 ( .A(n1275), .B(n1274), .CI(n1273), .CO(n1290), .S(n1272) );
  ADDHXL U1797 ( .A(\UFIRROOT/UFIR/Reg4[8] ), .B(n1277), .CO(n1287), .S(n1273)
         );
  ADDFX1 U1798 ( .A(n1281), .B(n1280), .CI(n1279), .CO(n1285), .S(n1267) );
  ADDFX1 U1799 ( .A(n1293), .B(n1292), .CI(n1291), .CO(n1308), .S(n1289) );
  ADDFHX1 U1800 ( .A(\UFIRROOT/UFIR/Reg4[9] ), .B(n1296), .CI(n1295), .CO(
        n1300), .S(n1286) );
  NOR2X1 U1801 ( .A(n1315), .B(n1314), .Y(n1378) );
  ADDFX1 U1802 ( .A(n1299), .B(n1298), .CI(n1297), .CO(n1317), .S(n1314) );
  ADDFX1 U1803 ( .A(n1302), .B(n1301), .CI(n1300), .CO(n1324), .S(n1307) );
  ADDFX1 U1804 ( .A(\UFIRROOT/UFIR/Reg4[10] ), .B(n1305), .CI(n1304), .CO(
        n1330), .S(n1309) );
  ADDFX1 U1805 ( .A(n1309), .B(n1308), .CI(n1307), .CO(n1322), .S(n1297) );
  NAND2X1 U1806 ( .A(n1374), .B(n1319), .Y(n1321) );
  NAND2XL U1807 ( .A(n1313), .B(n1312), .Y(n1390) );
  NAND2XL U1808 ( .A(n1315), .B(n1314), .Y(n1377) );
  NAND2XL U1809 ( .A(n1317), .B(n1316), .Y(n1383) );
  OAI21XL U1810 ( .A0(n1382), .A1(n1377), .B0(n1383), .Y(n1318) );
  OAI21X2 U1811 ( .A0(n1370), .A1(n1321), .B0(n1320), .Y(n1367) );
  ADDFX1 U1812 ( .A(\UFIRROOT/UFIR/Reg4[11] ), .B(n1326), .CI(n1325), .CO(
        n1338), .S(n1329) );
  ADDFX1 U1813 ( .A(n1331), .B(n1330), .CI(n1329), .CO(n1336), .S(n1323) );
  ADDFX1 U1814 ( .A(\UFIRROOT/UFIR/Reg4[12] ), .B(n1342), .CI(n1341), .CO(
        n1346), .S(n1337) );
  AOI21X1 U1815 ( .A0(n1367), .A1(n1359), .B0(n1363), .Y(n1350) );
  INVXL U1816 ( .A(n1351), .Y(n1352) );
  AOI21X1 U1817 ( .A0(n1367), .A1(n1353), .B0(n1352), .Y(n1358) );
  INVXL U1818 ( .A(n1354), .Y(n1356) );
  XOR2X1 U1819 ( .A(n1358), .B(n1357), .Y(\UFIRROOT/UFIR/Reg5_d[13] ) );
  INVXL U1820 ( .A(n1360), .Y(n1361) );
  INVXL U1821 ( .A(n1364), .Y(n1365) );
  AOI21X1 U1822 ( .A0(n1367), .A1(n1366), .B0(n1365), .Y(n1369) );
  INVXL U1823 ( .A(\UFIRROOT/UFIR/Reg4[15] ), .Y(n1368) );
  XOR2X1 U1824 ( .A(n1369), .B(n1368), .Y(\UFIRROOT/UFIR/Reg5_d[15] ) );
  INVXL U1825 ( .A(n1378), .Y(n1371) );
  INVXL U1826 ( .A(n1374), .Y(n1375) );
  INVXL U1827 ( .A(n1376), .Y(n1379) );
  INVXL U1828 ( .A(n1382), .Y(n1384) );
  INVXL U1829 ( .A(n1387), .Y(n1418) );
  INVXL U1830 ( .A(n1417), .Y(n1388) );
  INVXL U1831 ( .A(n1389), .Y(n1391) );
  INVXL U1832 ( .A(n1398), .Y(n1400) );
  INVXL U1833 ( .A(n1407), .Y(n1409) );
  INVXL U1834 ( .A(n1412), .Y(n1414) );
  NAND2XL U1835 ( .A(n1414), .B(n1413), .Y(n1416) );
  INVXL U1836 ( .A(n1422), .Y(n1424) );
  INVXL U1837 ( .A(n1427), .Y(n1429) );
  INVXL U1838 ( .A(n1433), .Y(n1435) );
  NOR2X1 U1839 ( .A(n901), .B(n1602), .Y(n1520) );
  NOR2X1 U1840 ( .A(n1831), .B(n1484), .Y(n1519) );
  INVX2 U1841 ( .A(B1[4]), .Y(n1562) );
  NOR2X1 U1842 ( .A(n902), .B(n1611), .Y(n1522) );
  NOR2X1 U1843 ( .A(n1604), .B(n1528), .Y(n1521) );
  ADDFX1 U1844 ( .A(n1439), .B(n1438), .CI(n1437), .CO(n1526), .S(n1454) );
  ADDFHX1 U1845 ( .A(n1444), .B(n1443), .CI(n1442), .CO(n1533), .S(n1445) );
  ADDFX1 U1846 ( .A(n1452), .B(n1451), .CI(n1450), .CO(n1455), .S(n1465) );
  ADDFX1 U1847 ( .A(n1455), .B(n1454), .CI(n1453), .CO(n1536), .S(n1456) );
  ADDFX1 U1848 ( .A(n1458), .B(n1457), .CI(n1456), .CO(n1515), .S(n1514) );
  ADDFX1 U1849 ( .A(n1461), .B(n1460), .CI(n1459), .CO(n1453), .S(n1507) );
  ADDFHX1 U1850 ( .A(\UFIRROOT/UFIR/Reg5[4] ), .B(n1464), .CI(n1463), .CO(
        n1459), .S(n1496) );
  ADDFX1 U1851 ( .A(n1467), .B(n1466), .CI(n1465), .CO(n1457), .S(n1505) );
  NOR2X1 U1852 ( .A(n1514), .B(n1513), .Y(n1690) );
  INVXL U1853 ( .A(n1674), .Y(n1471) );
  NAND2XL U1854 ( .A(n1470), .B(\UFIRROOT/UFIR/Reg5[0] ), .Y(n1672) );
  OAI21XL U1855 ( .A0(n1671), .A1(n1471), .B0(n1672), .Y(n1472) );
  ADDFX1 U1856 ( .A(n1492), .B(n1491), .CI(n1490), .CO(n1510), .S(n1499) );
  ADDFX1 U1857 ( .A(n1495), .B(n1494), .CI(n1493), .CO(n1466), .S(n1509) );
  ADDFX1 U1858 ( .A(n1507), .B(n1506), .CI(n1505), .CO(n1513), .S(n1512) );
  ADDFX1 U1859 ( .A(n1510), .B(n1509), .CI(n1508), .CO(n1511), .S(n1503) );
  NAND2X1 U1860 ( .A(n1514), .B(n1513), .Y(n1691) );
  NAND2X1 U1861 ( .A(n1516), .B(n1515), .Y(n1686) );
  OAI21X1 U1862 ( .A0(n1685), .A1(n1691), .B0(n1686), .Y(n1517) );
  ADDFX1 U1863 ( .A(\UFIRROOT/UFIR/Reg5[7] ), .B(n1520), .CI(n1519), .CO(n1543), .S(n1534) );
  ADDFX1 U1864 ( .A(n1523), .B(n1522), .CI(n1521), .CO(n1542), .S(n1532) );
  ADDFX1 U1865 ( .A(n1534), .B(n1533), .CI(n1532), .CO(n1544), .S(n1537) );
  ADDFX1 U1866 ( .A(n1537), .B(n1536), .CI(n1535), .CO(n1585), .S(n1516) );
  ADDFX1 U1867 ( .A(n1540), .B(n1539), .CI(n1538), .CO(n1587), .S(n1586) );
  ADDFX1 U1868 ( .A(n1543), .B(n1542), .CI(n1541), .CO(n1581), .S(n1540) );
  ADDFX1 U1869 ( .A(n1549), .B(n1548), .CI(n1547), .CO(n1561), .S(n1546) );
  ADDHXL U1870 ( .A(\UFIRROOT/UFIR/Reg5[8] ), .B(n1551), .CO(n1558), .S(n1547)
         );
  ADDFX1 U1871 ( .A(n1555), .B(n1554), .CI(n1553), .CO(n1556), .S(n1541) );
  ADDFX1 U1872 ( .A(n1561), .B(n1560), .CI(n1559), .CO(n1583), .S(n1579) );
  ADDFX1 U1873 ( .A(n1565), .B(n1564), .CI(n1563), .CO(n1577), .S(n1560) );
  ADDFX1 U1874 ( .A(n1571), .B(n1570), .CI(n1569), .CO(n1599), .S(n1576) );
  ADDFX1 U1875 ( .A(\UFIRROOT/UFIR/Reg5[10] ), .B(n1574), .CI(n1573), .CO(
        n1606), .S(n1578) );
  ADDFX1 U1876 ( .A(n1578), .B(n1577), .CI(n1576), .CO(n1597), .S(n1582) );
  ADDFHX1 U1877 ( .A(n1584), .B(n1583), .CI(n1582), .CO(n1592), .S(n1589) );
  NOR2X1 U1878 ( .A(n1590), .B(n1589), .Y(n1650) );
  NAND2X1 U1879 ( .A(n1586), .B(n1585), .Y(n1680) );
  NAND2XL U1880 ( .A(n1588), .B(n1587), .Y(n1658) );
  NAND2X1 U1881 ( .A(n1590), .B(n1589), .Y(n1651) );
  NAND2XL U1882 ( .A(n1592), .B(n1591), .Y(n1644) );
  OAI21XL U1883 ( .A0(n1643), .A1(n1651), .B0(n1644), .Y(n1593) );
  ADDFX1 U1884 ( .A(\UFIRROOT/UFIR/Reg5[11] ), .B(n1601), .CI(n1600), .CO(
        n1610), .S(n1605) );
  ADDFX1 U1885 ( .A(n1607), .B(n1606), .CI(n1605), .CO(n1608), .S(n1598) );
  NAND2XL U1886 ( .A(n1617), .B(n1616), .Y(n1676) );
  OAI21XL U1887 ( .A0(n1676), .A1(n1633), .B0(n1634), .Y(n1625) );
  INVXL U1888 ( .A(\UFIRROOT/UFIR/Reg5[15] ), .Y(n1623) );
  INVXL U1889 ( .A(n1676), .Y(n1632) );
  INVXL U1890 ( .A(n1633), .Y(n1635) );
  XOR2X1 U1891 ( .A(n1637), .B(n1636), .Y(\UFIRROOT/UFIR/Reg6_d[13] ) );
  INVXL U1892 ( .A(n1649), .Y(n1638) );
  INVXL U1893 ( .A(n1648), .Y(n1640) );
  INVXL U1894 ( .A(n1643), .Y(n1645) );
  INVXL U1895 ( .A(n1650), .Y(n1652) );
  INVXL U1896 ( .A(n1655), .Y(n1681) );
  INVXL U1897 ( .A(n1680), .Y(n1656) );
  INVXL U1898 ( .A(n1657), .Y(n1659) );
  INVXL U1899 ( .A(n1666), .Y(n1668) );
  INVXL U1900 ( .A(n1671), .Y(n1673) );
  NAND2XL U1901 ( .A(n1673), .B(n1672), .Y(n1675) );
  INVXL U1902 ( .A(n1685), .Y(n1687) );
  INVXL U1903 ( .A(n1690), .Y(n1692) );
  INVXL U1904 ( .A(n1695), .Y(n1697) );
  INVX2 U1905 ( .A(n1711), .Y(n1831) );
  NOR2X1 U1906 ( .A(n1831), .B(n1821), .Y(n1714) );
  NOR2X1 U1907 ( .A(n1820), .B(n1826), .Y(n1713) );
  ADDFX1 U1908 ( .A(n1717), .B(n1716), .CI(n1715), .CO(n1879), .S(n1871) );
  ADDFX1 U1909 ( .A(\UFIRROOT/UFIR/Reg1[11] ), .B(n1719), .CI(n1718), .CO(
        n1725), .S(n1720) );
  ADDFX1 U1910 ( .A(n1722), .B(n1721), .CI(n1720), .CO(n1723), .S(n1878) );
  NOR2X1 U1911 ( .A(n901), .B(n1818), .Y(n1814) );
  NOR2X1 U1912 ( .A(n1831), .B(n1778), .Y(n1813) );
  ADDFX1 U1913 ( .A(n1735), .B(n1734), .CI(n1733), .CO(n1825), .S(n1750) );
  NOR2X1 U1914 ( .A(n335), .B(n1826), .Y(n1736) );
  ADDFHX1 U1915 ( .A(\UFIRROOT/UFIR/Reg1[6] ), .B(n1737), .CI(n1736), .CO(
        n1832), .S(n1742) );
  ADDFX1 U1916 ( .A(n1740), .B(n1739), .CI(n1738), .CO(n1836), .S(n1741) );
  ADDFX1 U1917 ( .A(n1743), .B(n1742), .CI(n1741), .CO(n1823), .S(n1754) );
  ADDFX1 U1918 ( .A(n1748), .B(n1747), .CI(n1746), .CO(n1751), .S(n1760) );
  ADDFX1 U1919 ( .A(n1754), .B(n1753), .CI(n1752), .CO(n1809), .S(n1808) );
  ADDFX1 U1920 ( .A(\UFIRROOT/UFIR/Reg1[4] ), .B(n1759), .CI(n1758), .CO(n1755), .S(n1790) );
  ADDFX1 U1921 ( .A(n1762), .B(n1761), .CI(n1760), .CO(n1753), .S(n1799) );
  NOR2X1 U1922 ( .A(n1991), .B(n1996), .Y(n1812) );
  INVXL U1923 ( .A(n2014), .Y(n1766) );
  ADDFX1 U1924 ( .A(\UFIRROOT/UFIR/Reg1[2] ), .B(n1774), .CI(n1773), .CO(n1795), .S(n1770) );
  ADDFX1 U1925 ( .A(\UFIRROOT/UFIR/Reg1[3] ), .B(n1776), .CI(n1775), .CO(n1791), .S(n1794) );
  ADDFX1 U1926 ( .A(n1781), .B(n1780), .CI(n1779), .CO(n1782), .S(n1771) );
  ADDFX1 U1927 ( .A(n1786), .B(n1785), .CI(n1784), .CO(n1804), .S(n1793) );
  ADDFX1 U1928 ( .A(n1789), .B(n1788), .CI(n1787), .CO(n1761), .S(n1803) );
  ADDFX1 U1929 ( .A(n1792), .B(n1791), .CI(n1790), .CO(n1800), .S(n1802) );
  ADDFX1 U1930 ( .A(n1795), .B(n1794), .CI(n1793), .CO(n1796), .S(n1783) );
  INVXL U1931 ( .A(n1969), .Y(n1798) );
  AOI21X1 U1932 ( .A0(n1971), .A1(n1970), .B0(n1798), .Y(n2005) );
  ADDFX1 U1933 ( .A(n1801), .B(n1800), .CI(n1799), .CO(n1807), .S(n1806) );
  ADDFX1 U1934 ( .A(n1804), .B(n1803), .CI(n1802), .CO(n1805), .S(n1797) );
  NOR2X1 U1935 ( .A(n1806), .B(n1805), .Y(n2001) );
  NAND2X1 U1936 ( .A(n1806), .B(n1805), .Y(n2002) );
  OAI21X1 U1937 ( .A0(n2005), .A1(n2001), .B0(n2002), .Y(n1990) );
  NAND2X1 U1938 ( .A(n1808), .B(n1807), .Y(n1997) );
  NAND2X1 U1939 ( .A(n1810), .B(n1809), .Y(n1992) );
  OAI21X1 U1940 ( .A0(n1991), .A1(n1997), .B0(n1992), .Y(n1811) );
  ADDFX1 U1941 ( .A(n1817), .B(n1816), .CI(n1815), .CO(n1842), .S(n1835) );
  ADDFHX1 U1942 ( .A(n1825), .B(n1824), .CI(n1823), .CO(n1860), .S(n1838) );
  ADDFX1 U1943 ( .A(n1834), .B(n1833), .CI(n1832), .CO(n1845), .S(n1824) );
  ADDFHX1 U1944 ( .A(n1837), .B(n1836), .CI(n1835), .CO(n1844), .S(n1840) );
  ADDFX1 U1945 ( .A(n1840), .B(n1839), .CI(n1838), .CO(n1880), .S(n1810) );
  ADDFX1 U1946 ( .A(n1843), .B(n1842), .CI(n1841), .CO(n1864), .S(n1861) );
  ADDFHX1 U1947 ( .A(n1846), .B(n1845), .CI(n1844), .CO(n1863), .S(n1859) );
  ADDFX1 U1948 ( .A(n1849), .B(n1848), .CI(n1847), .CO(n1870), .S(n1846) );
  ADDFX1 U1949 ( .A(n1852), .B(n1851), .CI(n1850), .CO(n1872), .S(n1869) );
  ADDHXL U1950 ( .A(\UFIRROOT/UFIR/Reg1[8] ), .B(n1853), .CO(n1867), .S(n1847)
         );
  ADDFX1 U1951 ( .A(n1858), .B(n1857), .CI(n1856), .CO(n1865), .S(n1841) );
  NOR2X1 U1952 ( .A(n1883), .B(n1882), .Y(n1964) );
  NOR2X1 U1953 ( .A(n1962), .B(n1964), .Y(n1956) );
  ADDFX1 U1954 ( .A(n1870), .B(n1869), .CI(n1868), .CO(n1875), .S(n1862) );
  ADDFX1 U1955 ( .A(n1873), .B(n1872), .CI(n1871), .CO(n1877), .S(n1874) );
  ADDFHX1 U1956 ( .A(n1876), .B(n1875), .CI(n1874), .CO(n1887), .S(n1884) );
  ADDFX1 U1957 ( .A(n1879), .B(n1878), .CI(n1877), .CO(n1893), .S(n1886) );
  OAI21X1 U1958 ( .A0(n1964), .A1(n1986), .B0(n1965), .Y(n1955) );
  OAI21X2 U1959 ( .A0(n1946), .A1(n1891), .B0(n1890), .Y(n1985) );
  NAND2XL U1960 ( .A(n1893), .B(n1892), .Y(n1982) );
  OAI21XL U1961 ( .A0(n1982), .A1(n1940), .B0(n1941), .Y(n1932) );
  INVXL U1962 ( .A(n1934), .Y(n1897) );
  AOI21XL U1963 ( .A0(n1932), .A1(n1935), .B0(n1897), .Y(n1898) );
  AOI21X1 U1964 ( .A0(n1985), .A1(n1933), .B0(n1932), .Y(n1937) );
  XOR2X1 U1965 ( .A(n1937), .B(n1936), .Y(\UFIRROOT/UFIR/Reg2_d[14] ) );
  INVXL U1966 ( .A(n1982), .Y(n1939) );
  AOI21X1 U1967 ( .A0(n1985), .A1(n1983), .B0(n1939), .Y(n1944) );
  INVXL U1968 ( .A(n1940), .Y(n1942) );
  XOR2X1 U1969 ( .A(n1944), .B(n1943), .Y(\UFIRROOT/UFIR/Reg2_d[13] ) );
  INVXL U1970 ( .A(n1956), .Y(n1945) );
  INVXL U1971 ( .A(n1955), .Y(n1947) );
  INVXL U1972 ( .A(n1950), .Y(n1952) );
  INVXL U1973 ( .A(n1957), .Y(n1959) );
  INVXL U1974 ( .A(n1964), .Y(n1966) );
  INVXL U1975 ( .A(n1977), .Y(n1979) );
  INVXL U1976 ( .A(n1991), .Y(n1993) );
  INVXL U1977 ( .A(n1996), .Y(n1998) );
  INVXL U1978 ( .A(n2001), .Y(n2003) );
  INVXL U1979 ( .A(n2006), .Y(n2008) );
  INVXL U1980 ( .A(n2011), .Y(n2013) );
  AOI21XL U1981 ( .A0(ap_2[3]), .A1(ap_2[1]), .B0(ap[12]), .Y(n2131) );
  INVXL U1982 ( .A(n2131), .Y(ap[10]) );
  NAND2XL U1983 ( .A(\UFIRROOT/UROOT/C3_1 ), .B(\UFIRROOT/UROOT/C2_1 ), .Y(
        n2022) );
  AOI2BB1XL U1984 ( .A0N(n2033), .A1N(\UFIRROOT/UROOT/C1_1 ), .B0(n2018), .Y(
        n2027) );
  NOR3XL U1985 ( .A(\UFIRROOT/UROOT/X_r3[0] ), .B(\UFIRROOT/UROOT/X_r3[2] ), 
        .C(\UFIRROOT/UROOT/X_r3[1] ), .Y(n2021) );
  INVXL U1986 ( .A(\UFIRROOT/UROOT/X_r3[3] ), .Y(n2020) );
  AOI2BB2XL U1987 ( .B0(\UFIRROOT/UROOT/C2_1 ), .B1(\UFIRROOT/UROOT/C1_1 ), 
        .A0N(\UFIRROOT/UROOT/C1_1 ), .A1N(\UFIRROOT/UROOT/C2_1 ), .Y(n2019) );
  OAI21XL U1988 ( .A0(\UFIRROOT/UROOT/C3_1 ), .A1(\UFIRROOT/UROOT/C2_1 ), .B0(
        n2022), .Y(n2023) );
  AOI222XL U1989 ( .A0(\UFIRROOT/UROOT/X_r3[4] ), .A1(n2024), .B0(
        \UFIRROOT/UROOT/X_r3[4] ), .B1(n2023), .C0(n2024), .C1(n2023), .Y(
        n2026) );
  NAND2BXL U1990 ( .AN(\UFIRROOT/UROOT/C1_1 ), .B(\UFIRROOT/UROOT/C2_1 ), .Y(
        n2028) );
  NAND2XL U1991 ( .A(\UFIRROOT/UROOT/C3_1 ), .B(n2028), .Y(n2029) );
  AOI222XL U1992 ( .A0(\UFIRROOT/UROOT/X_r3[6] ), .A1(n2030), .B0(
        \UFIRROOT/UROOT/X_r3[6] ), .B1(n2029), .C0(n2030), .C1(n2029), .Y(
        n2032) );
  INVXL U1993 ( .A(\UFIRROOT/UROOT/X_r3[7] ), .Y(n2031) );
  AOI222XL U1994 ( .A0(n2033), .A1(n2032), .B0(n2033), .B1(n2031), .C0(n2032), 
        .C1(n2031), .Y(\UFIRROOT/UROOT/U4/N0 ) );
  INVXL U1995 ( .A(ap_2[3]), .Y(n2132) );
  OAI211XL U1996 ( .A0(m1[0]), .A1(n2034), .B0(n2103), .C0(n2100), .Y(m1_7[6])
         );
  OAI31XL U1997 ( .A0(h0[1]), .A1(n2040), .A2(n2036), .B0(n2035), .Y(h0_7[4])
         );
  OAI211XL U1998 ( .A0(h0[0]), .A1(n2120), .B0(n2123), .C0(n2038), .Y(h0_7[0])
         );
  NAND2XL U1999 ( .A(n2040), .B(n2121), .Y(n2041) );
  OAI211XL U2000 ( .A0(n2126), .A1(n2118), .B0(n2119), .C0(n2041), .Y(h0_7[5])
         );
  INVXL U2001 ( .A(m0[2]), .Y(n2111) );
  OAI31XL U2002 ( .A0(m0[1]), .A1(n2047), .A2(n2043), .B0(n2042), .Y(m0_7[4])
         );
  OAI211XL U2003 ( .A0(m0[0]), .A1(n2106), .B0(n2109), .C0(n2045), .Y(m0_7[0])
         );
  OAI211XL U2004 ( .A0(n2112), .A1(n2104), .B0(n2105), .C0(n2048), .Y(m0_7[5])
         );
  OR2XL U2005 ( .A(\UFIRROOT/FIRouttemp [7]), .B(\UFIRROOT/FIRouttemp [6]), 
        .Y(\UFIRROOT/n29 ) );
  INVXL U2006 ( .A(h1[1]), .Y(h1_7[6]) );
  INVXL U2007 ( .A(h1[0]), .Y(h1_7[1]) );
  INVXL U2008 ( .A(\FIR_out2[1] ), .Y(FIR_out2_7[3]) );
  XOR2XL U2009 ( .A(\FIR_out2[1] ), .B(n2049), .Y(n2053) );
  INVXL U2010 ( .A(n2053), .Y(n2055) );
  NAND2XL U2011 ( .A(n2072), .B(n2078), .Y(FIR_out1_7[3]) );
  NAND2XL U2012 ( .A(n2059), .B(n2058), .Y(FIR_out1_7[4]) );
  INVXL U2013 ( .A(n2099), .Y(\FIR_out2_7[2] ) );
  OAI211XL U2014 ( .A0(n2072), .A1(n2081), .B0(n2064), .C0(n2082), .Y(
        FIR_out1_7[0]) );
  INVXL U2015 ( .A(\FIR_out0[0] ), .Y(n2087) );
  NAND2XL U2016 ( .A(n2067), .B(n2087), .Y(FIR_out0_7[3]) );
  OAI21XL U2017 ( .A0(n2065), .A1(n2087), .B0(n2086), .Y(FIR_out0_7[2]) );
  OAI211XL U2018 ( .A0(n2067), .A1(\FIR_out0[0] ), .B0(n2085), .C0(n2068), .Y(
        FIR_out0_7[0]) );
  OAI211XL U2019 ( .A0(\FIR_out0[0] ), .A1(n2071), .B0(n2070), .C0(n2069), .Y(
        FIR_out0_7[4]) );
  OAI21XL U2020 ( .A0(n2080), .A1(n2078), .B0(n2076), .Y(FIR_out1_7[2]) );
  NAND2XL U2021 ( .A(n2075), .B(n2074), .Y(n2079) );
  OAI211XL U2022 ( .A0(n2078), .A1(n2077), .B0(n2076), .C0(n2082), .Y(
        FIR_out1_7[5]) );
  NAND2XL U2023 ( .A(n2083), .B(n2082), .Y(FIR_out1_7[6]) );
  OAI211XL U2024 ( .A0(n2088), .A1(n2087), .B0(n2086), .C0(n2085), .Y(
        FIR_out0_7[5]) );
  INVXL U2025 ( .A(\UFIRROOT/UROOT/X_r2[6] ), .Y(n2092) );
  OR3XL U2026 ( .A(\UFIRROOT/UROOT/X_r2[2] ), .B(\UFIRROOT/UROOT/X_r2[4] ), 
        .C(\UFIRROOT/UROOT/X_r2[3] ), .Y(n2090) );
  NAND2XL U2027 ( .A(\UFIRROOT/UROOT/C3_2 ), .B(\UFIRROOT/UROOT/C2_2 ), .Y(
        n2093) );
  OAI21XL U2028 ( .A0(\UFIRROOT/UROOT/C3_2 ), .A1(\UFIRROOT/UROOT/C2_2 ), .B0(
        n2093), .Y(n2089) );
  AOI222XL U2029 ( .A0(\UFIRROOT/UROOT/X_r2[5] ), .A1(n2090), .B0(
        \UFIRROOT/UROOT/X_r2[5] ), .B1(n2089), .C0(n2090), .C1(n2089), .Y(
        n2091) );
  AOI222XL U2030 ( .A0(\UFIRROOT/UROOT/C3_2 ), .A1(n2092), .B0(
        \UFIRROOT/UROOT/C3_2 ), .B1(n2091), .C0(n2092), .C1(n2091), .Y(n2095)
         );
  OAI21XL U2031 ( .A0(\UFIRROOT/UROOT/X_r2[7] ), .A1(n2095), .B0(n2093), .Y(
        n2094) );
  OAI2BB1XL U2032 ( .A0N(\UFIRROOT/UROOT/X_r2[7] ), .A1N(n2095), .B0(n2094), 
        .Y(\UFIRROOT/UROOT/U3/N0 ) );
  NOR3XL U2033 ( .A(\UFIRROOT/UROOT/X_r1[6] ), .B(\UFIRROOT/UROOT/X_r1[5] ), 
        .C(\UFIRROOT/UROOT/X_r1[4] ), .Y(n2097) );
  INVXL U2034 ( .A(\UFIRROOT/UROOT/X_r1[7] ), .Y(n2096) );
  AOI222XL U2035 ( .A0(n2097), .A1(\UFIRROOT/UROOT/C3_3 ), .B0(n2097), .B1(
        n2096), .C0(\UFIRROOT/UROOT/C3_3 ), .C1(n2096), .Y(
        \UFIRROOT/UROOT/U2/N0 ) );
  NAND2XL U2036 ( .A(n2098), .B(n2101), .Y(m1_7[5]) );
  INVXL U2037 ( .A(m1[0]), .Y(n2117) );
  OAI2BB1XL U2038 ( .A0N(n2117), .A1N(n2103), .B0(n2100), .Y(m1_7[0]) );
  NAND2XL U2039 ( .A(h1[0]), .B(h1[1]), .Y(\h1_7[5] ) );
  NAND2XL U2040 ( .A(n2100), .B(n2103), .Y(n2102) );
  OR2XL U2041 ( .A(m1[0]), .B(n2103), .Y(m1_7[3]) );
  NAND2XL U2042 ( .A(h1_7[1]), .B(h1_7[6]), .Y(h1_7[3]) );
  AND2XL U2044 ( .A(ap_2[0]), .B(ap[14]), .Y(ap[15]) );
  AOI32XL U2046 ( .A0(n2106), .A1(n2108), .A2(m0[3]), .B0(n2105), .B1(n2108), 
        .Y(m0_7[2]) );
  OAI211XL U2047 ( .A0(m0[0]), .A1(n2110), .B0(n2109), .C0(n2108), .Y(m0_7[6])
         );
  OAI21XL U2048 ( .A0(m0[1]), .A1(n2115), .B0(n2114), .Y(m0_7[3]) );
  AOI32XL U2049 ( .A0(m1[1]), .A1(n2117), .A2(m1[2]), .B0(m1[0]), .B1(n2116), 
        .Y(m1_7[4]) );
  OAI2BB1XL U2050 ( .A0N(h0[3]), .A1N(n2121), .B0(n2119), .Y(h0_7[1]) );
  AOI32XL U2051 ( .A0(n2120), .A1(n2122), .A2(h0[3]), .B0(n2119), .B1(n2122), 
        .Y(h0_7[2]) );
  NAND2XL U2052 ( .A(n2126), .B(n2121), .Y(n2124) );
  OAI211XL U2053 ( .A0(h0[0]), .A1(n2124), .B0(n2123), .C0(n2122), .Y(h0_7[6])
         );
  OAI21XL U2054 ( .A0(h0[1]), .A1(n2129), .B0(n2128), .Y(h0_7[3]) );
  OR2XL U2055 ( .A(ap_2[0]), .B(ap[2]), .Y(ap[1]) );
  AOI2BB1XL U2056 ( .A0N(ap_2[0]), .A1N(ap_2[1]), .B0(n2130), .Y(ap[13]) );
  OAI2BB1XL U2057 ( .A0N(ap_2[3]), .A1N(n2134), .B0(n2130), .Y(ap[11]) );
  OAI2BB1XL U2058 ( .A0N(ap_2[0]), .A1N(ap_2[3]), .B0(n2131), .Y(ap[9]) );
  OAI2BB1XL U2059 ( .A0N(ap_2[2]), .A1N(n2134), .B0(n2132), .Y(ap[7]) );
  OAI2BB1XL U2060 ( .A0N(ap_2[0]), .A1N(ap[4]), .B0(n2133), .Y(ap[5]) );
  OR2XL U2061 ( .A(n2134), .B(ap[4]), .Y(ap[3]) );
  CMPR42X1 U2062 ( .A(\UFIRROOT/mult_x_4/n195 ), .B(\UFIRROOT/mult_x_4/n181 ), 
        .C(\UFIRROOT/mult_x_4/n209 ), .D(\UFIRROOT/mult_x_4/n126 ), .ICI(
        \UFIRROOT/mult_x_4/n129 ), .S(\UFIRROOT/mult_x_4/n122 ), .ICO(
        \UFIRROOT/mult_x_4/n120 ), .CO(\UFIRROOT/mult_x_4/n121 ) );
  CMPR42X1 U2063 ( .A(\UFIRROOT/mult_x_4/n196 ), .B(\UFIRROOT/mult_x_4/n210 ), 
        .C(\UFIRROOT/mult_x_4/n203 ), .D(\UFIRROOT/mult_x_4/n139 ), .ICI(
        \UFIRROOT/mult_x_4/n134 ), .S(\UFIRROOT/mult_x_4/n128 ), .ICO(
        \UFIRROOT/mult_x_4/n126 ), .CO(\UFIRROOT/mult_x_4/n127 ) );
  CMPR42X1 U2064 ( .A(\UFIRROOT/mult_x_4/n227 ), .B(\UFIRROOT/mult_x_4/n213 ), 
        .C(\UFIRROOT/mult_x_4/n158 ), .D(\UFIRROOT/mult_x_4/n162 ), .ICI(
        \UFIRROOT/mult_x_4/n156 ), .S(\UFIRROOT/mult_x_4/n153 ), .ICO(
        \UFIRROOT/mult_x_4/n151 ), .CO(\UFIRROOT/mult_x_4/n152 ) );
  CMPR42X1 U2065 ( .A(\UFIRROOT/mult_x_4/n235 ), .B(\UFIRROOT/mult_x_4/n165 ), 
        .C(\UFIRROOT/mult_x_4/n169 ), .D(\UFIRROOT/mult_x_4/n166 ), .ICI(
        \UFIRROOT/mult_x_4/n163 ), .S(\UFIRROOT/mult_x_4/n161 ), .ICO(
        \UFIRROOT/mult_x_4/n159 ), .CO(\UFIRROOT/mult_x_4/n160 ) );
  CMPR42X1 U2066 ( .A(\UFIRROOT/mult_x_4/n211 ), .B(\UFIRROOT/mult_x_4/n197 ), 
        .C(\UFIRROOT/mult_x_4/n140 ), .D(\UFIRROOT/mult_x_4/n144 ), .ICI(
        \UFIRROOT/mult_x_4/n138 ), .S(\UFIRROOT/mult_x_4/n136 ), .ICO(
        \UFIRROOT/mult_x_4/n134 ), .CO(\UFIRROOT/mult_x_4/n135 ) );
endmodule


module bcd_0 ( clk, rst_n, bin_in, dec_out0, dec_out1, dec_out2 );
  input [7:0] bin_in;
  output [3:0] dec_out0;
  output [3:0] dec_out1;
  output [3:0] dec_out2;
  input clk, rst_n;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20;
  wire   [15:1] bin_reg;

  DFFRHQXL \bin_reg_reg[2]  ( .D(bin_in[2]), .CK(clk), .RN(rst_n), .Q(
        bin_reg[2]) );
  DFFRHQXL \bin_reg_reg[1]  ( .D(bin_in[1]), .CK(clk), .RN(rst_n), .Q(
        bin_reg[1]) );
  DFFRHQXL \bin_reg_reg[0]  ( .D(bin_in[0]), .CK(clk), .RN(rst_n), .Q(
        dec_out0[0]) );
  DFFRHQXL \bin_reg_reg[5]  ( .D(bin_in[5]), .CK(clk), .RN(rst_n), .Q(
        bin_reg[5]) );
  DFFRHQXL \bin_reg_reg[4]  ( .D(bin_in[4]), .CK(clk), .RN(rst_n), .Q(
        bin_reg[4]) );
  DFFRHQXL \bin_reg_reg[3]  ( .D(bin_in[3]), .CK(clk), .RN(rst_n), .Q(
        bin_reg[3]) );
  INVXL U3 ( .A(n6), .Y(n11) );
  NAND2X1 U4 ( .A(bin_reg[4]), .B(n5), .Y(n7) );
  AOI2BB1X1 U5 ( .A0N(n7), .A1N(dec_out1[1]), .B0(n6), .Y(n20) );
  NOR2X1 U6 ( .A(bin_reg[4]), .B(n5), .Y(n6) );
  AOI2BB1X1 U7 ( .A0N(bin_reg[4]), .A1N(bin_reg[3]), .B0(n4), .Y(dec_out1[2])
         );
  NAND2X1 U8 ( .A(bin_reg[5]), .B(n3), .Y(n5) );
  INVX1 U9 ( .A(bin_reg[3]), .Y(n3) );
  INVX1 U10 ( .A(n12), .Y(n13) );
  INVX1 U11 ( .A(n19), .Y(n14) );
  NAND2X1 U12 ( .A(n18), .B(n15), .Y(n19) );
  AOI32X1 U13 ( .A0(n8), .A1(n11), .A2(n9), .B0(n7), .B1(n11), .Y(dec_out1[1])
         );
  INVX1 U14 ( .A(bin_reg[1]), .Y(n15) );
  INVX1 U15 ( .A(bin_reg[2]), .Y(n8) );
  OAI21X1 U16 ( .A0(dec_out1[0]), .A1(n15), .B0(n16), .Y(dec_out0[1]) );
  OAI22XL U17 ( .A0(bin_reg[2]), .A1(n11), .B0(n10), .B1(n9), .Y(n12) );
  AND2XL U18 ( .A(n8), .B(dec_out1[1]), .Y(n10) );
  OAI22XL U19 ( .A0(n20), .A1(n19), .B0(n18), .B1(n17), .Y(dec_out0[2]) );
  AOI22XL U20 ( .A0(bin_reg[3]), .A1(n4), .B0(dec_out1[2]), .B1(n3), .Y(n9) );
  OAI32XL U21 ( .A0(n14), .A1(n20), .A2(n12), .B0(n13), .B1(n19), .Y(
        dec_out0[3]) );
  OAI21X1 U22 ( .A0(n14), .A1(n13), .B0(n20), .Y(dec_out1[0]) );
  AOI32XL U23 ( .A0(n7), .A1(bin_reg[2]), .A2(n11), .B0(n8), .B1(dec_out1[1]), 
        .Y(n18) );
  INVXL U24 ( .A(bin_reg[5]), .Y(n4) );
  NAND2X1 U25 ( .A(n15), .B(dec_out1[0]), .Y(n16) );
  INVXL U26 ( .A(n16), .Y(n17) );
endmodule


module bcd_1 ( clk, rst_n, bin_in, dec_out0, dec_out2, \dec_out1[3] , 
        \dec_out1[2] , \dec_out1[1]_BAR , \dec_out1[0]  );
  input [7:0] bin_in;
  output [3:0] dec_out0;
  output [3:0] dec_out2;
  input clk, rst_n;
  output \dec_out1[3] , \dec_out1[2] , \dec_out1[1]_BAR , \dec_out1[0] ;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [15:1] bin_reg;

  DFFRHQXL \bin_reg_reg[1]  ( .D(bin_in[1]), .CK(clk), .RN(rst_n), .Q(
        bin_reg[1]) );
  DFFRHQXL \bin_reg_reg[0]  ( .D(bin_in[0]), .CK(clk), .RN(rst_n), .Q(
        dec_out0[0]) );
  DFFRHQXL \bin_reg_reg[3]  ( .D(bin_in[3]), .CK(clk), .RN(rst_n), .Q(
        bin_reg[3]) );
  DFFRHQXL \bin_reg_reg[2]  ( .D(bin_in[2]), .CK(clk), .RN(rst_n), .Q(
        bin_reg[2]) );
  DFFRHQXL \bin_reg_reg[4]  ( .D(bin_in[4]), .CK(clk), .RN(rst_n), .Q(
        bin_reg[4]) );
  AOI2BB1X1 U3 ( .A0N(bin_reg[2]), .A1N(\dec_out1[1]_BAR ), .B0(n6), .Y(n12)
         );
  OAI21X1 U4 ( .A0(bin_reg[2]), .A1(n5), .B0(bin_reg[3]), .Y(n9) );
  NAND2X1 U5 ( .A(bin_reg[4]), .B(\dec_out1[1]_BAR ), .Y(n10) );
  XOR2X1 U6 ( .A(n4), .B(n9), .Y(dec_out0[3]) );
  AOI2BB1X1 U7 ( .A0N(bin_reg[1]), .A1N(\dec_out1[0] ), .B0(n8), .Y(
        dec_out0[1]) );
  AOI32X1 U8 ( .A0(n12), .A1(n10), .A2(n7), .B0(n9), .B1(n10), .Y(
        \dec_out1[0] ) );
  NOR2X1 U9 ( .A(bin_reg[1]), .B(n9), .Y(n11) );
  AOI21XL U10 ( .A0(n9), .A1(n10), .B0(n7), .Y(n8) );
  OAI22XL U11 ( .A0(n12), .A1(n11), .B0(bin_reg[1]), .B1(n10), .Y(dec_out0[2])
         );
  AOI31XL U12 ( .A0(bin_reg[2]), .A1(bin_reg[3]), .A2(n5), .B0(n8), .Y(n4) );
  AND2XL U13 ( .A(n5), .B(bin_reg[2]), .Y(n6) );
  OAI21XL U14 ( .A0(bin_reg[3]), .A1(bin_reg[2]), .B0(bin_reg[4]), .Y(
        \dec_out1[1]_BAR ) );
  INVXL U15 ( .A(bin_reg[4]), .Y(n5) );
  INVXL U16 ( .A(bin_reg[1]), .Y(n7) );
endmodule

