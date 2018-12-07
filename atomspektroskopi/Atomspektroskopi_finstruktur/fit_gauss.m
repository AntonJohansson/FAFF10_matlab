function [gauss, x] = fit_gauss(x_data, y_data, mu, interval)
    i = x_data>=(mu-interval) & x_data<=(mu+interval);
    gauss = fit(x_data(i), y_data(i), 'gauss1');
    x = linspace(min(x_data(i)),max(x_data(i)),10000);
    
    %figure;
    %hold on;
    %plot(x_data(i), y_data(i));
    %plot(x, gauss(x));
end

