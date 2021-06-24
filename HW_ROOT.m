function [C] = HW_ROOT(A)
    %A, scalar, FIR result
    %Xn3, scalar, ROOT result
    
    A_HW = BinRound(A,255,0,0);
    
    %CS1
    if (A_HW >= 64)
        C3 = 1;
    else
        C3 = 0;
    end
    
    %CS2
    if (C3)
        T1 = 144;
    else
        T1 = 16;
    end
    
    if (A_HW >= T1)
        C2 = 1;
    else
        C2 = 0;
    end
    
    %CS3
    if (C3)
        if (C2)
            T2 = 196;
        else
            T2 = 100;
        end
    else
        if (C2)
            T2 = 36;
        else
            T2 = 4;
        end
    end
    
    if (A_HW >= T2)
        C1 = 1;
    else
        C1 = 0;
    end
    
    %CS4
    if (C3)
        if (C2)
            if (C1)
                T3 = 225;
            else
                T3 = 169;
            end
        else
            if (C1)
                T3 = 121;
            else
                T3 = 81;
            end
        end
    else
        if (C2)
            if (C1)
                T3 = 49;
            else
                T3 = 25;
            end
        else
            if (C1)
                T3 = 9;
            else
                T3 = 1;
            end
        end
    end
    
    if (A_HW >= T3)
        C0 = 1;
    else
        C0 = 0;
    end
    
    C = C3*8 + C2*4 + C1*2 + C0;
end     