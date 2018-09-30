cs137 = get_normalized_spe_data('data/Inre_Konv_Cs137.Spe');
filter_80x = get_bg_filter('data/bakgrund_80x.Spe');
[gauss_gamma, x_gamma, fwhm1_gamma, fwhm2_gamma] = fit_gaussian(cs137-filter_80x, 1615, 150);
[gauss_xray, x_xray, fwhm1_xray, fwhm2_xray] = fit_gaussian(cs137-filter_80x, 90, 20);

figure;
hold on;
grid on;
plot(1:length(cs137), cs137);
plot(1:length(cs137), cs137-filter_80x);
plot(x_gamma, gauss_gamma(x_gamma));
plot(x_xray, gauss_xray(x_xray));
xlim([0 2048]);

full_area_gamma = integrate(gauss_gamma, x_gamma(1), x_gamma(end));
fwhm_area_gamma = integrate(gauss_gamma, fwhm1_gamma, fwhm2_gamma);
full_area_xray = integrate(gauss_xray, x_xray(1), x_xray(end));
fwhm_area_xray = integrate(gauss_xray, fwhm1_xray, fwhm2_xray);

alpha = @(a1, a2) (a1/(0.9*0.95))/(a2/0.64);

full_area_alpha = alpha(full_area_xray, full_area_gamma)
fwhm_area_alpha = (fwhm_area_xray, fwhm_area_gamma)