function area = integrate_fwhm_gauss(lambda, spektra, point, width)
    [gauss, x] = fit_gauss(lambda, spektra, point, width);
    
    [M, I] = max(gauss(x));    
    MAX = x(I);
    
    new_x = linspace((MAX-width*5),(MAX + width*5),100000);
    
    y = gauss(new_x);
    half_max = (min(y)+max(y))/2;
    fwhm1 = new_x(find(y>=half_max, 1, 'first'));
    fwhm2 = new_x(find(y>=half_max, 1, 'last'));
    
    %area = integrate(gauss, fwhm1, fwhm2);
    
    area = 0.5*sqrt(pi)*gauss.a1*gauss.c1*(erf((gauss.b1 - fwhm1)/gauss.c1)+erf(fwhm2 - gauss.b1)/gauss.c1);
    
    %area = energy;
    
    %figure;
    %hold on;
    %grid on;
    %box on;
    %plot_x_line(fwhm1, 0:0.001:(gauss(fwhm1)*1.3), 'k--');
    %plot_x_line(fwhm2, 0:0.001:(gauss(fwhm1)*1.3), 'k--');
    %plot(x, data(x), '.');
    %plot(x, gauss(x));
    %xlim([x(1) x(end)]);
    %ylim([0 max(y)*1.5]);
    
    %text(fwhm1-5, gauss(fwhm1)*1.4, '$x_0$', 'Interpreter', 'latex', 'FontSize', 18);
    %text(fwhm2-5, gauss(fwhm1)*1.4, '$x_1$', 'Interpreter', 'latex', 'FontSize', 18);
    
    %title('Gaussian anpassad till m\"attopp', 'Interpreter', 'latex', 'FontSize', 18);
    %h = legend('m\"atdata', 'anpassad gaussian', 'Location', 'NorthEast');
    %h.FontSize = 18;
    %set(h, 'Interpreter', 'latex');
    %xlabel('Kanal', 'Interpreter', 'latex', 'FontSize', 18);
    %ylabel('Pulser/s', 'Interpreter', 'latex', 'FontSize', 18);
end