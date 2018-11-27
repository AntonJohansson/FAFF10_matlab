function MAX = get_max_gauss(lambda, spektra, point, width)
    [gauss, x] = fit_gauss(lambda, spektra, point, width);
    [M, I] = max(gauss(x));    
    MAX = x(I);
end