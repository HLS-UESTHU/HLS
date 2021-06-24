module CPR (
    //Comparator
    input [7:0] Operator,
    input [7:0] Threshold,

    output Result
);
    assign Result = (Operator >= Threshold) ? 1'b1 : 1'b0;

endmodule