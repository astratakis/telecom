clear all;
close all;

T = 0.1;
over = 10;
a = 0.5;
A = 5;
N = 100;

b = (sign(randn(N, 1)) + 1)/2;

array_of_symbols = bits_to_2PAM(b);

Ts = T/over;

x_delta = 1/Ts * upsample(array_of_symbols, over);

time_axis = linspace(0, N*T, N*over);

figure(1);
plot(time_axis, x_delta);

[phi, time] = srrc_pulse(T, over, A, a);

conv_result = Ts*conv(x_delta, phi);

conv_time = linspace(time(1) + time_axis(1), time(end) + time_axis(end), length(conv_result));

figure(2);
plot(conv_time, conv_result);

flipped_phi = flip(phi);
zeta = Ts*conv(conv_result, flipped_phi);

time_axis_zeta = linspace(conv_result(1) + flipped_phi(1), conv_result(end) + flipped_phi(end), length(zeta));

figure(3);
plot(time_axis_zeta, zeta);

hold on;
stem([0:N-1]*T, array_of_symbols);

hold off;
