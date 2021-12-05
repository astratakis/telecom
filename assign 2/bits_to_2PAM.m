function [Xn] = bits_to_2PAM(bits)

    for i = 1:length(bits)
        if (bits(i) == 0)
            Xn(i) = 1;
        else
            Xn(i) = -1;
        end
end