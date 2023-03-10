function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  % Am deschis fisierul si am citit numarul de noduri si listele de vecini
  % Am creat matricea de adiacenta impartind legaturile fiecarui nod la numarul total de legaturi
  % ale acestuia pentru a crea apoi matricea M
  % Folosind algoritmul iterativ descris in resursa [1] am calculat indicii PageRank
  f = fopen(nume , "r");
  N = fscanf(f, "%d", 1);
  A=zeros(N, N);
  for i = 1 : N
    nodi = fscanf(f, "%d", 1);
    nr = fscanf(f, "%d", 1);
    cpnr = nr;
    for j = 1 : nr
      nodj = fscanf(f, "%d", 1);
      if nodi != nodj
        A(nodi, nodj) = 1;
      elseif
        cpnr = cpnr - 1;
      endif
    endfor
    for j = 1 : N
      if nodi != j
        A(nodi, j) = A(nodi, j) / cpnr;
      endif
    endfor
  endfor
  fclose(f);
  M = A';
  printf("\n");
  R = ones(N, 1);
  R(:, 1) = 1 / N;
  last_R = ones(N, 1);
  M_hat = (d .* M) + (((1 - d) / N) .* ones(N, N));
  while (norm(R - last_R) > eps)
    last_R = R;
    R = M_hat * R;
  endwhile
  R = last_R;
  endfunction