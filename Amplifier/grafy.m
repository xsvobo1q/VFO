close all
clear
clc

s_par = csvread("Sparametry_real.csv", 1);
stab = csvread("K_B1_real.csv", 1);
zisk = csvread("Gain_NF_real.csv", 1);

%% Stabilita
B1 = stab(:, 2);
K = stab(:, 3);
freq = stab(:, 1)*1000;

figure();
hold on
plot(freq, K, 'k', 'LineWidth', 1.2);
plot(freq, B1, '--k', 'LineWidth', 1.2);
legend("K [-]", "B1 [-]", 'FontSize', 20, 'Location', 'southwest');
set(gca, 'XScale', 'Log');
ylim([0 2]);
grid on
grid(gca,'minor');
xlabel("f [MHz]");
set(gca, 'FontSize', 15);
% ylabel("S{}_{21} [dB]");
set(gca, 'FontSize', 15);
title("Stabilita zesilovace");
xticks([50, 100, 200, 500, 1000]);

%% S-parametry
s11 = s_par(:, 2);
s12 = s_par(:, 3);
s21 = s_par(:, 4);
s22 = s_par(:, 5);

figure();
hold on
plot(freq, s11, 'k', 'LineWidth', 1.2);
% plot(freq, s21, '--k', 'LineWidth', 1.2);
plot(freq, s12, '--k', 'LineWidth', 1.2);
plot(freq, s22, '.k', 'LineWidth', 1.2);
legend("K [-]", "B1 [-]", 'FontSize', 20, 'Location', 'southwest');
set(gca, 'XScale', 'Log');
% ylim([0 2]);
grid on
grid(gca,'minor');
xlabel("f [MHz]");
set(gca, 'FontSize', 15);
ylabel("S-par [dB]");
set(gca, 'FontSize', 15);
title("S-parametry");
xticks([50, 100, 200, 500, 1000]);

