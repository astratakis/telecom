clear all;
close all;
clc;

%%%%%%%%%%%%%%%%% < A1 > %%%%%%%%%%%%%%%%%

% ---- < variables > ----
T = 0.001;                  % Signal period
over = 10;                  % over value
Ts = T/over;                % Sampling period
A = 4;                      % Tipespace
a = 0.5;
Nf = 16384;                 % Who needs RAM anyway?
% -----------------------

% Generate SRRC Pulse
[phi, t] = srrc_pulse(T, over, A, a);

% Plot the SRRC Pulse
figure(1);
plot(t, phi);
xlabel('t (sec)');
ylabel('\phi(t)');
title('SRRC Pulse');

% Calculate the FFT Frequency axis
Fs = 1/Ts;
NFFT = -Fs/2 : Fs/Nf : Fs/2 - Fs/Nf;

% Perform Fourier Transform in phi(t)
PHI = fftshift(fft(phi, Nf) * Ts);

% Calculate and plot the spectral energy density
figure(2);
semilogy(NFFT, abs(PHI).^2);
xlabel('F (Hz)');
ylabel('|\Phi(F)|^2');
title('Spectral Energy Density');
grid on;

%%%%%%%%%%%%%%%%% < A2 > %%%%%%%%%%%%%%%%%

% ---- < variables > ----
N = 100;                    % The number of random bits
% -----------------------

% Generates N random numbers. Then divide these numbers
% by 2 and take the sign value of this.
% This should generate a stream of random -1 and 1 chars.
bits = (sign(randn(1, N)) + 1) / 2;

