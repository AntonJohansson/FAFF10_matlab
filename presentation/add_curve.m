function [x_data, y_data, len] = add_curve(interval, point, cutoff, format)
    quad_width = 0.16;
    
    f = @(x) -10*x.^2 + point(2);
    quad_end_y = f(quad_width);
    if quad_end_y < 0
        quad_end_y = 0;
    end
    
    g = @(x) quad_end_y*exp(-2*(x-quad_width));

    x = linspace(interval(1), interval(end), 1000);
    [x_int, ~] = intersections(x,f(x),x,g(x),0.5);
    
    [~, I] = min(abs(x-quad_width));
    x1 = x(1:I);
    x2 = x(I:end);
    %x1 = linspace(interval(1), x_int(end), 10000);
    %x2 = linspace(x_int(end),interval(end), 10000);
    x_data = [x1 x2];
    y_data = [f(x1) g(x2)];
    len = length(x_data);
    
    %cutoff_index = 0;
    %if cutoff ~= 0
    %    [min_distance, cutoff_index] = min(abs(x_data-cutoff));
    %end

    %y_data = smooth(y_data, 0.01, 'lowess');
    windowSize = 1;
    y_data = conv(y_data, ones(1, windowSize)/windowSize, 'same');

    hold on; 
    box on;
    
    dx = point(1);
    dy = point(2);
    if cutoff ~= 0
        plot(x_data(1:cutoff) + dx, (y_data(1:cutoff)), format);
    else
        plot(x_data+dx, y_data, format);
    end
    xlim(interval);
    ylim([0 1.1]);
end