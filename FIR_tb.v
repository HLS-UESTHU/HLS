module FIRROOT_tb();
reg Clk;
//reg Rst_n;

reg [7:0]Data_i;
reg [7:0]B0;
reg [7:0]B1;
reg [7:0]B2;
reg [7:0]B3;
reg [7:0]B4;
reg [7:0]B5;
reg [7:0]B6;

wire [7:0] FIRout;
wire [7:0] ROOTout;

FIRROOT DUT(
//    .Rst_n (Rst_n),
    .Clk (Clk),
    .Data_i(Data_i),
    .B0(B0),
    .B1(B1),
    .B2(B2),
    .B3(B3),
    .B4(B4),
    .B5(B5),
    .B6(B6),
    .FIRout(FIRout),
    .ROOTout(ROOTout)
);

reg [7:0] Data_i_vec [0:19];
reg [7:0] B_vec [0:6];
initial begin
    $readmemb("E:/OneDrive/course_HLS/Project/HLS/MATLAB_src/Data_i_vec_bin.txt",Data_i_vec);
    $readmemb("E:/OneDrive/course_HLS/Project/HLS/MATLAB_src/B_vec_bin.txt",B_vec);
    B0 = B_vec[0];
    B1 = B_vec[1];
    B2 = B_vec[2];
    B3 = B_vec[3];
    B4 = B_vec[4];
    B5 = B_vec[5];
    B6 = B_vec[6];
end

localparam CLK_PERIOD = 10;
always begin
   #(CLK_PERIOD/2) Clk=~Clk; 
end

integer Data_i_index = 0;
initial begin
//    Rst_n = 1'b1;
    Clk = 1'b0;
//    #4 Rst_n = 1'b0;
//    #(CLK_PERIOD/2) Rst_n = 1'b1;

    for (Data_i_index=0;Data_i_index<=19;Data_i_index=Data_i_index+1) begin
        @(posedge Clk)
        #1
        Data_i = Data_i_vec[Data_i_index];
    end
end

endmodule