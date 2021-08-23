function [y1 y2]= pred_cor_ordin4(f1, f2, u10, u20, a, b, n)
  
  [y1 y2] = RK4_sistem(f1, f2, u10, u20, a, b, n);

	h = (b-a)/n;
  t(1:n+1) = a + h*[0:n];

	for i = 4:n
		aux1 = feval(f1, t(i), y1(i),y2(i));
		aux2 = feval(f1, t(i-1), y1(i-1),y2(i-1));
		aux3 = feval(f1, t(i-2), y1(i-2),y2(i-2));
		aux4 = feval(f1, t(i-3), y1(i-3),y2(i-3));
    
    aux5 = feval(f2, t(i), y1(i),y2(i));
		aux6 = feval(f2, t(i-1), y1(i-1),y2(i-1));
		aux7 = feval(f2, t(i-2), y1(i-2),y2(i-2));
		aux8 = feval(f2, t(i-3), y1(i-3),y2(i-3));
    
    ypred1 = y1(i) + h/24*(55*aux1 - 59*aux2 + 37*aux3 - 9*aux4);
    ypred2 = y2(i) + h/24*(55*aux5 - 59*aux6 + 37*aux7 - 9*aux8);
    ycor1 = y1(i) + h/12*(5*feval(f1, t(i+1), ypred1, ypred2) + 8*aux1 - aux2);
    ycor2 = y2(i) + h/12*(5*feval(f2, t(i+1), ypred1, ypred2) + 8*aux5 - aux6);
    y1(i+1) = ycor1;
    y2(i+1) = ycor2;
	endfor
endfunction