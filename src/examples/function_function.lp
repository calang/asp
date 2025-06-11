#script (python)
import clingo

F = clingo.Function

def g(c, f):
    n = c.name
    r = F(n, f.arguments)
    return r
#end.

p(f, (1,2)).
p(g, (a,b)).
g(X,Y,@g(X,Y)) :- p(X,Y).
