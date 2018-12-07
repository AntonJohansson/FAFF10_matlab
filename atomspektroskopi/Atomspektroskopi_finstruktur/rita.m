%% hg

data = importdata('hg_inte_subtraherat_dark.TXT', ';');
data = data.data;

lambda = data(:,1);
spektra = data(:,2) - data(:,3);
n = 1.000293; % brytningsindex luft
lambda = lambda*n;

h = 6.6261e-34;
c = 2.99792458e8;
R = 1.097373160000000e+07;

get_max_gauss(lambda, spektra, 579, 1)
%%
begin_figure(1);
plot(lambda, spektra, 'LineWidth', 2);
xlim([350 600]);
ylim([0 7e4]);
set(gca, 'XTick', 350:25:600);

end_figure(1, 'Emissionsspektrum fr{\aa}n Hg', {'V{\aa}gl\"angd (nm)', 'Detektorpulser'}, '');

%% cd

data = importdata('cd.TXT', ';');
data = data.data;

lambda = data(:,1);
spektra = data(:,2) - data(:,3);
n = 1.000293; % brytningsindex luft
lambda = lambda*n;

h = 6.6261e-34;
c = 2.99792458e8;
R = 1.097373160000000e+07;

l325 = get_max_gauss(lambda, spektra, 325, 1)  ;    - 325.25240*n
l326 = get_max_gauss(lambda, spektra, 326, 1)  ;    - 326.10548*n
l340 = get_max_gauss(lambda, spektra, 340.5, 1) ;   - 340.36521*n
l346 = get_max_gauss(lambda, spektra, 346.5, 0.3); - 346.61996*n
l347 = get_max_gauss(lambda, spektra, 347.1, 0.3);  - 346.76544*n
l361 = get_max_gauss(lambda, spektra, 361.2, 1) ;   - 361.05077*n
l362 = get_max_gauss(lambda, spektra, 361.4, 0.1);  - 361.28729*n
l363 = get_max_gauss(lambda, spektra, 361.6, 0.1);  - 361.44529*n

%%
begin_figure(1);
set(gcf,'Position',[500 500 250 500]);
plot(lambda, spektra, 'LineWidth', 1);
%xlim([min(lambda) max(lambda)]);
%xlim([346.6 347]);
ylim([0 7e4]);
%set(gca, 'XTick', 340:0.2:350);

%end_figure(1, 'Emissionsspektrum fr{\aa}n $^{48}$Cd', {'V{\aa}gl\"angd (nm)', 'Detektorpulser'}, '');
end_figure(1, '', {'V{\aa}gl\"angd (nm)', 'Detektorpulser'}, '');