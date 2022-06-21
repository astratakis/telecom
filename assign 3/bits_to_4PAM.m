function [Xn] = bits_to_4PAM(bits, A)
    
    index = 1;
    for i = 1:length(bits)/2
        if (bits(index) == 0 && bits(index+1) == 0)
            Xn(i) = -3*A;
        elseif (bits(index) == 0 && bits(index+1) == 1)
            Xn(i) = -1*A;
        elseif (bits(index) == 1 && bits(index+1) == 0)
            Xn(i) = A;
        else
            Xn(i) = 3*A;
        end
        index = index + 2;
    end 
end