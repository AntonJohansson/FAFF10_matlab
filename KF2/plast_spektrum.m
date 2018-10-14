cs_plast = get_normalized_spe_data('data/cs137_plastscintillator.Spe');

figure;
hold on;
grid on;
box on;
plot(1:length(cs_plast), cs_plast);
xlim([0 512]);

title('Energispektrum f\"or $^{137}$Cs (plastscintillator)', 'Interpreter', 'latex', 'FontSize', 18);
h = legend('m\"atdata med bakgrund', 'Location', 'NorthEast');
h.FontSize = 18;
set(h, 'Interpreter', 'latex');
xlabel('Kanal', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Pulser/s', 'Interpreter', 'latex', 'FontSize', 18);