e = 1.6022e-19;
Z_eff = 2.69;
e_0 = 8.854187817e-12;
h_bar = 1.0545718e-34;
a_0 = h_bar^2*4*pi*e_0/(9.11e-31*e^2);

A = 2*e*Z_eff^3/(e_0*pi*a_0^3);
alpha = 2*Z_eff/a_0;

C = -Z_eff/(4*pi*e_0);


U = @(r) (A/alpha^2)*exp(-alpha*r) + ((2*A)./(r*alpha^3)).*exp(-alpha*r) + C./r;
V = @(r) -e*U(r);

e_zero_square = 14.39967;
V_from_inner_electrons = @(r) e_zero_square.*(2./r-(2*Z_eff/a_0+2./r).*exp(-2*Z_eff.*r/a_0));
%V_from_inner_electrons = @(r) e_zero_square.*(2./r);
%V_from_inner_electrons = @(r) e_zero_square.*(-(2*Z_eff/a_0+2./r).*exp(-2*Z_eff.*r/a_0));

x = linspace(0,10e-10, 100000);
figure;
hold on;
%plot(x, V(x));
plot(x, V_from_inner_electrons(x));
%xlim([0 1e-12]);