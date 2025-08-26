% Triángulo unitario x(t) en Octave

t = -2:0.01:2; % Rango de tiempo
x = zeros(size(t)); % Inicializa el vector de salida

% Condiciones por tramos
x((t > -1) & (t < 0)) = t((t > -1) & (t < 0)) + 1;
x((t >= 0) & (t < 1)) = 1 - t((t >= 0) & (t < 1));

% Graficar
plot(t, x, 'b', 'LineWidth', 2);
xlabel('t');
ylabel('x(t)');
title('Triángulo unitario');
grid on;
axis([-2 2 -0.2 1.2]);