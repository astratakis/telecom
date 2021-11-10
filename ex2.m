clear all;
close all;

% =========================== A1 ===========================

% ------ < variables > ------
T = 0.01;
over = 10;
Ts = T/over;
A = 4;
a = [0, 0.5, 1];
% ---------------------------

figure(1);

for index = 1:length(a)
    [phi(:, index), time(:, index)] = srrc_pulse(T, over, A, a(index));
    plot(time(:, index), phi(:, index));
    hold on;
end

legend('a = 0', 'a = 0.5', 'a = 1');
xlabel('t (sec)');
ylabel('\phi(t)', 'FontSize', 17);
title('SRRC pulses');
hold off;

%print('-f1', 'srrc_pulses', '-dpng');

% ==========================================================

% =========================== A2 ===========================

% ------ < variables > ------
Fs = 1/Ts;  % Ts = T/over = 0.01/10 = 0.001
Nf = 1024;  % Chosen Nf
% ---------------------------

freq_axis = -Fs/2:Fs/Nf:Fs/2 - Fs/Nf;

for index = 1:length(a)
    PHI(:, index) = fftshift(fft(phi(:, index), Nf) * Ts);
end

figure(2);
for index = 1:length(a)
    plot(freq_axis, abs(PHI(:, index)).^2);
    hold on;
end

legend('a = 0', 'a = 0.5', 'a = 1');
title('Energy spectrum of \phi(t) SRRC pulses');
ylabel('|\Phi(F)|^2');
xlabel('F(Hz)');
hold off;

%print('-f2', 'energy_spectrum_srrc_lin', '-dpng');

figure(3);

for index = 1:length(a)
    semilogy(freq_axis, abs(PHI(:, index)).^2);
    hold on;
end

legend('a = 0', 'a = 0.5', 'a = 1');
title('Energy spectrum of \phi(t) SRRC pulses');
ylabel('|\Phi(F)|^2');
xlabel('F(Hz)');
hold off;

%print('-f3', 'energy_spectrum_srrc_log', '-dpng');

stop;

c = ones(1, length(F))*(T/1000);
semilogy(F, c);
hold off;


% ==========================================================

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

