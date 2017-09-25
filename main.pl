% Model for the game structure

play(NO) :- write('-- GAME OVER --'), nl, !.

play :- write('-- Welcome to a shitty Batman deduction game'), nl,
        write('-- Your objective is to track down Black Mask and discover...'), nl,
        write('-- 1 - Choice 1 ...'), nl,
        write('-- 2 - Choice 2 ...'), nl,
        read(choice),
        step1(choice).

play(YES) :- play.

% Next step and choice from previous one
step1(1) :- write('-- Something --'), nl, !.
