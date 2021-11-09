clear all;
close all;

% A1

T = 0.01;
over = 10;
Ts = T/over;
A = 4;

[phi_1, t1] = srrc_pulse(T, over, A, 0);

figure(1);
subplot(3, 1, 1);

plot(t1, phi_1);

[phi_2, t2] = srrc_pulse(T, over, A, 0.5);

subplot(3, 1, 2);

plot(t2, phi_2);

[phi_3, t3] = srrc_pulse(T, over, A, 1);

subplot(3, 1, 3);

plot(t3, phi_3);


%A2

Fs = 1000;
DT = 1/Fs;
Nf = 2048;

F = [-Fs/2:Fs/Nf:Fs/2 - Fs/Nf];

PHI_1 = fftshift(fft(phi_1, Nf) * DT);
PHI_2 = fftshift(fft(phi_2, Nf) * DT);
PHI_3 = fftshift(fft(phi_3, Nf) * DT);

figure(2);

subplot(3, 1, 1);
plot(F, abs(PHI_1).^2);

subplot(3, 1, 2);
plot(F, abs(PHI_2).^2);

subplot(3, 1, 3);
plot(F, abs(PHI_3).^2);

figure(3);

semilogy(F, abs(PHI_1).^2);
hold on;
semilogy(F, abs(PHI_2).^2);
hold on;
semilogy(F, abs(PHI_3).^2);
hold on;
c = ones(1, length(F))*(T/1000);
semilogy(F, c);
hold off;
% A3

BW = [(1 + 0)/(2*T), (1 + 0.5)/(2*T), (1 + 1)/(2*T)]

%98.63
%75.2
%57.13

% 0 deyteros

clear c;
c = ones(1, length(F)) * (T/100000);

figure(4);
semilogy(F, abs(PHI_1).^2);
hold on;
semilogy(F, abs(PHI_2).^2);
hold on;
semilogy(F, abs(PHI_3).^2);
hold on;
semilogy(F, c);
hold off;

%102.5
%78
%69.82

% O prwtos

