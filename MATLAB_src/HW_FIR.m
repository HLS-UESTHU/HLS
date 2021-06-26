function [Yout] = HW_FIR(Xin,B)
    % Xin, vector, length 7, range: >=0, <=255
    % B, vector, length 7
    % Yout, scalar, FIR result
    
    Xin_HW = BinRound(Xin,32,0,3);
    B_HW = BinRound(B,4,0,6);
    
    Reg=zeros(1,7);
    Reg(1) = Xin_HW(1) * B_HW(7);
    Reg(1) = BinRound(Reg(1),256,0,8);
    for i = 2:7
        Reg(i) = Xin_HW(i) * B_HW(8-i) + Reg(i-1);
        Reg(i) = BinRound(Reg(i),256,0,8);
    end
    
    Yout = BinRound(Reg(7),256,0,0);
end