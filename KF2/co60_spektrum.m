co60 = get_normalized_spe_data('data/Co60_spektrum_kalibrering.Spe');
filter_20x = get_bg_filter('data/bakgrund_20x.Spe');

calibration = get_calibration_func();
x = calibration(1:length(co60));

figure;
hold on;
grid on;
box on;
plot_x_line(1.33247,   0:0.1:1.4, 'k--');
plot_x_line(1.17321,   0:0.1:1.4, 'k--');
plot(x, co60-filter_20x);
xlim([0 0.9*max(x)/2]);
ylim([0 1.6]);

text(1.17321-0.225, 1.45, '1.17 MeV', 'Interpreter', 'latex', 'FontSize', 16);
text(1.33247-0.02, 1.45, '1.33 MeV', 'Interpreter', 'latex', 'FontSize', 16);

title('Energispektrum f\"or $^{60}$Co', 'Interpreter', 'latex', 'FontSize', 18);
h = legend('m\"atdata utan bakgrund', 'Location', 'NorthWest');
h.FontSize = 18;
set(h, 'Interpreter', 'latex');
xlabel('Energi (MeV)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Pulser/s', 'Interpreter', 'latex', 'FontSize', 18);