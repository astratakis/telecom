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
% This should generate a stream random 0 and 1 numbers
bits = (sign(randn(1, N)) + 1) / 2;

% Transform the stream of 0 and 1 bits into -1 and 1 characters
Xn = bits_to_2PAM(bits);

[X, t_x] = generate_x_function(Xn, phi, t, T, over);

figure(3);
plot(t_x, X);
ylabel('X(t)');
xlabel('t (sec)');
title('X(t) Function');

% Calculate the theoretical spectral power density...
theoretical_average = (var(Xn)/T).*(abs(PHI).^2);

%%%%%%%%%%%%%%%%% < A3 > %%%%%%%%%%%%%%%%%

% Calculate Fourier transform of X
FOUR_X = fftshift(fft(X, Nf) * Ts);

% Total time
T_total = t_x(end) - t_x(1);

% Calculate Px
PX = (abs(FOUR_X).^2)/T_total;

% Note that NFFT has been calculated earlier.

figure(4);
subplot(2, 1, 1);
plot(NFFT, PX);
xlabel('F (Hz)');
ylabel('Px(F)');
title('Px(F) Linear');
grid on;

subplot(2, 1, 2);
semilogy(NFFT, PX);
xlabel('F (Hz)');
ylabel('Px(F)');
title('Px(F) Log');
grid on;

% ---- < variables > ----
K = 10;                   % The number of random bits
% -----------------------

% Repeat A2 K times...

total_power = 0;

for i = 1:K
    
    bits = (sign(randn(1, N)) + 1)/2;
    Xn = bits_to_2PAM(bits);
    
    [X, t_x] = generate_x_function(Xn, phi, t, T, over);
    
    FOUR_X = fftshift(fft(X, Nf) * Ts);
    % F axis of fourier transform has already been calculated. (see NFFT)
    
    T_total = t_x(end) - t_x(1);
    
    PX = (abs(FOUR_X).^2)/T_total;
    
    total_power = total_power + PX;
end

% Just calculate the average...
average_power = total_power / K;

% Plot the results.
figure(5);
semilogy(NFFT, average_power);
hold on;
semilogy(NFFT, theoretical_average);
legend('Estimated', 'Theoretical');
xlabel('F (Hz)');
ylabel('Sx(F)');
title('Spectral Power Density');
