module ROOT (
    input clk,

    input [7:0] X,

    output [3:0] C,
    output reg [7:0] X_r4
);
    
    reg [7:0]X_r1;
    reg [7:0]X_r2;
    reg [7:0]X_r3;
    //reg [7:0]X_r4;//Add this stage for original X output

    reg C3_3;
    reg C3_2;
    reg C3_1;
    reg C3_0;

    wire C3_3_d;

    reg C2_2;
    reg C2_1;
    reg C2_0;
    
    wire C2_2_d;
    
    reg C1_1;
    reg C1_0;

    wire C1_1_d;

    reg C0_0;

    wire C0_0_d;

    //*****CS1*****
    CPR U1 (
    .Operator(X),
    .Threshold(8'd64),
    .Result(C3_3_d));

    always @(posedge clk ) begin
        X_r1 <= X;
    end
    always @(posedge clk ) begin
        C3_3 <= C3_3_d;
    end

    //*****CS2*****
    wire [7:0] T1;
    assign T1 = C3_3 ? 8'd144 : 8'd16;

    CPR U2 (
    .Operator(X_r1),
    .Threshold(T1),
    .Result(C2_2_d));

    always @(posedge clk ) begin
        X_r2 <= X_r1;
    end
    always @(posedge clk ) begin
        C3_2 <= C3_3;
    end
    always @(posedge clk ) begin
        C2_2 <= C2_2_d;
    end

    //*****CS3*****
    wire [7:0] T2;
    assign T2 = C3_2 ? (C2_2 ? 8'd196 : 8'd100) : (C2_2 ? 8'd36 : 8'd4);

    CPR U3 (
    .Operator(X_r2),
    .Threshold(T2),
    .Result(C1_1_d));

    always @(posedge clk ) begin
        X_r3 <= X_r2;
    end
    always @(posedge clk ) begin
        C3_1 <= C3_2;
    end
    always @(posedge clk ) begin
        C2_1 <= C2_2;
    end
    always @(posedge clk ) begin
        C1_1 <= C1_1_d;
    end

    //*****CS4*****
    wire [7:0] T3;
    assign T3 = C3_1 ? 
    (C2_1 ? (C1_1 ? 8'd225 : 8'd169) : (C1_1 ? 8'd121 : 8'd81))
    : 
    (C2_1 ? (C1_1 ? 8'd49 : 8'd25) : (C1_1 ? 8'd9 : 8'd1));

    CPR U4 (
    .Operator(X_r3),
    .Threshold(T3),
    .Result(C0_0_d));

    always @(posedge clk ) begin
        X_r4 <= X_r3;
    end
    always @(posedge clk ) begin
        C3_0 <= C3_1;
    end
    always @(posedge clk ) begin
        C2_0 <= C2_1;
    end
    always @(posedge clk ) begin
        C1_0 <= C1_1;
    end
    always @(posedge clk ) begin
        C0_0 <= C0_0_d;
    end

    assign C = {C3_0,C2_0,C1_0,C0_0};

endmodule