% Model for the game structure
play(no) :- write('-- GAME OVER --'), nl, !.

play :-
        write('-- Welcome to a shitty Batman deduction game'), nl,
        write('-- Your objective is to track down Black Mask and discover...'), nl,
        write('-- 1 - Choice 1 ...'), nl,
        write('-- 2 - Choice 2 ...'), nl,

        read(Choice),
        stage1(Choice).

play(yes) :- play.

% Next step and choice from previous one
stage1(1) :-
        write('-- Something 1 --'), nl,
        read(Continue),
        play(Continue).

stage1(2) :-
        write('-- Something 2 --'), nl,
        read(Continue),
        play(Continue).
