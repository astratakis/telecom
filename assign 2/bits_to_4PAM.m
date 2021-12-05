function Xn = bits_to_4PAM(bits)
    
    for i = 1:length(bits(1, :))
        
        if (bits(1, i) == 0 && bits(2, i) == 0)
            Xn(i) = 3;
        elseif (bits(1, i) == 0 && bits(2, i) == 1)
            Xn(i) = 1;
        elseif (bits(1, i) == 1 && bits(2, i) == 0)
            Xn(i) = -1;
        elseif (bits(1, i) == 1 && bits(2, i) == 1)
            Xn(i) = -3;
        else
            disp('ERROR');
        end
    end
end