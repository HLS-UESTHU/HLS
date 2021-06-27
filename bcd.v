module bcd
 #( parameter                W = 16)  // input width
  ( 
input				clk	,
input				rst_n	,
input      [7:0] bin_in   ,  // binary
output   [3:0]   	dec_out0,
output   [3:0]   	dec_out1,
output   [3:0]   	dec_out2	
       ); // bcd {...,thousands,hundreds,tens,ones}

reg [W-1:0] bin_reg;

reg [W+(W-4)/3:0] bcd;
  integer i,j;

always@(posedge clk or negedge rst_n) begin
	if(rst_n == 1'b0)
		bin_reg <= 'd0;
	else
		bin_reg <= {{8'b00000000},bin_in};
end

  always @(bin_reg) begin
    for(i = 0; i <= W+(W-4)/3; i = i+1) bcd[i] = 0;     // initialize with zeros
    bcd[W-1:0] = bin_reg;                                   // initialize with input vector
    for(i = 0; i <= W-4; i = i+1)                       // iterate on structure depth
      for(j = 0; j <= i/3; j = j+1)                     // iterate on structure width
        if (bcd[W-i+4*j -: 4] > 4)                      // if > 4
          bcd[W-i+4*j -: 4] = bcd[W-i+4*j -: 4] + 4'd3; // add 3
  end
assign dec_out0=bcd[3:0];
assign dec_out1=bcd[7:4];
assign dec_out2=bcd[11:8];

endmodule


