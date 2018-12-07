close all;

distance = 0.1;
interval = [0 1.5];
offset = 0;
measurements = 8;

begin_figure(1);
[x, y, len] = add_curve(interval, [0 1], 0, 'b');
%dtoi = @(d) ceil(d*(len/(interval(end) - interval(1))));
%[x, y, len] = add_curve(interval, [0 1], dtoi(distance), 'b');
%text(1.15,0.9,sprintf('$\\tau = %.2f$', distance),'Interpreter','latex','FontSize',14);

%for i=1:min((measurements-1), (interval(end)-interval(1))/distance)
%    [x, y, ~] = add_curve(interval, [x(dtoi(i*distance)) y(dtoi(distance))], dtoi(distance), 'b');
%end

%if dtoi(measurements*distance) <= length(x)
%    [x, y, ~] = add_curve(interval, [x(dtoi(measurements*distance)) y(dtoi(distance))], 0, 'b');
%end
end_figure(1, '', {'Tid (godtycklig enhet)', 'Sannolikhet (\%)'}, '');

%export_fig(sprintf('under%i.eps', measurements), '-transparent');
export_fig neutral.eps -transparent;
close all;