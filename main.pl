% Model for the game structure

play(no) :- write('-- GAME OVER --'), nl, !.
play :-
        write('-- Welcome to a shitty Batman deduction game'), nl,
        write('-- Your objective is to track down Black Mask and discover...'), nl,
        write('-- 1 - Case 1: Black Bomb ...'), nl,
        write('-- 2 - Case 2: Red Apple ...'), nl,

        read(Choice),
        caso(Choice).

play(yes) :- play.

% Next step and choice from previous one
caso(1) :-
        write('-- CASE DESCRIPTION --'), nl,
        write('-- SELECT THE COMPUTER OPTIONS --'), nl,
        write('-- 1 - PEOPLE INFORMATION --'), nl,
        write('-- 2 - PLACES INFORMATION --'), nl,
        write('-- 3 - WEAPONS INFORMATION --'), nl,

        % Escolhe qual tipo de informação ele deseja = Pessoas, Locais, Armamento.
        read(Options),
        Caso = 1,
        computer_options(Options, Caso).

computer_options(1, Caso) :-
        write('-- PEOPLE INFORMATION --'), nl,
        write('-- SELECT THE PERSON --'), nl,
        write('-- 1 - HERA VENENOSA --'), nl,
        write('-- 2 - CHARADA --'), nl,
        write('-- 3 - CORINGA --'), nl,

        % Escolhe qual pessoa ele deseja ter informações
        read(Person),
        see_person_information(Person, Caso).

see_person_information(1, Caso) :-
        write('-- 1 - HERA VENENOSA INFORMATION --'), nl,
        write('-- HERA INFORMATION --'), nl,
        caso(Caso).
