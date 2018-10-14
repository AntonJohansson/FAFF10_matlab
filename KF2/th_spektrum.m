th = get_normalized_spe_data('data/Th_spektrum.Spe');
filter_20x = get_bg_filter('data/bakgrund_20x.Spe');

calibration = get_calibration_func();
%x = 1:length(th);
x = calibration(1:length(th));
data = th - filter_20x;

figure;
hold on;
box on;
%grid on;
%plot_x_line(0.07, 0:0.1:3, 'k--');
%plot_x_line(0.22, 0:0.1:3, 'k--');
%plot_x_line(0.32, 0:0.1:3, 'k--');
%plot_x_line(0.51, 0:0.1:3, 'k--');
%plot_x_line(0.57, 0:0.1:3, 'k--');
plot_x_line(calibration(61),   data(61):0.1:6.3, 'k');
plot_x_line(calibration(149),  data(149):0.1:5.9, 'k');

plot_x_line(calibration(207),  data(207):0.1:3.9, 'k');
plot_x_line(calibration(306),  data(306):0.1:3.5, 'k');
plot_x_line(calibration(348),  data(348):0.1:3.1, 'k');

plot_x_line(calibration(433),  data(433):0.1:2.7, 'k');
plot_x_line(calibration(536),  data(536):0.1:2.3, 'k');
plot_x_line(calibration(569),  data(569):0.1:1.9, 'k');

plot_x_line(calibration(924),  data(924):0.1:1.9, 'k');
plot_x_line(calibration(1230), data(1230):0.1:1.4, 'k');
plot_x_line(calibration(1511), data(1511):0.1:1, 'k');

text(calibration(61)-0.02,   6.4, sprintf('%.2f MeV', calibration(61)), 'Interpreter', 'latex', 'FontSize', 14);
text(calibration(149)-0.02,  6.0, sprintf('%.2f MeV', calibration(149)), 'Interpreter', 'latex', 'FontSize', 14);

text(calibration(207)-0.02,  4.0, sprintf('%.2f MeV', calibration(207)), 'Interpreter', 'latex', 'FontSize', 14);
text(calibration(306)-0.02,  3.6, sprintf('%.2f MeV', calibration(306)), 'Interpreter', 'latex', 'FontSize', 14);
text(calibration(348)-0.02,  3.2, sprintf('%.2f MeV', calibration(348)), 'Interpreter', 'latex', 'FontSize', 14);

text(calibration(433)-0.02,  2.8, sprintf('%.2f MeV', calibration(433)), 'Interpreter', 'latex', 'FontSize', 14);
text(calibration(536)-0.02,  2.4, sprintf('%.2f MeV', calibration(536)), 'Interpreter', 'latex', 'FontSize', 14);
text(calibration(569)-0.02,  2.0, sprintf('%.2f MeV', calibration(569)), 'Interpreter', 'latex', 'FontSize', 14);

text(calibration(924)-0.02,  2.0, sprintf('%.2f MeV', calibration(924)), 'Interpreter', 'latex', 'FontSize', 14);
text(calibration(1230)-0.02, 1.5, sprintf('%.2f MeV', calibration(1230)), 'Interpreter', 'latex', 'FontSize', 14);
text(calibration(1511)-0.02, 1.1, sprintf('%.2f MeV', calibration(1511)), 'Interpreter', 'latex', 'FontSize', 14);
plot(x, data);
xlim([0 max(x)]);
ylim([0 7]);

title('Energispektrum f\"or $^{232}$Th', 'Interpreter', 'latex', 'FontSize', 18);
h = legend('m\"atdata utan bakgrund', 'Location', 'NorthEast');
h.FontSize = 18;
set(h, 'Interpreter', 'latex');
xlabel('Energi (MeV)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Pulser/s', 'Interpreter', 'latex', 'FontSize', 18);