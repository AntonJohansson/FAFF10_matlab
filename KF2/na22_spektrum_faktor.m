na22 = get_normalized_spe_data('data/Na22_spektrum_kalibrering.Spe');
filter_20x = get_bg_filter('data/bakgrund_20x.Spe');
[gauss_511, x_511, fwhm1_511, fwhm2_511] = fit_gaussian(na22-filter_20x, 310, 50);
[gauss_127, x_127, fwhm1_127, fwhm2_127] = fit_gaussian(na22-filter_20x, 750, 50);

calibration = get_calibration_func();
x = calibration(1:length(na22));

figure;
hold on;
grid on;
box on;
%plot(x, na22, '.');
plot_x_line(calibration(310),   0:0.1:2.5, 'k--');
plot_x_line(calibration(750),   0:0.1:1.5, 'k--');
plot(x, na22-filter_20x);
%plot(calibration(x_511), gauss_511(x_511), '', 'LineWidth', 2);
%plot(calibration(x_127), gauss_127(x_127), '', 'LineWidth', 2);
xlim([0 max(x)/2]);
ylim([0 2.7]);

text(calibration(310)-0.29, 2.55, '0.509 MeV', 'Interpreter', 'latex', 'FontSize', 16);
text(calibration(750)-0.018, 1.55, '1.28 MeV', 'Interpreter', 'latex', 'FontSize', 16);

title('Energispektrum f\"or $^{22}$Na', 'Interpreter', 'latex', 'FontSize', 18);
h = legend('m\"atdata utan bakgrund', 'Location', 'NorthEast');
h.FontSize = 18;
set(h, 'Interpreter', 'latex');
xlabel('Energi (MeV)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Pulser/s', 'Interpreter', 'latex', 'FontSize', 18);

det_eff = get_det_eff();
%factor = @(a511, a127) (a511/0.72)/(a127/0.374);
factor = @(a511, a127) (a511/det_eff(508.9))/(a127/det_eff(1274.6));

full_gauss_area_511 = integrate(gauss_511, x_511(1), x_511(end));
full_gauss_area_127 = integrate(gauss_127, x_127(1), x_127(end));

fwhm_gauss_area_511 = integrate(gauss_511, fwhm1_511, fwhm2_511);
fwhm_gauss_area_127 = integrate(gauss_127, fwhm1_127, fwhm2_127);

factor(full_gauss_area_511, full_gauss_area_127)
factor(fwhm_gauss_area_511, fwhm_gauss_area_127)