data = importdata('na_icke_saturated.TXT', ';');
data = data.data;

lambda = data(:,1);
spektra = data(:,5);

n = 1.000293; % brytningsindex luft
h = 6.6261e-34;
c = 2.99792458e8;
R = 1.097373160000000e+07;

% plot
figure(1);
hold on;
box on;
grid on;
plot(lambda, spektra);
xlim([430 630]);
ylim([0 7e4]);
title('Emission spectra for $^{11}$Na', 'Interpreter', 'latex', 'FontSize', 18);
xlabel('Wavelength (nm)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Counts', 'Interpreter', 'latex', 'FontSize', 18);
set(gca, 'XTick', 430:20:630);

