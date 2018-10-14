% Rydberg
h = 6.6266e-34;
c = 2.99792458e8;
R = 10973731.6;
e = 1.6022e-19;

rydberg   = @(n)    h*c*R/n^2/e;
rydberg_z = @(n, Z) h*c*R*Z^2/n^2/e;

%% Spektrum v?te
figure(3);
box on;
hold on;

E = -arrayfun(rydberg, [1 2 3 4]);

% s
draw_level(1, E(1), '1s');
draw_level(1, E(2), '2s');
draw_level(1, E(3), '3s');
draw_level(1, E(4), '4s');
% p
draw_level(2, E(2), '2p');
draw_level(2, E(3), '3p');
draw_level(2, E(4), '4p');
% d
draw_level(3, E(3), '3d');
draw_level(3, E(4), '4d');
% f
draw_level(4, E(4), '4f');

title('Experimentella energiniv{\aa}er i v\"ate', 'Interpreter', 'latex');
xlabel('R\"orelsem\"angdsmomentskvanttal', 'Interpreter', 'latex');
ylabel('Energi (eV)', 'Interpreter', 'latex');

xlim([0.5 4.5]);
ylim([-14 0]);

set(gca, 'YTick', round(E,1));
set(gca, 'XTick', 1:4);
set(gca, 'XTickLabels', {'s', 'p', 'd', 'f'}, 'FontSize', 18);
set(gca, 'TickLabelInterpreter', 'latex');

%% Spektrum litium

figure(4);
box on;
hold on;

s = [0 -4.756800 -1.872995 -0.995758];
p = [0 -3.426655 -1.520508 -0.854148];
d = [0 0         -1.511826 -0.850363];
f = [0 0         0         -0.850355];

% s
draw_level(1, s(2), '2s');
draw_level(1, s(3), '3s');
draw_level(1, s(4), '4s');
% p
draw_level(2, p(2), '2p');
draw_level(2, p(3), '3p');
draw_level(2, p(4), '4p');
% d
draw_level(3, d(3), '3d');
draw_level(3, d(4), '4d');
% f
draw_level(4, f(4), '4f');

title('Experimentella energiniv{\aa}er i litium', 'Interpreter', 'latex');
xlabel('R\"orelsem\"angdsmomentskvanttal', 'Interpreter', 'latex');
ylabel('Energi (eV)', 'Interpreter', 'latex');

xlim([0.5 4.5]);
ylim([-5.5 -0.5]);

%set(gca, 'YTick', round(E,1));
set(gca, 'XTick', 1:4);
set(gca, 'XTickLabels', {'s', 'p', 'd', 'f'}, 'FontSize', 18);
set(gca, 'TickLabelInterpreter', 'latex');


