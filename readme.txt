Tema 1 Metode Numerice

Precizez ca implementarea temei a fost facuta in Octave existand diferente de sintaza intre Matlab si Octave.

Task-ul 1 - Functia Iterative.m

Am inceput prin a deschide fisierul si a citi numarul de noduri si listele de vecini, dupa care am creat
matricea de adiacenta, impartind elementele egale cu 1(nodurile cu care are legatura nodul curent) la numarul
total de legaturi ale nodului curent pentru a crea matricea M prin transpunerea lui A. Apoi, implementand 
algoritmul iterativ explicat in detaliu in resursa [1] am obtinut matricea indicilor PageRank.

Task-ul 2 - Functiile PR_Inv.m si Algebraic.m

Task-ul nu a fost greu, ci chiar mai simplu decat primul, dar am petrecut ceva timp incercand sa-mi dau seama
care este algoritmul algebraic si cum functioneaza acesta. In plus a trebuit sa implementez si algoritmul de
inversare a unei matrice.

In prima parte a task-ului am creat algoritmul de inversare. Mai intai, am descompus matricea A in QR folosind 
algoritmul Gram-Schmidt modificat explicat in laboratorul 3, dupa care am transformat relatia A=QR in RA^-1=Q'I
si am rezolvat acest sistem superior triunghiular cu algoritmul descris in laboratorul 2 din care a rezultat 
matricea A^-1.
Apoi, asemenea primului task am deschis fisierul si am citit lucrurile necesare, dupa care am creat matricea
de adiacenta si matricea M. Transformand relatia descrisa in algoritmul algebraic am obtinut o relatie din care
rezulta matricea indicilor PageRank.

Task-ul 3 - Functiile Apartenenta.m si PageRank.m

Task-ul a fost simplu, dar apeland la cunostiintele mele vaste in matematica am stat 20 de minute sa imi
amintesc cum aflu daca o functie pe ramuri este continua.

In prima parte a task-ului, am creat algoritmul de rezolvare al functiei u(x). Folosind relatiile pentru
continuitate(pe o foaie) lim x->val1 x<val1 = lim x->val1 x>val1 si lim x->val2 x<val2 = lim x->val2 x>val2 am 
obtinut un sistem de ecuatii din care am determinat formulele pentru variabilele a si b(pe care le-am folosit 
in algoritm). Apoi, am aflat rezultatul functiei u(x), in functie de apartenenta lui x la unul dintre cele trei
intervale.
In final, in cadrul functiei PageRank.m am determinat indicii PageRank folosind algoritmii de la primele doua
task-uri, dupa care am deschis fisierul si am citit din el valorile val1 si val2. Apoi, am concatenat la numele
fisierului primit ca parametru in antet sirul ".out" pentru a obtine fisierul in care voi scrie rezultatele
finale. Am deschis acest fisier, dupa care am scris in el numarul de noduri si indicii PageRank aflati anterior.
Apoi, am creat vectorul PR1 egal cu vectorul de indici obtinut prin metoda algebraica, pe care l-am sortat,
sortand in acelasi timp si un vector cu elemente de la 1 la numarul de noduri pentru a retine numarul fiecarui
nod din vectorul sortat. In cele din urma, am afisat pe rand fiecare index al nodului, urmat de numarul
acestuia si de valorea lui u(PR1(i)).