% Escalón unitario continuo en Octave

a = -5;    % Límite inferior del rango
b = 5;     % Límite superior del rango
t = linspace(a, b, 1000);  % Vector de tiempo

u = double(t > 0);  % Escalón unitario: 1 si t>0, 0 si t<=0

plot(t, u, 'LineWidth', 2);
xlabel('t');
ylabel('u(t)');
title('Escalón unitario continuo');
grid on;
axis([a b -0.2 1.2]);