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

%- prof(_, inter, edfis).
%- prof(_, inter, infor).
%- prof(_, inter, ingles).
prof(alonso, inter, musica).
prof(alisson, inter, inter).

%- prof(_, trans, edfis).
%- prof(_, trans, infor).
%- prof(_, trans, ingles).
prof(alonso, trans, musica).
prof(alisson, trans, trans).
prof(audry, trans, trans).
prof(sol, trans, trans).

%- prof(_, 1, arte).
%- prof(_, 1, ciencias).
%- prof(_, 1, edfis).
%- prof(_, 1, espannol).
%- prof(_, 1, estsoc).
%- prof(_, 1, etica).
%- prof(_, 1, infor).
%- prof(_, 1, ingles).
%- prof(_, 1, mate).
prof(alonso, 1, musica).
% prof(sol, 1, 1).

%- prof(_, 2, arte).
%- prof(_, 2, ciencias).
%- prof(_, 2, edfis).
%- prof(_, 2, espannol).
%- prof(_, 2, estsoc).
%- prof(_, 2, etica).
%- prof(_, 2, infor).
%- prof(_, 2, ingles).
%- prof(_, 2, mate).
prof(alonso, 2, musica).
% prof(mjose, 2, 2).

%- prof(_, 3, arte).
%- prof(_, 3, ciencias).
%- prof(_, 3, edfis).
%- prof(_, 3, espannol).
%- prof(_, 3, estsoc).
%- prof(_, 3, etica).
%- prof(_, 3, infor).
%- prof(_, 3, ingles).
%- prof(_, 3, mate).
prof(alonso, 3, musica).
% prof(audry, 3, 3).

%- prof(_, 4, ciencias).
%- prof(_, 4, edfis).
%- prof(_, 4, espannol).
%- prof(_, 4, estsoc).
%- prof(_, 4, etica).
%- prof(_, 4, frances).
%- prof(_, 4, infor).
%- prof(_, 4, ingles).
%- prof(_, 4, mate).
prof(alonso, 4, musica).
% prof(mayela, 4, 4).

%- prof(_, 5, ciencias).
%- prof(_, 5, edfis).
%- prof(_, 5, espannol).
%- prof(_, 5, estsoc).
%- prof(_, 5, etica).
%- prof(_, 5, frances).
%- prof(_, 5, infor).
%- prof(_, 5, ingles).
%- prof(_, 5, mate).
prof(alonso, 5, musica).
% prof(mayela, 5, 5).

%- prof(_, 6, ciencias).
%- prof(_, 6, edfis).
%- prof(_, 6, espannol).
%- prof(_, 6, estsoc).
%- prof(_, 6, etica).
%- prof(_, 6, frances).
%- prof(_, 6, infor).
%- prof(_, 6, ingles).
%- prof(_, 6, mate).
prof(alonso, 6, musica).
% prof(daleana, 6, 6).

% bloques disponibles
% bloque(dia, bloque, leccion)
bloque(
    (lun;mar;mie;jue;vie),
    (1..4),
    (a;b)
).

% disponibilidad de profesores

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

