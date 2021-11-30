clear all;
close all;

% --- < variables > ---
T = 0.1;
over = 10;
a = 0.5;
A = 5;
N = 100;
% ---------------------

% question a

b = (sign(randn(N, 1)) + 1)/2;

array_of_symbols = bits_to_2PAM(b);

% question b

Ts = T/over;

x_delta = 1/Ts * upsample(array_of_symbols, over);
time_axis = linspace(0, N*T, N*over);

figure(1);
plot(time_axis, x_delta);
xlabel('time')
ylabel('xdelta(t)')
title('Function xdelta(t)')

print('-f1', 'c_a', '-dpng')

% question c

[phi, t_phi] = srrc_pulse(T, over, A, a);

X = Ts*conv(phi, x_delta);

X_time = linspace(t_phi(1) + time_axis(1), t_phi(end) + time_axis(end), length(X));

figure(2);
plot(X_time, X);
xlabel('time');
ylabel('\Phi(t) * X_\delta');
title('Convolution of \Phi(t) and x_\delta(t)')

print('-f2', 'c_b', '-dpng')

% question d

inv_phi = flip(phi);
zeta = Ts*conv(X, inv_phi);
time_axis_zeta = linspace(X_time(1) + t_phi(1), X_time(end) + t_phi(end), length(zeta));

figure(3);
plot(time_axis_zeta, zeta);

hold on;
stem([0:N-1]*T, array_of_symbols);

hold off;

ylabel('Z(t)')
xlabel('t')
title('Convolution of X(t) and \Phi(-t)')

print('-f3', 'c_c', '-dpng')
