function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  % Am calculat indicii PageRank cu metoda iterativa apoi cu cea algebraica
  % Am deschis fisierul si am citit val1 si val2 din el
  % Am deschis fisierul.out in care am pus numarul N de resurse web si indicii Pagerank calculati anterior
  % Am sortat indicii PageRank calculati cu metoda algebraica sortant si un vector auxiliar
  % care ajuta la retinerea nodului de pe fiecare pozitie
  % Cu un for am calculat fiecare u(PR1(i)) si am afisat indicii vectorului PR1, nodurile si "u"-urile calculate
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  f = fopen(nume, "r");
  N = fscanf(f, "%d", 1);
  for i = 1 : N
    nodi = fscanf(f, "%d", 1);
    nr = fscanf(f, "%d", 1);
    for j = 1 : nr
      nodj = fscanf(f, "%d", 1);
    endfor
  endfor
  val1 = fscanf(f, "%f", 1);
  val2 = fscanf(f, "%f", 1);
  fclose(f);
  nume = strcat(nume, ".out");
  f = fopen(nume, "w");
  fprintf(f, "%d\n", N);
  fprintf(f, "%.6f\n", R1);
  fprintf(f, "\n");
  fprintf(f, "%.6f\n", R2);
  fprintf(f, "\n");
  PR1 = R2;
  node = [1 : N];
  node = node';
  for i = 1 : N - 1
    for j = i + 1 : N
      if PR1(i, 1) < PR1(j, 1)
        aux = PR1(i, 1);
        PR1(i, 1) = PR1(j, 1);
        PR1(j, 1) = aux;
        aux = node(i, 1);
        node(i, 1) = node(j, 1);
        node(j, 1) = aux;
      endif
    endfor
  endfor
  for i = 1 : N
    fprintf(f, "%d %d %.6f\n", i, node(i, 1), Apartenenta(PR1(i, 1), val1, val2));
  endfor
  fclose(f);
endfunction