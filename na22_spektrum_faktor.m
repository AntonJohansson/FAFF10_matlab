na22 = get_normalized_spe_data('data/Na22_spektrum_kalibrering.Spe');
filter_20x = get_bg_filter('data/bakgrund_20x.Spe');
[gauss_511, x_511, fwhm1_511, fwhm2_511] = fit_gaussian(na22-filter_20x, 300, 50);
[gauss_127, x_127, fwhm1_127, fwhm2_127] = fit_gaussian(na22-filter_20x, 750, 50);

figure;
hold on;
grid on;
plot(1:length(na22), na22);
plot(1:length(na22), na22-filter_20x);
plot(x_511, gauss_511(x_511));
plot(x_127, gauss_127(x_127));
xlim([0 1000]);

factor = @(a511, a127) (a511/0.72)/(a127/0.374);

full_gauss_area_511 = integrate(gauss_511, x_511(1), x_511(end));
full_gauss_area_127 = integrate(gauss_127, x_127(1), x_127(end));

fwhm_gauss_area_511 = integrate(gauss_511, fwhm1_511, fwhm2_511);
fwhm_gauss_area_127 = integrate(gauss_127, fwhm1_127, fwhm2_127);

factor(full_gauss_area_511, full_gauss_area_127)
factor(fwhm_gauss_area_511, fwhm_gauss_area_127)