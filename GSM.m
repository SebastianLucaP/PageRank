function [Q,R,A_inv] = GSM(A)
  [N,N] = size(A);
  Q=[];
  R=[];
  A_inv=A;
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
    Ai=A_inv(:,k);
    Qi=Q(:,k);
    for i=N:-1:1
      sum=0;
      for j=i+1:N
        sum=sum+R(i,j)*Ai(j);
      endfor
      Ai(i)=(Qi(i)-sum)/R(i,i);
    A_inv(:,k)=Ai;
    endfor
  endfor
