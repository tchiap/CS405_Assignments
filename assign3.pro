% Tom Chiapete
% Feb 23, 2006
% Assignment 3

% Define nodes
node(x,3,2,1).
node(x,3,1,2).
node(x,2,3,1).
node(x,2,1,3).
node(x,1,3,2).
node(x,1,2,3).
node(3,x,2,1).
node(3,x,1,2).
node(3,2,x,1).
node(3,2,1,x).
node(3,1,x,2).
node(3,1,2,x).
node(2,x,3,1).
node(2,x,1,3).
node(2,3,x,1).
node(2,3,1,x).
node(2,1,x,3).
node(2,1,3,x).
node(1,x,3,2).
node(1,x,2,3).
node(1,3,x,2).
node(1,3,2,x).
node(1,2,x,3).
node(1,2,3,x).
% ---------------------------------------------------

% Define the paths
path( node(1,2,3,x) , node(1,2,x,3) ).
path( node(1,2,3,x) , node(1,x,3,2) ).
path( node(x,1,3,2) , node(1,x,3,2) ).
path( node(x,1,3,2) , node(3,1,x,2) ).
path( node(3,1,2,x) , node(3,1,x,2) ).
path( node(3,1,2,x) , node(3,x,2,1) ).
path( node(x,3,2,1) , node(3,x,2,1) ).
path( node(x,3,2,1) , node(2,3,x,1) ).
path( node(2,3,1,x) , node(2,3,x,1) ).
path( node(2,3,1,x) , node(2,x,1,3) ).
path( node(x,2,1,3) , node(2,x,1,3) ).
path( node(x,2,1,3) , node(1,2,x,3) ).

% If path isn't from A to B, check path B to A, because the 
% paths go both ways.
path(A,B) :- path(B,A).

%-------------------------------------------------------------

% Use begin to first call bfs.
begin_path(V) :- bfs(V,node(1,2,3,x), Closed).

%---------------------------------------------------------
% getChildren - as discussed in class
get_children(Node, Children): findall(Child, path(Node,Child);
	path(Child,Node).

% -------------------------------------------------------
% prune - as discussed in class
prune( Children, Open, Closed, NewChildren):-
	checks( Children, Open, Children2),
	checks(Children2, Closed, NewChildren).
	
% -------------------------------------------------------
% checks 
checks([] , L ,[] ) :- !.
checks ( [H|T], L, NC) :- member (H,L),!, checks(T,L,NC).
checks ([H|T],L,[H,R]) :-
	checks(T,L,R).

% ------------------------------------------------------
% BFS initial check
bfs(  node(1,2,3,x) , _ , node(1,2,3,x) ) :- write_ln("Already at goal"),!.
% Recursive BFS
bfs(Start,Closed, node(1,2,3,x) ):- not (member (Node, Closed)), getChildren(Node, Children), 
	prune( Children, X , Closed, 	NewChildren),append(X,NewChildren,NewOpen),Output is Node,  
	write_ln(Output) ,
	bfs(Open,[Node,Closed,node(1,2,3,x)).

	
% --------------------------------------------------------------------------

% Some given information about the flights
flights(boston,nyc,200).
flights(nyc, dallas,1500).
flights(dallas,houston,200).

% To add a few more - rough straight distances using Google Earth
flights(houston,milwaukee,900).
flights(milwaukee,nyc,800).
flights(boston,atlanta,700).
flights(altanta,houston,800).
flights(indianapolis,atlanta,500).
flights(boston,miami,1200).
flights(miami,dallas,1250).
flights(nyc,neworleans,1200).
flights(neworleans,houston,450).
flights(kansascity,dallas,450).
flights(milwaukee,kansascity,600).

% Make the distances the same for each.
flights(A,B) :- flights(B,A).

% ----------------------------------------------------------------------

% Depth first search
% Some definitions
% Note- get_children declared above
dfs([],_,_):-!, fail.
% Above line will fail anyway

dfs([Goal|_],_,houston):-!.
dfs([Node,A], Closed, Goal):- not (member (Node, Closed)), get_children(Node, Children), 
	append(Children, A, NewOpen), 
	Output is Node, write_ln(Output),
	dfs (NewOpen, [Node|Closed], houston).
dfs([_|Open],Closed,houston):- dfs(Open,Closed,houston).	

% --------------------------------------------------------------------
% Use begin to first call dfs.
begin_flight :- dfs(boston,Closed,houston).