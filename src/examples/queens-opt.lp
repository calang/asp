% run with
% clingo -c n=5

% the board
row(1..n).
col(1..n).

% candidate solutions
{ queen(I, 1..n) } = 1 :- I = 1..n.
{ queen(1..n, J) } = 1 :- J = 1..n.

% constraints for a valid solution
:- { queen(D-J, J) } > 1 , D = 2..2*n.
:- { queen(D+J, J) } > 1 , D = 1-n..n-1.
