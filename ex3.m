clear all;
close all;

a = [0, 0.5, 1];
A = 5;
k = 0:2*A;
T = 40;
t = -100:0.1:100-0.1;
over = 10;

for i = k(1:4)
    
    figure(i+1);
    for j = 1:3
        
        [phi(:,j, i+1), time(:, i+1)] = srrc_pulse(T, over, A, a(j));
        time(:, i+1) = time(:, i+1) - i*T;
        plot(time(:, i+1), phi(:,j, i+1));
        title(['Phi(t-', num2str(i), 'T)']);
        hold on;
        
    end
    hold off;
end

for i = k(1:4)
    
    figure(4+i+1);
    
    for j = 1:3
        
        mult = phi(:, j, 1).*phi(:, j, i+1);
        plot(time(:, i+1), mult);
        hold on;
    end
    
    hold off;
end