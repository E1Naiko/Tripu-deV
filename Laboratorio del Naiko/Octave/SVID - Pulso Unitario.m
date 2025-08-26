% Pulso unitario ⊓[n] en Octave (variable discreta)

n = -20:20; % Vector de índices discretos
p = double(abs(n) < 5); % Pulso unitario: 1 si |n|<5, 0 cc

figure;
stem(n, p, 'filled', 'LineWidth', 2);
xlabel('n');
ylabel('\chi[n]');
title('Pulso unitario \chi[n]');
grid on;
axis([-20 20 -0.2 1.2]);