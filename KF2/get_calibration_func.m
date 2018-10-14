function [f, data] = get_calibration_func()

    data = [ 
        750, 1.2746; % Na22
        400, 0.66165; % Cs137
        690, 1.17321; % Co60_1
        781, 1.33247; % Co60_2
    ];

    f = fit(data(:,1), data(:,2), 'poly1');
end