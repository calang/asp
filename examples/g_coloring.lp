
% problem instance (or graph.lp)

node(1..6).

edge(1,2).  edge(1,3).  edge(1,4).
edge(2,4).  edge(2,5).  edge(2,6).
edge(3,1).  edge(3,4).  edge(3,5).
edge(4,1).  edge(4,2).
edge(5,3).  edge(5,4).  edge(5,6).
edge(6,2).  edge(6,3).  edge(6,5).

color(r).   color(b).    color(g).


% problem encoding = problem class (or color_lp)

% if N is a node, it is assigned exactly one color
{ assign(N,C) : color(C) } = 1 :- node(N).

% two connected nodes must not have the same color
:- edge(N,M), assign(N,C), assign(M,C).