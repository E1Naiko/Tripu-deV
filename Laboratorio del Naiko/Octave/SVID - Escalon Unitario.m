% Escalón unitario discreto en Octave

a = -5;    % Límite inferior del rango
b = 5;     % Límite superior del rango
n = a:b;   % Vector de índices discretos

u = double(n > 0);  % Escalón unitario: 1 si n>0, 0 si n<=0

stem(n, u, 'filled', 'LineWidth', 2);
xlabel('n');
ylabel('u[n]');
title('Escalón unitario discreto');
grid on;
axis([a b -0.2 1.2]);