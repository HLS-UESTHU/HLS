function[Xin_full,B] =  FIR_StimuliGen(XinLength,BLength)
    
    %XinLength = 20;
    %BLength = 7;
    
    Xin_full = ones(1,XinLength);
    Data_i_vec_bin = fopen('Data_i_vec_bin.txt','w+');
    for i =  1:XinLength
        temp = num2str(rand(1,8)<0.5);
        fprintf(Data_i_vec_bin,'%s\n',temp);
        Xin_full(i) = bin2dec(temp)/8;
    end
    
    B = ones(1,BLength);
    B_vec_bin = fopen('B_vec_bin.txt','w+');
    for i =  1:BLength
        temp = num2str(rand(1,8)<0.5);
        fprintf(B_vec_bin,'%s\n',temp);
        B(i) = bin2dec(temp)/64;
    end
end

    
    