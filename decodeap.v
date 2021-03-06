module decodeap(
input wire [3:0] in,
output reg [15:0] led
    );
always @ (*)
    case(in)
        4'b0000: led = 16'b0000_0000_0000_0001;
        4'b0001: led = 16'b0000_0000_0000_0011;
        4'b0010: led = 16'b0000_0000_0000_0111;
        4'b0011: led = 16'b0000_0000_0000_1111;
        4'b0100: led = 16'b0000_0000_0001_1111;
        4'b0101: led = 16'b0000_0000_0011_1111;
        4'b0110: led = 16'b0000_0000_0111_1111;
        4'b0111: led = 16'b0000_0000_1111_1111;
        4'b1000: led = 16'b0000_0001_1111_1111;
        4'b1001: led = 16'b0000_0011_1111_1111;
        4'b1010: led = 16'b0000_0111_1111_1111;
        4'b1011: led = 16'b0000_1111_1111_1111;
        4'b1100: led = 16'b0001_1111_1111_1111;
        4'b1101: led = 16'b0011_1111_1111_1111;
        4'b1110: led = 16'b0111_1111_1111_1111;
        4'b1111: led = 16'b1111_1111_1111_1111;
    endcase


endmodule
