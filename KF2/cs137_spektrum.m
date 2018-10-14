cs137 = get_normalized_spe_data('data/Cs137_spektrum_kalibrering.Spe');
filter_20x = get_bg_filter('data/bakgrund_20x.Spe');

calibration = get_calibration_func();
x = calibration(1:length(cs137));

figure;
hold on;
%grid on;
box on;
plot_x_line(calibration(399),  cs137(399):0.01:1.7, 'k');
plot(x, cs137-filter_20x);
xlim([0 max(x)/2]);
ylim([0 2]);

text(0.6601-0.25, 1.75, '0.66 MeV', 'Interpreter', 'latex', 'FontSize', 16);

title('Energispektrum f\"or $^{137}$Cs', 'Interpreter', 'latex', 'FontSize', 18);
h = legend('m\"atdata utan bakgrund', 'Location', 'NorthEast');
h.FontSize = 18;
set(h, 'Interpreter', 'latex');
xlabel('Energi (MeV)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Pulser/s', 'Interpreter', 'latex', 'FontSize', 18);

