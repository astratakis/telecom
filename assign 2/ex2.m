clear all;
close all;
clc;

%%%%%%%%%%%%%%%%% < B4 > %%%%%%%%%%%%%%%%%

% ---- < variables > ----
K = 500;
N = 100;
T = 0.001;
over = 10;
A = 4;
a = 0.5;
Nf = 16384;
% -----------------------

Ts = T/over;
Fs = 1/Ts;
NFFT = -Fs/2:Fs/Nf:Fs/2 - Fs/Nf;
[phi, t] = srrc_pulse(T, over, A, a);
f0 = ((1/Ts)/2 - 1/T)/2;

total_power = 0;

total_x = 0;

for i = 1:K
   
    bits = (sign(randn(1, N)) + 1)/2;
    Xn = bits_to_2PAM(bits);
    
    [X, t_x] = generate_x_function(Xn, phi, t, T, over);
    
    theta = unifrnd(0, 2*pi);
    
    Y = X.*cos(2*pi*f0*t_x + theta);
    
    FOUR_Y = fftshift(fft(Y, Nf) * Ts);
    T_total = t_x(end) - t_x(1);
    PY = (abs(FOUR_Y).^2)/T_total;
    total_power = total_power + PY;
    
    FOUR_X = fftshift(fft(X, Nf) * Ts);
    
    PX = (abs(FOUR_X).^2)/T_total;
    
    total_x = total_x + PX;
end

average_power = total_power ./ K;
average_x = total_x ./ K;

figure(1);
semilogy(NFFT, average_power);
hold on;
semilogy(NFFT, average_x);
hold off;
xlabel('F (Hz)');
ylabel('Sy(F)');
title('Estimated SPD');

%print('-f1', 'B4', '-dpng')