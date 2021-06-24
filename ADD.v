module ADD (
    input [15:0]Addend1,
    input [15:0]Addend2,

    output [15:0]Sum
);
    
    assign Sum = Addend1 + Addend2;
endmodule