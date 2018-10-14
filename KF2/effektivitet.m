data = [
30, 0.95;
520, 0.72;
635, 0.68;
1280, 0.35
];

f = fit(data(:,1), data(:,2), 'poly1');
x = linspace(min(data(:,1)),max(data(:,1)),1500);

figure;
hold on;
grid on;
grid minor;
box on;
plot(data(:,1), data(:,2), '.');
plot(x, f(x));
xlim([0 1500]);
ylim([0 1]);

title('Detektionseffektivitet f\"or NaI-scintillatorn', 'Interpreter', 'latex', 'FontSize', 18);
h = legend('data fr. handledning', 'anpassad linje', 'Location', 'NorthEast');
h.FontSize = 18;
set(h, 'Interpreter', 'latex');
xlabel('Energi (keV)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Andel som detekteras (\%)', 'Interpreter', 'latex', 'FontSize', 18);