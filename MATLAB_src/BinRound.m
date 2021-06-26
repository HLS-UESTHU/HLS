function [RodNum] = BinRound(PrecisNum,UpBound,LowBound,Bit)
    % round a precise number into a rounded number in binary 
    % Bit is the precision of RodNum in its binary representation, showing
    % its lowest binary bit after dot
    % PrecisNum within (0,255)
    
    % author     :Auyuir
    % date       :2019-7-16
    
    if ((min(PrecisNum) < LowBound) || (max(PrecisNum) >= UpBound))
        fprintf("Input number out of bound, Precise=%f\n",PrecisNum);
    end
    
    RodNum = floor(PrecisNum./(2^(-Bit)))./2^(Bit);
end