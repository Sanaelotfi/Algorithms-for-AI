% include global contraint alldifferent
include "alldifferent.mzn";

% _______ definition of inputs ___________

% number of teams
int: nbTeams = 14;
% the location matrix
array[int,int] of int: pv = [|
0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1|
1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1|
0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0|
0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0|
1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0|
1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0|
0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1|
1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0|
1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0|
1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1|
0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0|
0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0|
0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0|
0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0|];

% _______ definition of new variables __________

int: nbRounds = nbTeams - 1;
int : maxConsecutive = 4;
int : verifyConsecutive = nbTeams - maxConsecutive;

% _______ definition of the output _________

% the output is an array that gives the opponent of team i in row i
% the columns are the rounds
array[1..nbTeams,1..nbRounds] of var 1..nbTeams: M;

% ______ definition of constraints ___________

% additional constraint that breaks the symmetry of the solution
constraint M[1,1] < M[1,nbRounds];

% each team should play exactly once against every other team
constraint forall (i in 1..nbTeams) (alldifferent([M[i,j] | j in 1..nbRounds]));

% a team can't play twice in the same round
constraint forall (j in 1..nbRounds) (alldifferent([M[i,j] | i in 1..nbTeams]));

% a team can't play against itself
constraint forall(i in 1..nbTeams) (forall (j in 1..nbRounds) (M[i,j] != i));

% a team can't play more than 3 consecutive matches indoor
constraint forall(i in 1..nbTeams) (forall (j in 1..verifyConsecutive) (pv[i,M[i,j]] + pv[i,M[i,j+1]] + pv[i,M[i,j+2]] + pv[i,M[i,j+3]] < maxConsecutive));

% a team can't play more than 3 consecutive matches outdoor
constraint forall(i in 1..nbTeams) (forall (j in 1..verifyConsecutive) (pv[i,M[i,j]] + pv[i,M[i,j+1]] + pv[i,M[i,j+2]] + pv[i,M[i,j+3]] > 0));

% the opponent of the opponent of i in round j is i itself
constraint forall (i in 1..nbTeams) (forall (j in 1..nbRounds) (i = M[M[i,j],j]));

% _______ solving the problem ____________

solve satisfy;
% printing the output matrix, columns = rounds and rows = players
output [join("\n", [join("\t",[show(M[r,m]) | m in 1..nbRounds]) | r in 1..nbTeams])];
