th_ge = get_normalized_spe_data('data/Th_Ge.Spe');

calibration_factor = 2.615/1883;
x = calibration_factor*(1:length(th_ge));

figure;
hold on;
grid on;
box on;
plot(x, th_ge, 'b');
%plot(1:length(th), 2*th);?
xlim([0 max(x)]);

title('Energispektrum f\"or $^{232}$Th (Ge(Li)-detektor)', 'Interpreter', 'latex', 'FontSize', 18);
h = legend('m\"atdata med bakgrund', 'Location', 'NorthEast');
h.FontSize = 18;
set(h, 'Interpreter', 'latex');
set(gca, 'XTick', [0:0.25:max(x)]);
xlabel('Energi (MeV)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Pulser/s', 'Interpreter', 'latex', 'FontSize', 18);