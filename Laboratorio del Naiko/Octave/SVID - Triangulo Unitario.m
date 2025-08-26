% Triángulo unitario x[n] en Octave (variable independiente discreta)

n = -1:1:1; % Rango discreto de n
x = zeros(size(n)); % Inicializa el vector de salida

% Condiciones por tramos
x((n > -1) & (n < 0)) = n((n > -1) & (n < 0)) + 1;
x((n >= 0) & (n < 1)) = 1 - n((n >= 0) & (n < 1));

% Graficar
stem(n, x, 'b', 'filled', 'LineWidth', 2);
xlabel('n');
ylabel('x[n]');
title('Triángulo unitario discreto');
grid on;
axis([-2 2 -0.2 1.2]);