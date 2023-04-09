% Tom Chiapete
% Feb 1, 2006
% Assignment #1



% Problem 1
f(X,3):- X < 2 ,!.
f(X,Y):- X >= 5, X =< 9 ,!, Y is X * X.
f(X,Y):- X > 10,!, Y is X * X * X + 4.
f(_,0).



% -----------------------------------------------------------------------------------------




% Problem 2
squares([],[]).
squares([F|R],[X|Y]):- X is F * F, squares(R,Y).




% ----------------------------------------------------------------------------------------

% Problem 3
mymember(E,[E|_]).
mymember(E,[_|T]):- mymember(E,T).

intersect([],_,[]).
intersect([F|R],X,[Y|Z]):- mymember(F,X), Y is F, !, intersect(R,X,Z).
intersect([_|R],X,Z):- intersect(R,X,Z).