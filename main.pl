  % Model for the game structure

cls :- write('\e[H\e[2J').

play(no) :- write('-- GAME OVER --'), nl, !.
play :-
        cls,
        write('-- Welcome to a shitty Batman deduction game'), nl,
        write('-- Your objective is to track down Black Mask and discover...'), nl,
        write('-- 1 - Case 2: Red Apple ...'), nl,

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
        id(Person, Id),
        see_person_information(Person, Caso).

see_person_information(Person, Caso) :-
        cls,
        is_an_ally(Person, Ally),
        bagof(Enemy, is_an_enemy(Person, Enemy), Enemies),
        true_name(Person, Real_Name),
        write('-- 1 - HERA VENENOSA INFORMATION --'), nl,
        write('-- TRUE NAME : '), write(Real_Name), nl,
        write('-- ENEMIES : '), display(Enemies), nl,
        write('-- ALLIES : '), write(Ally), nl,
        write('-- PRESS ANYTHING TO BACK --'), nl,
        read(Any),
        caso(Caso).
