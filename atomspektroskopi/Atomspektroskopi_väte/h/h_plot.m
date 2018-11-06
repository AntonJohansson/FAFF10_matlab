data = importdata('h_stort_spektra.TXT', ';');
data = data.data;

lambda = data(:,1);
spektra = data(:,5);

% konvertera till vakum lambda
n = 1.000293; % brytningsindex luft
lambda = lambda*n;
lambda_teori = [
    434.0472;
    486.135;
    656.279;
    ];
lambda_teori = lambda_teori*n;

fprintf('Identified peaks after gaussian fit:\n');
[P, I, W] = findpeaks(spektra, 'MinPeakProminence', 600);
lambda_peaks = zeros(length(P),1);
for i=1:length(P)
    [gauss, x] = fit_gauss(lambda, spektra, lambda(I(i)), round(W(i)));
    [M, I2] = max(gauss(x));
    lambda_peaks(i) = x(I2) - err(x(I2));
    fprintf('%f\n', lambda_peaks(i));
end

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
plot(lambda, spektra, 'LineWidth', 2);
xlim([min(lambda) max(750)]);
ylim([0 7e4]);
title('Emissionsspektrum fr{\aa}n v\"ate', 'FontSize', 16);
xlabel('V{\aa}gl\"angd (nm)', 'FontSize', 16);
ylabel('Pulser', 'FontSize', 16);
set(gca, 'XTick', 300:50:750);