#!/usr/bin/swipl

% :- use_module('src/scripts/timetable_base').
:- use_module(timetable_base).
:- ensure_loaded('asignado.pl').


% show_timetables
%
% Displays the timetables for all levels.

show_timetables :-
    forall( nivel(Nivel),
            timetable(Nivel)
    ).

% timetable(+Nivel)
%
% Displays the timetable for a specific level.
timetable(Nivel) :-
    format('Timetable for ~w:~n', [Nivel]),
    findall(Dia, dia(Dia), Dias),
    format('~10|~t~w~t~20|~t~w~t~30|~t~w~t~40|~t~w~t~50|~t~w~t~60|~n', Dias),
    nl,
    forall(
        bloquee(Bloquee),
        (   forall(
                leccion(Leccion),
                (
                    findall(
                        Materia,
                        (   member(Dia, Dias),
                            asignado(Nivel,Materia,_Profe,Dia,Bloquee,Leccion)
                        ),
                        Materias
                    ),
                    format( '~w ~w~t~10|~t~w~t~20|~t~w~t~30|~t~w~t~40|~t~w~t~50|~t~w~t~60|~n',
                            [Bloquee, Leccion | Materias ]
                    )
                )
            )
        )
    ),
    nl.



% --- tests ---

check_base :-
    forall( nivel(Nivel),
            (write('Nivel: '), write(Nivel), nl)
    ),
    write('Bloques:'), nl,
    forall( bloque(Dia, Bloque, Leccion),
            (   write('Dia: '), write(Dia), 
                write(', Bloque: '), write(Bloque), 
                write(', Leccion: '), write(Leccion),
                nl
            )
    ).


