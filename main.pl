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
        write('-- 1 - Case 1: Red Apple --'), nl,

        read(Choice),
        caso(Choice).

play(yes) :- play.

% Next step and choice from previous one
caso(1) :-
        cls,
        write('-- A ESPOSA DO COMISSÁRIO GORDON FOI ENVENENADA POR UMA MAÇÃ VERMELHA ENCONTRADA PRÓXIMA A JANELA DE SUA CASA. FOI DITO QUE DURANTE A NOITE, UMA SOMBRA FOI VISTA ENTRANDO NA CASA, E SAINDO RAPIDAMENTE. QUANDO A SOMBRA ENTROU ATRÁS DE UMA ÁRVORE, DESAPARECEU. --'), nl,
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


culprit(crime_culprit) :-
                  clue(is_a_human),
                  clue(is_a_monster),
                  clue(is_a_scientist),
                  clue(is_a_man),
                  clue(is_a_woman),
                  clue(wears_purple),
                  clue(wears_black),
                  clue(wears_green),
                  clue(wears_armor),
                  clue(has_no_ally),
                  clue(has_ally),
                  clue(uses_gun),
                  solve.

clue(is_a_human) :-
        write('Is the culprit probably a human? (y/n)'),nl,
        read(AnswerHuman),
        affirmative_clue(AnswerHuman, is_a_human).

clue(is_a_monster) :-
        write('Is the culprit probably a monster? (y/n)'),nl,
        read(AnswerMonster),
        affirmative_clue(AnswerHuman, is_a_monster).

clue(is_a_scientist) :-
        write('Is the culprit probably a scientist (y/n)'),nl,
        read(AnswerScientist),
        affirmative_clue(AnswerScientist, is_a_scientist).

clue(is_a_man) :-
        write('Is the culprit probably a man (y/n)'),nl,
        read(AnswerMan),
        affirmative_clue(AnswerMan, is_a_man).

clue(is_a_woman) :-
        write('Is the culprit probably a woman (y/n)'),nl,
        read(AnswerWoman),
        affirmative_clue(AnswerWoman, is_a_woman).

clue(wears_purple) :-
        write('Did the suspect wears purple? (y/n)'),nl,
        read(AnswerPurple),
        affirmative_clue(AnswerPurple, wears_purple).

clue(wears_black) :-
        write('Did the suspect wears black? (y/n)'),nl,
        read(AnswerBlack),
        affirmative_clue(Answerblack, wears_black).

clue(wears_green) :-
        write('Did the suspect wears green? (y/n)'),nl,
        read(AnswerGreen),
        affirmative_clue(AnswerGreen, wears_green).

clue(wears_armor) :-
        write('Did the suspect wears a armor? (y/n)'),nl,
        read(AnswerArmor),
        affirmative_clue(AnswerArmor, wears_armor).

clue(has_no_ally):-
        write('Did the suspect had no ally? (y/n)'),nl,
        read(AnswerNoAlly),
        affirmative_clue(AnswerNoAlly, has_no_ally).

clue(has_ally):-
        write('Did the suspect had an ally? (y/n)'),nl,
        read(AnswerAlly),
        affirmative_clue(AnswerAlly, has_ally).

clue(uses_gun):-
        write('Did the suspect used a gun? (y/n)'),nl,
        read(AnswerGun),
        affirmative_clue(AnswerGun, uses_gun).

affirmative_clue('y', Clue) :- asserta(affirmative(Clue)).
affirmative_clue('n', Clue).

solve :-
        analysis_joker,
        write('The culprit data matches the Joker!'), nl,
        write('But he wasnt the culprit of any of these cases!'), nl, !.

solve :-
        analysis_catwoman,
        write('The culprit data matches Catwoman!'), nl, !.

solve :-
        analysis_poison_ivy,
        write('The culprit data matches Poison Ivy!'), nl,
        write('She was the culprit of case 1!'), nl, !.

solve :- write('The culprit data doesnt match any villain in the database !'), nl, !.

analysis_joker :- (affirmative(wears_purple), affirmative(uses_gun), affirmative(has_ally)).
analysis_catwoman :- (affirmative(wears_black), affirmative(has_no_ally)).
analysis_poison_ivy :- (affirmative(is_a_woman), affirmative(wears_green), affirmative(has_ally), affirmative(is_a_scientist)).

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
