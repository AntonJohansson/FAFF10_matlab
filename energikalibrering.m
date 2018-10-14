%na22  = importdata('data/Na22_spektrum_kalibrering.Spe', ' ', 12);
%cs137 = importdata('data/Cs137_spektrum_kalibrering.Spe', ' ', 12);
%co60  = importdata('data/Co60_spektrum_kalibrering.Spe', ' ', 12);
%na22  = na22.data;
%cs137 = cs137.data;
%co60  = co60.data;

[f, data] = get_calibration_func();

figure;
hold on;
grid on;
box on;

plot(1:800, f(1:800), 'r');
plot(data(:,1), data(:,2), 'b.', 'MarkerSize', 16);


set(gca, 'YTick', 0:0.25:1.5);
xlim([0, 800]);
ylim([0, 1.5]);

title('Kalibreringskurva f\"or m{\aa}ngkanalsanalysatorn', 'Interpreter', 'latex', 'FontSize', 18);
h = legend(sprintf('$E(k) = %f\\cdot k %f$', f.p1, f.p2), 'Fullabs.topp f\"or $^{22}$Na, $^{137}$Cs, $^{60}$Co', 'Location', 'NorthWest');
h.FontSize = 18;
set(h, 'Interpreter', 'latex');
xlabel('Kanal', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Energi (MeV)', 'Interpreter', 'latex', 'FontSize', 18);


%plot(750*ones(size(1:1000)), 1:1000, 'k--');
%plot(400*ones(size(1:1000)), 1:1000, 'k--');
%plot(690*ones(size(1:1000)), 1:1000, 'k--');hel
%plot(781*ones(size(1:1000)), 1:1000, 'k--');