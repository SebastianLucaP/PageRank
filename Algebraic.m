function [R,X,M] = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  % Am deschis fisierul si am citit numarul de noduri si listele de vecini
  % Am creat matricea de adiacenta impartind legaturile fiecarui nod la numarul total de legaturi
  % ale acestuia pentru a crea apoi matricea M
  % Folosind algoritmul algebraic descris in resursa [1] am calculat indicii Pagerank
  f = fopen(nume , "r");
  N = fscanf(f, "%d", 1);
  A = zeros(N, N);
  X = ones(N, 1);
  X(:, 1) = (1 - d) / N;
  for i = 1 : N
    nodi = fscanf(f, "%d", 1);
    nr = fscanf(f, "%d", 1);
    cpnr = nr;
    for j = 1 : nr
      nodj = fscanf(f, "%d", 1);
      if nodi != nodj
        A(nodi, nodj) = 1;
      elseif
        cpnr = cpnr-1;
      endif
    endfor
    for j = 1 : N
      if nodi != j
        A(nodi, j) = A(nodi, j) / cpnr;
      endif
    endfor
  endfor
  fclose(f);
  for i = 1 : N
  endfor
  R = [1, N];
  M = A';
  R = PR_Inv(eye(N) -d * M) * X;
endfunction