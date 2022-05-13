close all
clear
clc

s_par = csvread("Sparametry_real.csv", 1);
stab = csvread("K_B1_real.csv", 1);
zisk = csvread("Gain_NF_real.csv", 1);
meas = open("svoboda.csv");

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
title("Stabilita zesilovače");
xticks([50, 100, 200, 500, 1000]);

%% S-parametry
s11 = s_par(:, 2);
s12 = s_par(:, 5);
s21 = s_par(:, 3);
s22 = s_par(:, 4);

freq_m = meas.svoboda(:, 1) ./ 1000000;
s11m = meas.svoboda(:, 2);
s12m = meas.svoboda(:, 5);
s21m = meas.svoboda(:, 4);
s22m = meas.svoboda(:, 8);

figure();
hold on
plot(freq(90 : end), s11(90 : end), 'k', 'LineWidth', 1.2);
% plot(freq, s12, '--k', 'LineWidth', 1.2);
plot(freq_m(100 : end), s11m(100 : end), '--k', 'LineWidth', 1.2);
% plot(freq, s22, '.k', 'LineWidth', 1.2);
legend("Simulace", "Měření", 'FontSize', 20, 'Location', 'southwest');
set(gca, 'XScale', 'Log');
ylim([-45 5]);
grid on
grid(gca,'minor');
xlabel("f [MHz]");
set(gca, 'FontSize', 15);
ylabel("S11 [dB]");
set(gca, 'FontSize', 15);
title("S11");
% xticks([50, 100, 200, 500, 1000]);

figure();
hold on
plot(freq(90 : end), s21(90 : end), 'k', 'LineWidth', 1.2);
% plot(freq, s12, '--k', 'LineWidth', 1.2);
plot(freq_m(100 : end), s21m(100 : end), '--k', 'LineWidth', 1.2);
% plot(freq, s22, '.k', 'LineWidth', 1.2);
legend("Simulace", "Měření", 'FontSize', 20, 'Location', 'northeast');
set(gca, 'XScale', 'Log');
% ylim([0 2]);
grid on
grid(gca,'minor');
xlabel("f [MHz]");
set(gca, 'FontSize', 15);
ylabel("S21 [dB]");
set(gca, 'FontSize', 15);
title("S21");
% xticks([50, 100, 200, 500, 1000]);

figure();
hold on
plot(freq(90 : end), s22(90 : end), 'k', 'LineWidth', 1.2);
% plot(freq, s12, '--k', 'LineWidth', 1.2);
plot(freq_m(100 : end), s22m(100 : end), '--k', 'LineWidth', 1.2);
% plot(freq, s22, '.k', 'LineWidth', 1.2);
legend("Simulace", "Měření", 'FontSize', 20, 'Location', 'southeast');
set(gca, 'XScale', 'Log');
% ylim([0 2]);
grid on
grid(gca,'minor');
xlabel("f [MHz]");
set(gca, 'FontSize', 15);
ylabel("S22 [dB]");
set(gca, 'FontSize', 15);
title("S22");
% xticks([50, 100, 200, 500, 1000]);

figure();
hold on
plot(freq(90 : end), s11(90 : end), '--k', 'LineWidth', 1.2);
plot(freq(90 : end), s22(90 : end), 'k', 'LineWidth', 1.2);
plot(freq_m(100 : end), s11m(100 : end), '--r', 'LineWidth', 1.2);
plot(freq_m(100 : end), s22m(100 : end), 'r', 'LineWidth', 1.2);
legend("S11 simulace", "S22 simulace", "S11 změřeno", "S22 změřeno", 'FontSize', 20, 'Location', 'southeast');
set(gca, 'XScale', 'Log');
% ylim([0 2]);
grid on
grid(gca,'minor');
xlabel("f [MHz]");
set(gca, 'FontSize', 15);
ylabel("[dB]");
set(gca, 'FontSize', 15);
title("S11, S22");
% xticks([50, 100, 200, 500, 1000]);

[~, f0] = max(s21m);
disp("Stredni kmitocet [MHz]:");
disp(freq_m(f0));
