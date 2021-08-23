function [f1 f2 y_exact u10 u20 a b n] = functie_de_aproximat()
  f1 = @(t, u1, u2) u2;
  f2 = @(t, u1, u2) -25*u1;

	y_exact = @(t) cos(5*t);
  
	% conditii initiale
  u10 = 1;
  u20 = 0;
  a = 0;
  b = 5;
  n = 500;
endfunction