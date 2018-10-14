hold on;
box on;
grid on;
line([0 30],[0 0],'linestyle','--')
plot(r1, wave_function1, 'b-');
set(gcf, 'Position', [600, 100, 640, 320])
xlim([0 30]);
ylim([-1 1]);

title('Radiell v{\aa}gfunktion f\"or $E = 1$', 'Interpreter', 'latex', 'FontSize', 18);
xlabel('Avst{\aa}nd till k\"arnan (\AA)', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('Enhetsl\"os', 'Interpreter', 'latex', 'FontSize', 18);
set(gca, 'TickLabelInterpreter', 'latex');