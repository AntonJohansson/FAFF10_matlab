function filter_20x = get_bg_filter(file)
    data = get_normalized_spe_data(file);

    filter_20x = medfilt1(data, 21, 'truncate');

    figure;
    hold on;
    plot(1:length(data), data, '.');
    plot(1:length(filter_20x), filter_20x);
    xlim([0,1000]);
    %ylim([-10,120]);
end