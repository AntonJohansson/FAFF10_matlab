th_ge = get_normalized_spe_data('data/Th_Ge.Spe');
th    = get_normalized_spe_data('data/Th_spektrum.Spe');
filter_20x = get_bg_filter('data/bakgrund_20x.Spe');

figure;
hold on;
plot(1:length(th_ge), th_ge, 'r');
%plot(1:length(th), 2*th);
plot(new_x, new_data, 'b--');
xlim([0 2048]);