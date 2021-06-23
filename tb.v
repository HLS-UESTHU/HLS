`timescale 1ns / 1ps

module tb(

    );
    reg               clk;
    reg               rst_n;

//TIME
    reg       [4:0]   initial_time_hh;
    reg       [5:0]   initial_time_mm;
    reg               initial_time_valid;

//FIR
    reg               PEbar;
    reg       [7:0]   data_1;
    reg       [7:0]   data_2;
    wire      [7:0]   out;

//LCD
    wire      [6:0]  h1_7;
    wire      [6:0]  h0_7;
    wire      [6:0]  m1_7;
    wire      [6:0]  m0_7;
    wire      [6:0]  FIR_out0_7;
    wire      [6:0]  FIR_out1_7;
    wire      [6:0]  FIR_out2_7;
    wire      [3:0]  ap;

    initial begin
        clk=0;
        rst_n=0;
        PEbar=0;
        data_1=0;
        data_2=0;
        initial_time_hh=0;
        initial_time_mm=0;
        initial_time_valid=0;
    end

    initial begin
        forever begin
            #10 clk=~clk;
        end
    end

    initial begin
        #100 rst_n=1;
        #20000000 $stop;
    end

    initial begin
        #120    initial_time_hh=5'd12;
                initial_time_mm=6'd35;
                initial_time_valid=1;
        #20     initial_time_valid=0;
    end

    initial begin
        #200 PEbar=1;
        data_1=8'd77;
        data_2=8'd66;
    end
    
    top uut(
    .clk(clk),
    .rst_n(rst_n),
    .initial_time_hh(initial_time_hh),
    .initial_time_mm(initial_time_mm),
    .initial_time_valid(initial_time_valid),
    .PEbar(PEbar),
    .data_1(data_1),
    .data_2(data_2),
    .out(out),
    .h1_7(h1_7),
    .h0_7(h0_7),
    .m1_7(m1_7),
    .m0_7(m0_7),
    .FIR_out0_7(FIR_out0_7),
    .FIR_out1_7(FIR_out1_7),
    .FIR_out2_7(FIR_out2_7),
    .ap(ap)
    );
    
endmodule