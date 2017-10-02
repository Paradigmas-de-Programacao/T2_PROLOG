:- dynamic affirmative/1.
:- dynamic negative/1.
:- dynamic solve/0.
:- dynamic culprit/1.
:- dynamic clue/1.
:- dynamic affirmative_clue/2.
:- dynamic analysis/0.
:- dynamic clearBase/1.
:- dynamic clearBase1/1.


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
        write('-- 4 - SOLVE THE CASE --'), nl,

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

computer_options(4, Caso) :-
        cls,
        culprit(SVillain).

% symbolic
affirmative(nothing).

clearBase(X):- clearBase1(X), fail.
clearBase(X).

clearBase1(X):- retract(X).
clearBase1(X).


culprit(joker) :- clue(wears_purple),
                  clue(uses_gun),
                  clue(laughs),
                  clue(has_one_ally),
                  solve.

clue(wears_purple) :-
        write('Does the suspect wears purple? (y/n)'),nl,
        read(AnswerPurple),
        affirmative_clue(AnswePurple, wears_purple).


clue(uses_gun):-
        write('Does the suspect uses a gun? (y/n)'),nl,
        read(AnswerGun),
        affirmative_clue(AnswerGun, uses_gun).


clue(laughs):-
        write('Does the suspect laughs at the crime scene? (y/n)'),nl,
        read(AnswerLaughs), affirmative_clue(AnswerLaughs, laughs).


clue(has_one_ally):-
        write('Does the suspect has only one ally? (y/n)'),nl,
        read(AnswerOneAlly),
        affirmative_clue(AnswerOneAlly, has_one_ally).

affirmative_clue('y', Clue) :- asserta(affirmative(Clue)).
affirmative_clue('n', Clue).

solve :-
        analysis,
        write('The culprit data matches the Joker!'), nl, !.

solve :- write('The culprit was not the Joker !'), nl, !.

analysis :- (affirmative(wears_purple), affirmative(uses_gun), affirmative(laughs), affirmative(has_one_ally)).


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
