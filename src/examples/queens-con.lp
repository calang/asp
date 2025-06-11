% invoke:
%     clingcon -c n=30 queens-con.lp

#const n = 10.

p(1..n).

&dom { 1..n } = q(N) :- p(N).

&distinct { q(N)+0 : p(N) }.
&distinct { q(N)-N : p(N) }.
&distinct { q(N)+N : p(N) }.