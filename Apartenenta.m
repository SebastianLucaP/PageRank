function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  % Pornind de la relatiile pentru continuitate lim x->val1 x<val1 = lim x->val1 x>val1,
  % respectiv lim x->val2 x<val2 = lim x->val2 x>val2 si rezolvand sistemul de ecuatii,
  % am determinat doua formule pentru a si b
  % Am calculat valoarea functiei, in functie de apartenenta lui x la una dintre cele trei ramuri
  if x < val1
    y = 0;
  elseif x > val2
    y = 1;
  else
    a = 1 / (val2-val1);
    b = (-val1) /  (val2-val1);
    y = a * x + b;
  endif
endfunction	