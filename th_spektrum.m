th = get_normalized_spe_data('data/Th_spektrum.Spe');
filter_20x = get_bg_filter('data/bakgrund_20x.Spe');

figure;
hold on;
plot(1:length(th), th);
plot(1:length(th), th-filter_20x);
xlim([0 2048]);