module fir(
//OVERALL
    input               clk,
    input               rst_n,

//FIR
    input               PEbar_i,
    input       [7:0]   data_i,
    output      [7:0]   out,
    output      [3:0]   ap
);



reg             [7:0]   data;
reg             [7:0]   data0;
reg             [7:0]   data1;
reg             [7:0]   data2;
reg             [7:0]   data3;
reg             [7:0]   data4;
reg             [7:0]   data5;
reg             [7:0]   data6;

reg             start;   

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
    begin
        data<=0;
        start<=0;
    end
    else
    begin
        if(PEbar_i)
        begin
        data<=data_i;
        start<=1;
        end
        if(start)
        data<=data+1;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
    begin
        data0<=0;
        data1<=0;
        data2<=0;
        data3<=0;
        data4<=0;
        data5<=0;
        data6<=0;
    end
    else
    begin
        if(start)
        begin
        data0<=data+1;
        data1<=data0+1;
        data2<=data1+1;
        data3<=data2+1;
        data4<=data3+1;
        data5<=data4+1;
        data6<=data5+1;
        end
    end
end

assign out=data6;
assign ap=data6[3:0];

endmodule