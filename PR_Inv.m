function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Am folosit algoritmul Gram-Schmidt modificat pentru descompunerea lui A in in QR
  % Din relatia A=QR am obtinut R*A^-1=Q'I, un sistem superior triunghiular rezolvat
  % prin formula din laborator, din care rezulta matricea A^-1 (B)
  [N,N] = size(A);
  Q=[];
  R=[];
  B=A;
  for i=1:N
    R(i,i)=norm(A(:,i));
    Q(:,i)=A(:,i)/R(i,i);
    for j=i+1:N
      R(i,j)=Q(:,i)'*A(:,j);
      A(:,j)=A(:,j)-Q(:,i)*R(i,j);
    endfor
  endfor
  Q=Q';
  for k=1:N
    Ai=B(:,k);
    Qi=Q(:,k);
    for i=N:-1:1
      sum=0;
      for j=i+1:N
        sum=sum+R(i,j)*Ai(j);
      endfor
      Ai(i)=(Qi(i)-sum)/R(i,i);
    B(:,k)=Ai;
    endfor
  endfor
endfunction