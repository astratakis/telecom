function [array_of_symbols] = bits_to_2PAM(b)
    
    for i = 1:length(b)
        if b(i) == 0
            array_of_symbols(i) = 1;
        else
            array_of_symbols(i) = -1;
        end
    end
end