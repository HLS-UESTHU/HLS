function HW_FIR_sim_agent
    XinLength = 20;
    BLength = 7;
    
    [Xin_full,B] = FIR_StimuliGen(XinLength,BLength);
    
    for i = 1:(XinLength-BLength+1)
        Xin = Xin_full(i:(i+6));
        Yout = HW_FIR(Xin,B);
        fprintf('Yout is %d, its bin is %8s\n',Yout, dec2bin(Yout));
    end
end
