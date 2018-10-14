function [f,x] = get_det_eff()
    data = [
        30, 0.95;
        520, 0.72;
        660, 0.68;
        1280, 0.35   
     ];

    f = fit(data(:,1), data(:,2), 'poly1');
    x = linspace(min(data(:,1)),max(data(:,1)),1500);
end

