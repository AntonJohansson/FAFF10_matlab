%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Detta program anropas av menu.m och anv?nds f?r att l?sa Schr?-    %
% dingerekvationen numeriskt, d.v.s. utifr?n given potential (v?te-  %
% eller litiumsystem), givet l-kvanttal och given energi r?kna fram  %
% motsvarande radiella v?gfunktion.                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utvecklat av  Fredrik Frisk, Gunnar Ohlen, Ingemar Ragnarsson och  %
% Per ?stborn.                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ?versyn gjord av Magnus Borgh, h?stterminen 2005                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  H?r b?rjar programmet!
%   ||		     ||
%   ||		     ||
%   \/               \/

two_m_over_hbar_square = 0.26247;
e_Zero_square = 14.39967;
a_Bohr        = 0.529177;

Energy  = E;
Enorm = E*two_m_over_hbar_square; 

set(energiruta,'string',mat2str(E));

% definition av delta_r och start_r; vektorn r ?r definierad i menu.m
delta_r = r(2) - r(1);
start_r	= r(1:2);
L; Z;
old_wave_function1 = wave_function1;

% Potentialer f?r elektronen i v?teatomen samt f?r valenselektronen i
% litium. Notera att effektivt Z=2.69 anv?nds. En alternativ modell
% vore att anv?nda kvantdefektmodellen.
h_pot = -1.*e_Zero_square.*(1./r);
li_pot = -3.*e_Zero_square.*(1./r) + e_Zero_square.*(2./r-(5.38/a_Bohr+2./r).*exp(-5.38.*r/a_Bohr));
 
% Programmet kan ?ven (med anv?ndarinst?llningen Li i potentialvalet)
% anv?ndas f?r att r?kna p? elektronen i den v?teliknande jonen Li++.
% aktivera f?ljande rad f?r numerisk test av Li++       

%li_pot = -3.*e_Zero_square.*(1./r);

eff_pot = L*(L+1)./r.^2;
if Z == 1
    eff_pot = eff_pot + two_m_over_hbar_square .* (-e_Zero_square ./ r);
else
    eff_pot = eff_pot + two_m_over_hbar_square * userDefinedPotentialEnergy( r );
end;


% startv?rden i 1:a och 2:a 'punkten' f?r v?gfunktionen
wave_function = start_r.^(L+1);
t1 = clock;
% iteration med delta(r) enligt definition ovan
for i = 3:100
     wave_function(i) = (2+(eff_pot(i-1)-Enorm)*delta_r^2)* ...
        wave_function(i-1) - wave_function(i-2);
  end;
% iteration med 4 ggr st?rre delta(r)  
for i = 26:100
   wave_function(4*i) = (2+(eff_pot(4*(i-1))-Enorm)*(4*delta_r)^2)* ...
      wave_function(4*(i-1)) - wave_function(4*(i-2));
end;
% iteration med delta(r) ytterligare 5 ggr st?rre!   
for i = 1:20
     wave_function1(i) = wave_function(20*i); 
  end;
for i = 21:600
   wave_function(20*i) = (2+(eff_pot(20*(i-1))-Enorm)*(20*delta_r)^2)* ...
      wave_function(20*(i-1)) - wave_function(20*(i-2));
  wave_function1(i) = wave_function(20*i);   
end;
tid =etime(t1,clock);

% 2010-04-15: The program now plots the actual wavefunction, instead of
% the wavefunction multiplied with r. / J C Cremon
wave_function1 = wave_function1 ./ r1;

%   normera v?gfunktinen f?r plottning!
m_max = 0;
if Energy < -4
  m_max = max(abs(wave_function1(1:30)));
else
  m_max = max(abs(wave_function1(1:240)));
end;
wave_function1 = wave_function1 / m_max;

cla;
line([0 30],[0 0],'linestyle','--')

set(gca,'xlim',[0 30]);
set(gca,'ytick',[]);
hold on;



p = plot( r1, wave_function1, '-' );
set( p, 'linewidth', 2 );
plot( r1, old_wave_function1, '--' );



xlabel('Avst?nd till k?rnan (?ngstr?m)');

figure(2);
old_gca = gca;
clear gca;
clf;
FigureHook;
gca = old_gca;
figure(menyfigur);
%
%   /\           /\
%   ||		     ||
%   ||		     ||
%  H?r slutar programmet!
