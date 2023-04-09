
mylength([],0).
mylength([_|T],X):- mylength(T,X2), X is X2+1.


zeros([],0).
zeros([0|T],X):- zeros(T,X2), X is X2+1.
zeros([_|T],X):- zeros(T,X).
  
