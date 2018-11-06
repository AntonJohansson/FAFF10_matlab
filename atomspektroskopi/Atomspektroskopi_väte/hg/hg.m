data = importdata('hg.TXT', ';');
data = data.data;

lambda = data(:,1);
spektra = data(:,5);

% konvertera till vakum lambda
n = 1.000293; % brytningsindex luft
lambda = lambda*n;

lambda_teori = [
 365.01580;
 404.65650;
 435.83350;
 546.07500;
 576.96100;
 579.06700;
 ];
lambda_teori = lambda_teori*n;

% Identify and fit a gaussian to peaks
fprintf('Identified peaks after gaussian fit:\n');
[P, I, W] = findpeaks(spektra, 'MinPeakProminence', 2000);
lambda_peaks = zeros(length(P), 1);
for i=1:length(P)
    [gauss, x] = fit_gauss(lambda, spektra, lambda(I(i)), round(W(i)));
    [M, I2] = max(gauss(x));
    fprintf('%f\n', x(I2));
    lambda_peaks(i) = x(I2);
end
% 656.5 för högsta
%[gauss,x] = fit_gauss(lambda, spektra, 657, 10);
%[M, I] = max(gauss(x));

% våglängden för den största stapeln
%lambda_max = x(I)

% plot
figure;

% set latex stuff
ax = gca;
ax.TickLabelInterpreter ='latex';
ax.FontName = 'latex';
ax.Title.Interpreter = 'latex';
ax.XLabel.Interpreter = 'latex';
ax.YLabel.Interpreter = 'latex';

% plot stuff
pbaspect([1.618 1 1]);
%pbaspect([1.33 1 1]);
hold on;
box on;
%grid on; 
plot(lambda, spektra, 'LineWidth', 1);
xlim([350 600]);
ylim([0 7e4]);
title('Emissionsspektrum fr{\aa}n kvicksilver', 'FontSize', 16);
xlabel('V{\aa}gl\"angd (nm)', 'FontSize', 16);
ylabel('Pulser', 'FontSize', 16);
set(gca, 'XTick', 300:50:750);
%%
figure;
x = lambda_peaks;
y = lambda_peaks - lambda_teori;
err = fit(x, y, 'poly1');
hold on;
plot(x, y, '.');
x1 = linspace(min(x), max(x));
plot(x1, err(x1));
 