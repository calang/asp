% Horarios de primaria y preescolar

#const lecc_por_sem = 40.

% niveles
% nivel(nivel)
nivel(
    inter; trans;
    1; 2; 3; 4; 5; 6
).

% requisitos por nivel
% req(nivel, materia, lecciones)

req(inter, edfis, 2).
req(inter, infor, 1).
req(inter, ingles, 9).
req(inter, musica, 1).

req(trans, edfis, 2).
req(trans, infor, 1).
req(trans, ingles, 1).
req(trans, musica, 1).

req(1, arte, 1).
req(1, ciencias, 4).
req(1, edfis, 2).
req(1, espannol, 7).
req(1, estsoc, 4).
req(1, etica, 1).
req(1, infor, 2).
req(1, ingles, 10).
req(1, mate, 8).
req(1, musica, 1).

req(2, arte, 1).
req(2, ciencias, 4).
req(2, edfis, 2).
req(2, espannol, 7).
req(2, estsoc, 4).
req(2, etica, 1).
req(2, infor, 2).
req(2, ingles, 10).
req(2, mate, 8).
req(2, musica, 1).

req(3, arte, 1).
req(3, ciencias, 4).
req(3, edfis, 2).
req(3, espannol, 7).
req(3, estsoc, 4).
req(3, etica, 1).
req(3, infor, 2).
req(3, ingles, 10).
req(3, mate, 8).
req(3, musica, 1).

req(4, ciencias, 4).
req(4, edfis, 2).
req(4, espannol, 6).
req(4, estsoc, 5).
req(4, etica, 1).
req(4, frances, 2).
req(4, infor, 2).
req(4, ingles, 9).
req(4, mate, 8).
req(4, musica, 1).

req(5, ciencias, 4).
req(5, edfis, 2).
req(5, espannol, 5).
req(5, estsoc, 6).
req(5, etica, 1).
req(5, frances, 2).
req(5, infor, 2).
req(5, ingles, 9).
req(5, mate, 8).
req(5, musica, 1).

req(6, ciencias, 6).
req(6, edfis, 2).
req(6, espannol, 5).
req(6, estsoc, 4).
req(6, etica, 1).
req(6, frances, 2).
req(6, infor, 2).
req(6, ingles, 9).
req(6, mate, 8).
req(6, musica, 1).

req(Nivel, resto, Resto) :-
    nivel(Nivel),
    Otros = #sum { L, Materia : req(Nivel, Materia, L), Materia != resto },
    Resto = lecc_por_sem - Otros.


% asignacion de profesores a materias por nivel
% prof(profesor, nivel, materia)

prof(mpaula, inter, edfis).  % <-- ???
prof(jonathan, inter, infor).
prof(mjose, inter, ingles).
prof(alonso, inter, musica).
prof(alisson, inter, resto).

prof(mpaula, trans, edfis).
prof(jonathan, trans, infor).
prof(audry, trans, ingles).
prof(alonso, trans, musica).
prof(alisson, trans, resto).
prof(audry, trans, resto).
prof(sol, trans, resto).

prof(mjose, 1, arte).
prof(sol, 1, ciencias).
prof(mpaula, 1, edfis).
prof(sol, 1, espannol).
prof(sol, 1, estsoc).
prof(mjose, 1, etica).
prof(jonathan, 1, infor).
prof(audry, 1, ingles).
prof(sol, 1, mate).
prof(alonso, 1, musica).
prof(sol, 1, resto).

prof(alisson, 2, arte).
prof(mjose, 2, ciencias).
prof(mpaula, 2, edfis).
prof(mjose, 2, espannol).
prof(mjose, 2, estsoc).
prof(alisson, 2, etica).
prof(jonathan, 2, infor).
prof(gina, 2, ingles).
prof(mjose, 2, mate).
prof(alonso, 2, musica).
prof(mjose, 2, resto).

