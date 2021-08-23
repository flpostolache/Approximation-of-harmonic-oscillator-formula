function [y1 y2] = RK4_sistem(f1, f2, y10, y20, a, b, n)
  
  y1=zeros(1,n);
  y2=zeros(1,n);
	y1(1) = y10;	
	y2(1) = y20;
	
  h = (b-a)/n;
	t(1:n+1) = a + h*[0:n];

  for i = 1:3
		K11 = h*feval(f1, t(i), y1(i), y2(i));
		K21 = h*feval(f2, t(i), y1(i), y2(i));

		K12 = h*feval(f1, t(i) + h/2, y1(i) + K11/2, y2(i) + K21/2);
		K22 = h*feval(f2, t(i) + h/2, y1(i) + K11/2, y2(i) + K21/2);
    
    K13 = h*feval(f1, t(i) + h/2, y1(i) + K12/2, y2(i) + K22/2);
		K23 = h*feval(f2, t(i) + h/2, y1(i) + K12/2, y2(i) + K22/2);
    
    K14 = h*feval(f1, t(i) + h, y1(i) + K13, y2(i) + K23);
		K24 = h*feval(f2, t(i) + h, y1(i) + K13, y2(i) + K23);
    
		y1(i+1) = y1(i) + (K11 + 2 * K12 + 2 * K13 + K14) / 6;
		y2(i+1) = y2(i) + (K21 + 2 * K22 + 2 * K23 + K24) / 6;
 	endfor
endfunction

