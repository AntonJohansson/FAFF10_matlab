close all;

distance = 0.01;
interval = [0 1.5];
offset = 0;
measurements = 100;



times = 0.5:-0.005:0.01;
for j=1:length(times)
    distance = times(j); 

[x, y, len] = add_curve(interval, [0 1], 0, 'k--');
dtoi = @(d) ceil(d*(len/(interval(end) - interval(1))));
[x, y, len] = add_curve(interval, [0 1], dtoi(distance), 'b');

for i=1:min((measurements-1), (interval(end)-interval(1))/distance)
    [x, y, ~] = add_curve(interval, [x(dtoi(i*distance)) y(dtoi(distance))], dtoi(distance), 'b');
end

if dtoi(measurements*distance) <= length(x)
    [x, y, ~] = add_curve(interval, [x(dtoi(measurements*distance)) y(dtoi(distance))], 0, 'b');
end
text(1.15,0.9,sprintf('$\\tau = %.2f$', distance),'Interpreter','latex','FontSize',14);

F(j) = getframe;
clf;
end


D = length(times);
F = F(1:D);
F = [F(1:D) F(end) F(end) F(end) F(D:-1:1)];
F = repmat(F, 1, 5);

v = VideoWriter('peaks.avi');
v.FrameRate = 15;
open(v);
for f=F
    writeVideo(v,f);
end
close(v);


%[f, g] = add_curve([0 1.5], [0 1], 0.1);
%add_curve([0 1.5], [0.1, f(0.1)], 0);