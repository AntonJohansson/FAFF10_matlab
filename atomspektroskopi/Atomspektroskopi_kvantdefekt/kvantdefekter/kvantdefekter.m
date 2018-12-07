data_satur = importdata('../na_nagot_saturated.TXT', ';');
data_satur = data_satur.data;

data = importdata('../na_icke_saturated.TXT', ';');
data = data.data;

lambda_satur = data_satur(:,1);
spektra_satur = data_satur(:,5);
n = 1.000293; % brytningsindex luft
lambda_satur = lambda_satur*n;

lambda = data(:,1);
spektra = data(:,5);
n = 1.000293; % brytningsindex luft
lambda = lambda*n;

h = 6.626e-34;
c = 2.99792458e8;
R = 10973731.6;

lambda_615 = get_max_gauss(lambda_satur, spektra_satur, 615.9, 2.5);
lambda_515 = get_max_gauss(lambda_satur, spektra_satur, 516.3, 1.2);
lambda_588 = get_max_gauss(lambda, spektra, 588, 1.4);
lambda_568 = get_max_gauss(lambda_satur, spektra_satur, 568.6, 4);
lambda_498 = get_max_gauss(lambda_satur, spektra_satur, 499.01, 1);
lambda_451 = get_max_gauss(lambda_satur, spektra_satur, 451.6, 1);

delta       = @(E,n) -sqrt(h*c*R/E) + n;
lambda_to_E = @(lambda) h*c/lambda;

E_3s = 5.1*1.6022e-19;
E_3p = abs(-E_3s + lambda_to_E(lambda_588*1e-9));

E_5s = abs(-E_3p + lambda_to_E(lambda_615*1e-9));
E_6s = abs(-E_3p + lambda_to_E(lambda_515*1e-9));

E_4d = abs(-E_3p + lambda_to_E(lambda_568*1e-9));
E_5d = abs(-E_3p + lambda_to_E(lambda_498*1e-9));
E_7d = abs(-E_3p + lambda_to_E(lambda_451*1e-9));

E_3s/1.6022e-19;
E_5s/1.6022e-19;
E_6s/1.6022e-19;

E_3p/1.6022e-19;

E_4d/1.6022e-19;
E_5d/1.6022e-19;
E_7d/1.6022e-19;

k_3s = delta(E_3s, 3)
k_5s = delta(E_5s, 5)
k_6s = delta(E_6s, 6)
s_mean = mean([k_3s k_5s k_6s]);

k_3p = delta(E_3p, 3)

k_4d = delta(E_4d, 4)
k_5d = delta(E_5d, 5)
k_7d = delta(E_7d, 7)
d_mean = mean([k_4d k_5d k_7d])

E_8d = h*c*R/(8-k_7d)^2;
E = -E_8d - -E_3p;
h*c/E