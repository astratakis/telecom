clear all;
close all;

% --- < variables > ---
a = [0, 0.5, 1];
A = 5;
k = 0:2*A;
T = 10;
over = 10;
% ---------------------

for i = 1:4
    
    figure(i);
    for j = 1:3
        [phi(:, j), t] = srrc_pulse(T, over, A, a(j));
    end
    
    for j = 1:3
        subplot(3, 1, j)
        plot(t, phi(:, j));
        hold on;
        plot(t+k(i)*T, phi(:, j));
        hold off;
        
        legend('\Phi(t)', '\Phi(t-kT)')
    end
end

[phi_1, t1] = srrc_pulse(T, over, A, a(1));
[phi_2, t2] = srrc_pulse(T, over, A, a(2));
[phi_3, t3] = srrc_pulse(T, over, A, a(3));

integral_dt = 1/length(phi_1);

for i = k(1:4)
    
    delayed_phi_1 = [zeros(1, i*T) phi_1(1:end-i*T)];
    delayed_phi_2 = [zeros(1, i*T) phi_2(1:end-i*T)];
    delayed_phi_3 = [zeros(1, i*T) phi_3(1:end-i*T)];
    
    pr1 = phi_1.*delayed_phi_1;
    pr2 = phi_2.*delayed_phi_2;
    pr3 = phi_3.*delayed_phi_3;
    
    figure(4+i+1);
    subplot(3, 1, 1);
    plot(t1, pr1);
    xlabel('t');
    ylabel('\phi(t)*\phi(t-kT)')
    
    subplot(3, 1, 2);
    plot(t2, pr2);
    xlabel('t');
    ylabel('\phi(t)*\phi(t-kT)')
    
    subplot(3, 1, 3);
    plot(t3, pr3);
    xlabel('t');
    ylabel('\phi(t)*\phi(t-kT)')

    integral_1(i+1) = sum(pr1)*integral_dt;
    integral_2(i+1) = sum(pr2)*integral_dt;
    integral_3(i+1) = sum(pr3)*integral_dt;
end

integral_1*10000
integral_2*10000
integral_3*10000

%print('-f1', 'b1', '-dpng')
%print('-f2', 'b2', '-dpng')
%print('-f3', 'b3', '-dpng')
%print('-f4', 'b4', '-dpng')
%print('-f5', 'b5', '-dpng')
%print('-f6', 'b6', '-dpng')
%print('-f7', 'b7', '-dpng')
%print('-f8', 'b8', '-dpng')