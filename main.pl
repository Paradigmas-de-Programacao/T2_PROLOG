% Importing modules
:- [game, database].

cls :- write('\e[H\e[2J').

play(no) :- write('-- GAME OVER --'), nl, !.
play :-
        cls,
        file_to_list, nl,
        write('-- Welcome to a Batman deduction game --'), nl,
        write('-- Your objective is solve all archived cases of police --'), nl,
        write('-- 1 - Case 2: Red Apple --'), nl,

        read(Choice),
        caso(Choice).

play(yes) :- play.

% Next step and choice from previous one
caso(1) :-
        cls,
        write('-- A QUINTA ESPOSA DO COMISSÁRIO GORDON FOI ENVENENADA POR UMA MAÇÃ VERMELHA ENCONTRADA PRÓXIMA A JANELA DE SUA CASA. FOI DITO QUE DURANTE A NOITE, UMA SOMBRA FOI VISTA ENTRANDO NA CASA, E SAINDO RAPIDAMENTE. QUANDO A SOMBRA ENTROU ATRÁS DE UMA ÁRVORE, DESAPARECEU. --'), nl,
        write('-- SELECT THE COMPUTER OPTIONS --'), nl,
        write('-- 1 - PEOPLE INFORMATION --'), nl,
        write('-- 2 - PLACES INFORMATION --'), nl,
        write('-- 3 - WEAPONS INFORMATION --'), nl,

        % Escolhe qual tipo de informação ele deseja = Pessoas, Locais, Armamento.
        read(Options),
        Caso = 1,
        computer_options(Options, Caso).

computer_options(1, Caso) :-
        cls,
        write('-- PEOPLE INFORMATION --'), nl,
        write('-- SELECT THE PERSON --'), nl,
        write('-- 1 - HERA VENENOSA --'), nl,

        % Escolhe qual pessoa ele deseja ter informações
        read(Id),
        person_id(Person, Id),
        see_person_information(Person, Caso).

computer_options(2, Caso) :-
        cls,
        write('-- PLACES INFORMATION --'), nl,
        write('-- SELECT THE PLACES --'), nl,
        write('-- 1 - GOTHAM CITY BANK --'), nl,

        % Escolhe sobre qual lugar se deseja ter informações
        read(Id),
        place_id(Place, Id),
        see_places_information(Place, Caso).

computer_options(3, Caso) :-
        cls,
        write('-- WEAPONS INFORMATION --'), nl,
        write('-- SELECT THE WEAPONS --'), nl,
        write('-- 1 - FREEZE GUN --'), nl,

        % Escolhe sobre qual lugar se deseja ter informações
        read(Id),
        weapon_id(Weapon, Id),
        see_weapons_information(Weapon, Caso).

see_person_information(Person, Caso) :-
        cls,
        is_an_ally(Person, Ally),
        bagof(Enemy, is_an_enemy(Person, Enemy), Enemies),
        true_name(Person, Real_Name),
        write('******* '),
        write(Person),
        write(' INFORMATION *******'), nl,
        write('-- TRUE NAME : '), write(Real_Name), nl,
        write('-- ENEMIES : '), display(Enemies), nl,
        write('-- ALLIES : '), write(Ally), nl,
        write('-- PRESS ANYTHING TO BACK --'), nl,
        read(Any),
        caso(Caso).

see_places_information(Place, Caso) :-
        cls,
        write('-- PLACES INFORMATION --'), nl,
        write('-- PRESS ANYTHING TO BACK --'), nl,
        read(Any),
        caso(Caso).

see_weapons_information(Weapon, Caso) :-
        cls,
        write('-- WEAPONS INFORMATION --'),nl,
        write('-- PRESS ANYTHING TO BACK --'), nl,
        read(Any),
        caso(Caso).
