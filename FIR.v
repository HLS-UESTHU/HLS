module FIR (
    input clk,
    //input Rst_n,

    input [7:0]Xin,
    input [7:0]B0,
    input [7:0]B1,
    input [7:0]B2,
    input [7:0]B3,
    input [7:0]B4,
    input [7:0]B5,
    input [7:0]B6,

    output [7:0]Yout
);
    //Xin : dot left, 5 bits; dot right, 3 bits.
    //B : dot left, 2 bits; dot right, 6 bits.
    //Reg : dot left, 8bits; dot right, 8 bits.

    reg [15:0]Reg1;
    reg [15:0]Reg2;
    reg [15:0]Reg3;
    reg [15:0]Reg4;
    reg [15:0]Reg5;
    reg [15:0]Reg6;
    reg [15:0]Reg7;

    wire [15:0]Reg1_d;
    wire [15:0]Reg2_d;
    wire [15:0]Reg3_d;
    wire [15:0]Reg4_d;
    wire [15:0]Reg5_d;
    wire [15:0]Reg6_d;
    wire [15:0]Reg7_d;

    //*****CS1*****
    MUL U1 (
    .Multiplicand(Xin),
    .Multiplier(B6),
    .Product(Reg1_d));

    always @(posedge clk) begin
        Reg1 <= {1'b0,Reg1_d[15:1]};
    end

    //*****CS2*****
    wire [15:0]U2_out;
    MUL U2 (
    .Multiplicand(Xin),
    .Multiplier(B5),
    .Product(U2_out));

    ADD U8 (
    .Addend1({1'b0,U2_out[15:1]}),
    .Addend2(Reg1),
    .Sum(Reg2_d));

    always @(posedge clk ) begin
        Reg2 <= Reg2_d;
    end

    //*****CS3*****
    wire [15:0]U3_out;
    MUL U3 (
    .Multiplicand(Xin),
    .Multiplier(B4),
    .Product(U3_out));

    ADD U9 (
    .Addend1({1'b0,U3_out[15:1]}),
    .Addend2(Reg2),
    .Sum(Reg3_d));

    always @(posedge clk ) begin
        Reg3 <= Reg3_d;
    end

    //*****CS4*****
    wire [15:0]U4_out;
    MUL U4 (
    .Multiplicand(Xin),
    .Multiplier(B3),
    .Product(U4_out));

    ADD U10 (
    .Addend1({1'b0,U4_out[15:1]}),
    .Addend2(Reg3),
    .Sum(Reg4_d));

    always @(posedge clk ) begin
        Reg4 <= Reg4_d;
    end

    //*****CS5*****
    wire [15:0]U5_out;
    MUL U5 (
    .Multiplicand(Xin),
    .Multiplier(B2),
    .Product(U5_out));

    ADD U11 (
    .Addend1({1'b0,U5_out[15:1]}),
    .Addend2(Reg4),
    .Sum(Reg5_d));

    always @(posedge clk ) begin
        Reg5 <= Reg5_d;
    end

    //*****CS6*****
    wire [15:0]U6_out;
    MUL U6 (
    .Multiplicand(Xin),
    .Multiplier(B1),
    .Product(U6_out));

    ADD U12 (
    .Addend1({1'b0,U6_out[15:1]}),
    .Addend2(Reg5),
    .Sum(Reg6_d));

    always @(posedge clk ) begin
        Reg6 <= Reg6_d;
    end

    //*****CS7*****
    wire [15:0]U7_out;
    MUL U7 (
    .Multiplicand(Xin),
    .Multiplier(B0),
    .Product(U7_out));

    ADD U13 (
    .Addend1({1'b0,U7_out[15:1]}),
    .Addend2(Reg6),
    .Sum(Reg7_d));

    always @(posedge clk ) begin
        Reg7 <= Reg7_d;
    end

    assign Yout = Reg7[15:8];
    
endmodule