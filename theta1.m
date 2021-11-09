function [phi] = theta1(T, t)
    
    phi = (1/sqrt(T))*(abs(t) <= T/2);
end