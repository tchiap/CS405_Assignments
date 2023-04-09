% Tom Chiapete
% Feb 14, 2006
% Assignment 2

% Delare the book data type.
alist(LN,FN,MI).
t(TITLE,PUBLISHER,YEAR). 
book([alist(LN,FN,MI)|t(T,PUB,YR)]).

% Output Menu
menu:-
write_ln('Select Option'), nl,
write_ln('1: Insert New Book'), nl,
write_ln('2: Display a Book'),nl,
write_ln('3: Delete a Book'), nl,
write_ln('4: Quit'), nl,
read(Opt),option(Opt).

% Ask for input then ASSERT.
option(1):- 
write_ln('Enter name of book:  '), read(Input),T is Input,
write_ln('Enter Authors First Name:  '), read(Input),FN is Input,
write_ln('Enter Authors Middle Initial:  '), read(Input), MI is Input,
write_ln('Enter Authors Last Name:  '), read(Input),LN is Input,
write_ln('Enter Publisher Name:  '), read(Input),PUB is Input,
write_ln('Enter Year Published:  '), read(Input),YR is Input, 
assert( book([alist(LN,FN,MI)|t(T,PUB,YR)]) ).
option(1):- write_ln('Error!'),menu.

% Ask for input then attempt to find the record.
option(2):- 
write_ln('Enter Book Information:  '):- 
write_ln('Enter name of book:  '), read(Input),T is Input,
write_ln('Enter Authors First Name:  '), read(Input),FN is Input,
write_ln('Enter Authors Middle Initial:  '), read(Input), MI is Input,
write_ln('Enter Authors Last Name:  '), read(Input),LN is Input,
write_ln('Enter Publisher Name:  '), read(Input),PUB is Input,
write_ln('Enter Year Published:  '), read(Input),YR is Input, 
book([alist(LN,FN,MI)|t(T,PUB,YR)]),
write_ln('This record was not found').
option(2):- write_ln('Error!'),menu.

% Ask for input then attempt to delete or RETRACT the record
option(3):- 
write_ln('Enter name of book:  '), read(Input),T is Input,
write_ln('Enter Authors First Name:  '), read(Input),FN is Input,
write_ln('Enter Authors Middle Initial:  '), read(Input), MI is Input,
write_ln('Enter Authors Last Name:  '), read(Input),LN is Input,
write_ln('Enter Publisher Name:  '), read(Input),PUB is Input,
write_ln('Enter Year Published:  '), read(Input),YR is Input, 
retract( book([alist(LN,FN,MI)|t(T,PUB,YR)]) ).
option(3):- write_ln('Error!'),menu.

% Halt program -- Option 4.
option(4):- halt.

% When anything other than 1-4 option, go to menu.
option(_):- write_ln('Please only enter options 1-4.'), menu.




