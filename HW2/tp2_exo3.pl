:- discontiguous(prerequis/2).
:- discontiguous coursAPrendreComplet/1.

cours(inf1010).
cours(inf1005c).
cours(log1000).
cours(inf1600).
cours(inf1500).
cours(inf2010).
cours(log2410).
cours(inf2705).
cours(log2810).
cours(log2990).
cours(mth1007).
cours(inf2205).
cours(inf1900).

%prerequis(X,Y) : X est le prérequis de Y
prerequis(inf1005c,inf1010).
prerequis(inf1005c,log1000).
prerequis(inf1005c,inf1600).
prerequis(inf1500,inf1600).
prerequis(inf1010,inf2010).
prerequis(inf1010,log2410).
prerequis(inf1900,log2410).
prerequis(log1000,log2410).
prerequis(inf2010,inf2705).
%corequis(X,Y) : X est le corequis de Y
corequis(log2810,inf2010).
corequis(log2990,inf2705).
corequis(mth1007,inf2705).
corequis(log1000,inf1900).
corequis(inf1600,inf1900).
corequis(inf2205,inf1900).
corequis(inf1600,log1000).
corequis(inf2205,log1000).


coursAPrendreComplet(inf1005c):-print([]),!.
coursAPrendreComplet(inf1500):-print([]),!.

isMember(X, [X|_]). % !/0 est un littéral comme les autres, vrai par déf
isMember(X, [_|B]):- isMember(X, B).

%X requis à Y si X est prerequis à Y ou X corequis à Y
%Exemple : X = log1000 et Y = inf1900 ou X = log1000 et Y = log2410
isprerequis(X,Y):- prerequis(X,Y);corequis(X,Y).

%X requis à Y si X est prerequis à Z et Z est requis à Y
%Exemple : X = inf1010 et Y = inf2705 et Z = inf2010
%Exemple : X = inf1005c et Y = inf1900 et Z = log1000
isprerequis(X,Y):- prerequis(X,Z),isprerequis(Z,Y).

%X requis à Y si X est corequis à Z et Z est requis à Y
%Exemple : X = log2810 et Y = inf2705 et Z = inf2010
isprerequis(X,Y):- corequis(X,Z),isprerequis(Z,Y).

%iscorequis(X,Y) : X est prérequis/corequis de Y sachant que Y est un corequis(seulement) d'une matière

%X corequis de Y si Y corequis de X
%Exemple : iscorequis(2705,log2990) est vrai
iscorequis(X,Y):- corequis(Y,X).

%Exemple : X = mth1007 et Y = log2990 et Z = inf2705
iscorequis(X,Y):- corequis(X,Z), iscorequis(Z,Y).

%Exemple : X = inf1010 et Y = log2810 et Z = inf2010
iscorequis(X,Y):- isprerequis(X,Z), iscorequis(Z,Y).


coursAPrendre(X,L):- setof(Y,(isprerequis(Y,X);iscorequis(Y,X)),List), delete(List,X,L).

%Cours à prendre
coursAPrendreComplet(X):- coursAPrendre(X,L), print(L).

% X prerequis de Y
testprerequis(X,Y):- coursAPrendre(Y,L), isMember(X, L),!.

corequisits(X,Y):- corequis(X,Y); corequis(Y,X).
corequisits(X,Y):- corequis(X,P),corequis(Y,P).

corequisAPrendre(X,L):- setof(Y,(corequisits(X,Y)),List), delete(List,X,L).

% X corequis de Y
testcorequis(X,Y):- corequisAPrendre(Y,L), isMember(X, L).








