data = importdata('hg.TXT', ';');
data = data.data;

lambda = data(:,1);
spektra = data(:,5);
n = 1.000293; % brytningsindex luft
lambda = lambda*n;

h = 6.6261e-34;
c = 2.99792458e8;
R = 1.097373160000000e+07;

get_max_gauss(lambda, spektra, 579, 1)

% plot
begin_figure(1);
plot(lambda, spektra, 'LineWidth', 2);
xlim([350 600]);
ylim([0 7e4]);
legend_handle = end_figure(1, 'Emissionsspektrum fr{\aa}n Hg', {'V{\aa}gl\"angd (nm)', 'Detektorpulser'}, '');
set(gca, 'XTick', 350:25:600);

