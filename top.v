//`include "RTC.v"
//`include "bcd.v"
//`include "decode7.v"
//`include "fir.v"

module top(
//OVERALL
    input               clk,
    input               rst_n,

//TIME
    input       [4:0]   initial_time_hh,
    input       [5:0]   initial_time_mm,
    input               initial_time_valid,

//FIR
    input               PEbar,
    input       [7:0]   data_1,
    input       [7:0]   data_2,
    output      [7:0]   out,

//LCD
    output      [6:0]  h1_7,
    output      [6:0]  h0_7,
    output      [6:0]  m1_7,
    output      [6:0]  m0_7,
    output      [6:0]  FIR_out0_7,
    output      [6:0]  FIR_out1_7,
    output      [6:0]  FIR_out2_7,
    output      [3:0]  ap
);


    wire      [3:0]  h1;
    wire      [3:0]  h0;
    wire      [3:0]  m1;
    wire      [3:0]  m0;
    wire      [3:0]  FIR_out0;
    wire      [3:0]  FIR_out1;
    wire      [3:0]  FIR_out2;
    
wire    [7:0]   data;
assign  data = data_1 | data_2;

wire    [7:0]   fir_2;
wire    [3:0]   ap_2;

wire    [4:0]   hh_2;
wire    [5:0]   mm_2;



fir fir(
    .clk(clk),
    .rst_n(rst_n),
    .PEbar_i(PEbar),
    .data_i(data),
    .out(fir_2),
    .ap(ap_2)
    );
assign out=fir_2;
assign ap=ap_2;

bcd bcd_fir(
    .bin_in(fir_2),
    .dec_out0(FIR_out0),
    .dec_out1(FIR_out1),
    .dec_out2(FIR_out2),
    .clk(clk),
    .rst_n(rst_n)
    );

decode7 dec0(
.in(FIR_out0),
.led(FIR_out0_7)
);
decode7 dec1(
.in(FIR_out1),
.led(FIR_out1_7)
);
decode7 dec2(
.in(FIR_out2),
.led(FIR_out2_7)
);

RTC RTC(
    .clk(clk),
    .rst_n(rst_n),
    .initial_time_hh(initial_time_hh),
    .initial_time_mm(initial_time_mm),
    .initial_time_valid(initial_time_valid),
    .hh(hh_2),
    .mm(mm_2)
);
bcd bcd_RTC_hh(
    .bin_in({3'b0,hh_2}),
    .dec_out0(h0),
    .dec_out1(h1),
    .dec_out2(),
    .clk(clk),
    .rst_n(rst_n)
);

decode7 dec3(
.in(h0),
.led(h0_7)
);
decode7 dec4(
.in(h1),
.led(h1_7)
);

bcd bcd_RTC_mm(
    .bin_in({2'b0,mm_2}),
    .dec_out0(m0),
    .dec_out1(m1),
    .dec_out2(),
    .clk(clk),
    .rst_n(rst_n)
);

decode7 dec5(
.in(m0),
.led(m0_7)
);
decode7 dec6(
.in(m1),
.led(m1_7)
);

endmodule