% run with
% clingo -c n=5

% the board
row(1..n).
col(1..n).

% candidate solutions
{ queen(I,J) : row(I), col(J) }.

% constraints for a valid solution
:- { queen(I,J) } != n .

:- queen(I,J) , queen(I , J1), J != J1.
:- queen(I,J) , queen(I1, J) , I != I1.

:- queen(I,J) , queen(I1, J1), (I , J ) != (I1,J1), I - J == I1 - J1.
:- queen(I,J) , queen(I1, J1), (I , J ) != (I1,J1), I + J == I1 + J1.
