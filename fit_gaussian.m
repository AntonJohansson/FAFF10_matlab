function [gauss, x, fwhm1, fwhm2] = fit_gaussian(data, mu, interval)
    x = (mu-interval):(mu+interval);
    gauss = fit(x', data(x), 'gauss1');
    
    y = gauss(x);
    half_max = (min(y)+max(y))/2;
    fwhm1 = x(find(y>=half_max, 1, 'first'));
    fwhm2 = x(find(y>=half_max, 1, 'last'));
    
    figure;
    hold on;
    plot(x, data(x));
    plot(x, gauss(x));
    plot_x_line(fwhm1, 0:ceil(max(y)), 'k--');
    plot_x_line(fwhm2, 0:ceil(max(y)), 'k--');
end