prof(mjose, 3, arte).
prof(audry, 3, ciencias).
prof(mpaula, 3, edfis).
prof(audry, 3, espannol).
prof(audry, 3, estsoc).
prof(mjose, 3, etica).
prof(jonathan, 3, infor).
prof(gina, 3, ingles).
prof(audry, 3, mate).
prof(alonso, 3, musica).
prof(audry, 3, resto).

prof(mayela, 4, ciencias).
prof(mpaula, 4, edfis).
prof(mayela, 4, espannol).
prof(mayela, 4, estsoc).
prof(alisson, 4, etica).
prof(angie, 4, frances).
prof(jonathan, 4, infor).
prof(gina, 4, ingles).
prof(mayela, 4, mate).
prof(alonso, 4, musica).
prof(mayela, 4, resto).

prof(mayela, 5, ciencias).
prof(mpaula, 5, edfis).
prof(daleana, 5, espannol).
prof(daleana, 5, estsoc).
prof(alisson, 5, etica).
prof(angie, 5, frances).
prof(jonathan, 5, infor).
prof(gina, 5, ingles).
prof(mayela, 5, mate).
prof(alonso, 5, musica).
prof(mayela, 5, resto).

prof(daleana, 6, ciencias).
prof(mpaula, 6, edfis).
prof(daleana, 6, espannol).
prof(daleana, 6, estsoc).
prof(alisson, 6, etica).
prof(angie, 6, frances).
prof(jonathan, 6, infor).
prof(melissa, 6, ingles).
prof(daleana, 6, mate).
prof(alonso, 6, musica).
prof(daleana, 6, resto).

% bloques disponibles
% bloque(dia, bloque, leccion)

bloque(
    (lun;mar;mie;jue;vie),
    (1..4),
    (a;b)
).

% disponibilidad de profesores
% disp(prof, dia, bloque, leccion).

disp(angie, mie, (2;3), (a;b)).
disp(angie, vie, 2, (a;b)).
disp(mpaula, (lun;mar;jue), 1..4, (a;b)).
disp(melissa, (lun;mar;mie;jue;vie), 1..4, (a;b)).
disp(jonathan, (lun;mar;mie;jue;vie), 1..4, (a;b)).
disp(alonso, mie, 1..4, (a;b)).
disp(gina, (lun;mar;mie;jue;vie), 1..4, (a;b)).
disp(audry, (lun;mar;mie;jue;vie), 1..4, (a;b)).
disp(daleana, (lun;mar;mie;jue;vie), 1..4, (a;b)).
disp(mayela, (lun;mar;mie;jue;vie), 1..4, (a;b)).
disp(mjose, (lun;mar;mie;jue;vie), 1..4, (a;b)).
disp(sol, (lun;mar;mie;jue;vie), 1..4, (a;b)).
disp(alisson, (lun;mar;mie;jue;vie), 1..4, (a;b)).


% objetivo, junto con restricciones

% ningún resto debe ser negativo
:- nivel(Nivel), req(Nivel, resto, L), L < 0.

% ninguna suma de lecciones por nivel debe ser distinta de lecc_por_sem
:- nivel(Nivel), #sum { L,Materia,Nivel : req(Nivel, Materia, L) } != lecc_por_sem.

% Si agregamos lo siguiente el problema ya no es satisfacible,
% por la restricción anterior,
% pero no es sencillo obtener un reporte de cual restricción no
% se está cumpliendo.
% Más bien ha de realizarse una depuración del programa.

% req(6, arte, 1).


% Notas:
% - edfis en común:  1,2  3,4  trans,inter
% - infor en común:  trans,inter
% - musica en común:  3,4
% - hay una materia "banda" para alonso
% - mjose da etica y artes para III, ¿es esto correcto?
% - el horario de mjose para vie,3 dice inter, pero vie,3 para inter dice alisson
%       probablemente se deben intercambiar 2 y 3 para inter,vie
% - alisson está asignada a inter en vie,2, pero inter a esa hora tiene ingles
%       inter tiene a alisson en vie,3, pero a esa hora ella está asignada a II etica y arte
