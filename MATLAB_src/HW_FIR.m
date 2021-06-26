function [Yout] = HW_FIR(Xin,B)
    % Xin, vector, length 7, range: >=0, <=255
    % B, vector, length 7
    % Yout, scalar, FIR result
    
    Xin_HW = BinRound(Xin,32,0,3);
    B_HW = BinRound(B,4,0,6);
    
    Yout = Xin_HW * B_HW';
    %if (Yout >= 2^16)
    %    sprintf('This result is too large')
    %end
    
    Yout = BinRound(Yout,256,0,0);
end