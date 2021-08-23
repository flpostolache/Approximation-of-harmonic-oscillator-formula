function check_result_for_function()
  [f1 f2 y_exact u10 u20 a b n] = functie_de_aproximat();
  
  y_pred_cor=pred_cor_ordin4(f1, f2, u10, u20, a, b, n);
  te = linspace(a, b, n+1);
	h = (b-a)/n;
	ta(1:n+1) = a + h*[0:n];
 
  plot(te,y_exact(te),"r", ta,y_pred_cor,"g"); 
  legend("y exact", "PRED COR", "location", "northwest");
endfunction