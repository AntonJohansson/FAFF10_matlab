function filter = get_bg_filter(file)
    data = get_normalized_spe_data(file);

    filter = medfilt1(data, 28, 'truncate');

    figure;
    hold on;
    grid on;
    box on;
    plot(1:length(data), data, '.');
    plot(1:length(filter), filter);
    xlim([0,1024]);
    
    %title('Bakgrundsstr{\aa}lning och medianfilter f\"or 80x', 'Interpreter', 'latex', 'FontSize', 18);
    %h = legend('m\"atdata', 'medianfilter', 'Location', 'NorthEast');
    %h.FontSize = 18;
    %set(h, 'Interpreter', 'latex');
    %xlabel('Kanal', 'Interpreter', 'latex', 'FontSize', 18);
    %ylabel('Pulser/s', 'Interpreter', 'latex', 'FontSize', 18);
end