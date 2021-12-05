function [X, x_t] = generate_x_function(Xn, phi, phi_t, T, over)

    Ts = T/over;
    N = length(Xn);
    
    Xd = 1/Ts * upsample(Xn, over);
    td = [0:Ts:N*T - Ts];
    
    X = Ts * conv(Xd, phi);
    
    x_t = linspace(phi_t(1) + td(1), phi_t(end) + td(end), length(X));
end