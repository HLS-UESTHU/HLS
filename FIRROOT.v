module FIRROOT (
    input Clk,
    input Rst_n,

    input [7:0]Data_i,
    input [7:0]B0,
    input [7:0]B1,
    input [7:0]B2,
    input [7:0]B3,
    input [7:0]B4,
    input [7:0]B5,
    input [7:0]B6,

    output [7:0] FIRout,
    output [7:0] ROOTout
);

    wire [7:0] FIRouttemp;
    FIR UFIR (
    .Clk(Clk),
    .Rst_n(Rst_n),
    .Xin(Data_i),
    .B0(B0),
    .B1(B1),
    .B2(B2),
    .B3(B3),
    .B4(B4),
    .B5(B5),
    .B6(B6),
    .Yout(FIRouttemp)
    );

    ROOT UROOT(
    .Clk(Clk),
    .X(FIRouttemp),
    .C(ROOTout),
    .X_r4(FIRout)
    );

    
endmodule