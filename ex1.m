clear all;
close all;

% ----------------- TH -----------------

T = 20;

dt = 0.01;

t = -100:dt:100-dt;

phi = theta1(T, t);

figure(1);
subplot(3, 1, 1);
plot(t, phi);

phi_2 = theta1(T, t-10);

subplot(3, 1, 2)
plot(t, phi_2);

phi_3 = (1/sqrt(T)) * (0 <= t & t < T/2) + -1*(1/sqrt(T)) * (T/2 <= t & t <= T);

subplot(3, 1, 3);
plot(t, phi_3);

% --------------------------------------