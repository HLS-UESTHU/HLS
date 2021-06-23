module decode7(
input wire [3:0] in,//输入的数字
output reg [6:0] led//7段译码管的映射
    );
always @ (*)
    case(in)
        4'b0000: begin
        led = 7'b0111111;       //0
        end
        4'b0001: begin
        led = 7'b0011000;       //1
        end
        4'b0010: begin
        led = 7'b1110110;       //2
        end
        4'b0011: begin
        led = 7'b1111100;       //3
        end
        4'b0100: begin
        led = 7'b1011001;       //4
        end
        4'b0101: begin
        led = 7'b1101101;       //5
        end
        4'b0110: begin
        led = 7'b1101111;       //6
        end
        4'b0111: begin
        led = 7'b0111000;       //7
        end
        4'b1000: begin
        led = 7'b1111111;       //8
        end
        4'b1001: begin
        led = 7'b1111001;       //9
        end
        4'b1010: begin
        led = 7'b1111011;       //A
        end
        4'b1011: begin
        led = 7'b1001111;       //b
        end
        4'b1100: begin
        led = 7'b0100111;       //C
        end
        4'b1101: begin
        led = 7'b1011110;       //d
        end
        4'b1110: begin
        led = 7'b1100111;       //E
        end
        4'b1111: begin
        led = 7'b1100011;       //F
        end
    endcase


endmodule








