% reads from a txt file and prints

file_to_list :-
    open('assets/logo.txt', read, Str),
    read_file(Str,Lines),
    close(Str).

read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    write(X), nl,
    read_file(Stream,L).
