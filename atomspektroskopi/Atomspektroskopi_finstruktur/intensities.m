data = importdata('cd.TXT', ';');
data = data.data;

lambda = data(:,1);
spektra = data(:,2) - data(:,3);
n = 1.000293; % brytningsindex luft
lambda = lambda*n;

h = 6.6261e-34;
c = 2.99792458e8;
R = 1.097373160000000e+07;

%i325 = integrate_fwhm_gauss(lambda, spektra, 325, 1)
%i326 = integrate_fwhm_gauss(lambda, spektra, 326, 1)

i340 = integrate_fwhm_gauss(lambda, spektra, 340.5, 1)/100e-3;    %3P0 <- 3D1
i346 = integrate_fwhm_gauss(lambda, spektra, 346.5, 0.3)/100e-3;  %3P1 <- 3D2
i347 = integrate_fwhm_gauss(lambda, spektra, 347.1, 0.3)/100e-3;  %3P1 <- 3D1
i361 = integrate_fwhm_gauss(lambda, spektra, 361.2, 1)/100e-3;    %3P2 <- 3D3
i362 = integrate_fwhm_gauss(lambda, spektra, 361.4, 0.1)/100e-3;  %3P2 <- 3D2
i363 = integrate_fwhm_gauss(lambda, spektra, 361.6, 0.1)/100e-3;  %3P2 <- 3D1

% 3D1 -> 3P
 s = i340 + i347 + i363;
 s/(2*1+1);
% 3D2 -> 3P
 s = i346 + i362;
 s/(2*2+1);
% 3D2 -> 3P
 s = i361;
 s/(2*3+1);
% 3P0 -> 3D
 s = i340
 s/(2*0+1);
% 3P1 -> 3D
 s = i346 + i347
 s/(2*1+1);
% 3P2 -> 3D
 s = i361 + i362 + i363
 s/(2*2+1);

%% 
l325 = get_max_gauss(lambda, spektra, 325, 1);
l326 = get_max_gauss(lambda, spektra, 326, 1);
l340 = get_max_gauss(lambda, spektra, 340.5, 1);
l346 = get_max_gauss(lambda, spektra, 346.5, 0.3);
l347 = get_max_gauss(lambda, spektra, 347.1, 0.3);
l361 = get_max_gauss(lambda, spektra, 361.2, 1);
l362 = get_max_gauss(lambda, spektra, 361.4, 0.1);
l363 = get_max_gauss(lambda, spektra, 361.6, 0.1);

%%

%   1.3307e-22


%ans =

%   7.2976e-23


%ans =

%   2.6570e-23