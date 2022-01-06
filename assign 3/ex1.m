clear all;
close all;
clc;

% ---- < variables > ---- %
N = 200;
A = 1;
T = 0.01;
over = 10;
Ts = T/over;
a = 0.5;
% ----------------------- %

bits = (sign(randn(1, 4*N)) + 1)/2;

XI = bits_to_4PAM(bits(1:2*N), A);
XQ = bits_to_4PAM(bits(2*N+1:end), A);

X_len = 1:length(XI);

figure(1);
subplot(2, 1, 1);
stem(X_len, XI);
subplot(2, 1, 2);
stem(X_len, XQ);

[phi_I, t_I] = srrc_pulse(T, over, A, a);
[phi_Q, t_Q] = srrc_pulse(T, over, A, a);