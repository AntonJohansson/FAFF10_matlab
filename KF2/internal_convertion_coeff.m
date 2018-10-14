cs137 = get_normalized_spe_data('data/Inre_Konv_Cs137.Spe');
filter_80x = get_bg_filter('data/bakgrund_80x.Spe');
[gauss_gamma, x_gamma, fwhm1_gamma, fwhm2_gamma] = fit_gaussian(cs137-filter_80x, 1615, 200);
[gauss_xray, x_xray, fwhm1_xray, fwhm2_xray] = fit_gaussian(cs137-filter_80x, 90, 20);

calibration_factor = 0.66165/1615;
x = calibration_factor*(1:length(cs137));

figure;
hold on;
box on;
grid on;
plot_x_line(calibration_factor*1615, 0:0.1:0.5, 'k--');
plot_x_line(calibration_factor*90,   0:0.1:0.5, 'k--');
plot(x, cs137-filter_80x, 'b');
%plot(calibration(x_gamma), gauss_gamma(x_gamma));
%plot(calibration(x_xray), gauss_xray(x_xray));

text(calibration_factor*(1615)-0.12, 0.55, '$661.65$ keV', 'Interpreter', 'latex', 'FontSize', 16);
text(calibration_factor*(90), 0.55, '$36.86$ keV', 'Interpreter', 'latex', 'FontSize', 16);

xlim([0 max(x)*0.85]);
ylim([0 1]);

title('Energispektrum f\"or $^{137}$Cs under 80x f\"orst\"arkning', 'Interpreter', 'latex', 'FontSize', 18);
h = legend('m\"atdata utan bakgrund', 'Location', 'NorthEast');
h.FontSize = 18;
set(h, 'Interpreter', 'latex');
xlabel('Energi (MeV)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Pulser/s', 'Interpreter', 'latex', 'FontSize', 18);

full_area_gamma = integrate(gauss_gamma, x_gamma(1), x_gamma(end));
fwhm_area_gamma = integrate(gauss_gamma, fwhm1_gamma, fwhm2_gamma);
full_area_xray = integrate(gauss_xray, x_xray(1), x_xray(end));
fwhm_area_xray = integrate(gauss_xray, fwhm1_xray, fwhm2_xray);

det_eff = get_det_eff();
alpha_coeff = @(a1, a2) (a1/(0.9*det_eff(calibration_factor*90*1e3)))/(a2/det_eff(calibration_factor*1615*1e3));

full_area_alpha = alpha_coeff(full_area_xray, full_area_gamma)
fwhm_area_alpha = alpha_coeff(fwhm_area_xray, fwhm_area_gamma)