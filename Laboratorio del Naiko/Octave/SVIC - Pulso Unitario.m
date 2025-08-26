% Pulso unitario ⊓(t) en Octave

t = -2:0.01:2; % Vector de tiempo
p = double(abs(t) < 0.5); % Pulso unitario: 1 si |t|<0.5, 0 cc

figure;
plot(t, p, 'LineWidth', 2);
xlabel('t');
ylabel('\chi(t)');
title('Pulso unitario \chi(t)');
grid on;
axis([-2 2 -0.2 1.2]);