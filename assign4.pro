% Tom Chiapete
% March 23, 2006

% Types of dogs

% Please note that these many types of dogs have different color coats.  
% Assume dominate coat colors and regular sizes.

% Asks questions than outputs the conclusion.

% Yellow lab
it_is_a(yellow_labrador_retriever):-
	it_is(medium_sized),
	has(yellow_color),
	has(long_nose),
	has(origins_in_newfoundland),
	has(pink_nose).

% German Shepard
it_is_a(german_shepard):-
	it_is(large_sized),
	has(tan_and_black_color),
	has(origins_in_germany).

% Sheltie
it_is_a(shetland_sheepdog):-
	it_is(small_sized),
	has(sable_and_white_color),
	has(long_nose),
	has(origins_in_united_kingdom).
   
% Collie
it_is_a(collie):-
	it_is(large_sized),
	has(sable_and_white_color),
	has(origins_in_united_kingdom).
	
% Newfoundland
it_is_a(newfoundland):-
	it_is(very_large_sized),
	has(black_color),
	has(origins_in_newfoundland).
	
% Shih Tzu
it_is_a(shih_tzu):-
	it_is(small_sized),
	has(slight_underbite),
	has(small_noze),
	has(origins_from_china).
	
% Yorkshire Terrier	
it_is_a(yorkshire_terrier):-
	it_is(toy_sized),
	has(gold_and_black_or_gray_color),
	has(origins_from_united_kingdom).
	
% English Bulldog
it_is_a(english_bulldog):-
	it_is(medium_sized),
	has(tan_and_white_color),
	has(flat_faced),
	has(origins_from_united_kingdom).

% Dalmation
it_is_a(dalmation):-
	it_is(medium_sized),
	has(black_spots),
	has(origins_in_croatia).
	
% Samoyed
it_is_a(samoyed):-
	it_is(small_sized),
	has(white_color),
	has(origins_in_russia).
	
% Great Dane
it_is_a(great_dane):-
	it_is(large_sized),
	has(long_legs),
	has(origins_in_germany).
	
% Irish Setter
it_is_a(irish_setter):-
	it_is(large_sized),
	has(red_color),
	has(long_hair),
	has(origins_in_ireland).
	
% Australian Shepard
it_is_a(australian_shepard):-
	it_is(large_sized),
	has(blue_or_red_merle_color),
	has(origins_in_united_states).

% Doberman Pinscher
it_is_a(doberman_pinscher):-
	it_is(large_sized),
	has(black_and_brown_color),
	has(long_nose),
	has(origins_in_germany).
	
% Boxer
it_is_a(boxer):-
	it_is(medium_sized),
	has(short_hair),
	has(brown_and_white_color),
	has(severe_underbite),
	has(origins_in_germany).
	
% Saint Bernard
it_is_a(saint_bernard):-
	it_is(very_large_sized),
	has(brown_and_white_color),
	has(origins_in_switzerland).
	
% Jack Russell Terrier
it_is_a(jack_russell_terrier):-
	it_is(small_sized),
	has(white_color),
	has(black_or_tan_or_tricolor_markings),
	has(origins_in_united_kingdom).
	
% Giant Schnauzer
it_is_a(giant_schnauzer):-
	it_is(large_sized),
	has(black_color),
	has(wiry_outer_coat),
	has(soft_undercoat),
	has(origins_in_germany).
	
% Norwegian Elkhound
it_is_a(norwegian_elkhound):-
	it_is(medium_sized),
	has(silver_and_black_color),
	has(curly_tail),
	has(origins_in_norway).
	
	
% Asking it_is questions
it_is(Y):- f(Y,_).
it_is(Y):-

           write(' Is it '),

           write(Y),nl, read(R),

           positive(R),assert(f(Y,R)).

it_is(Y):-assert(f(Y,_)), fail.

% Asking has questions
has(Y):-f(Y,_).
has(Y):-
           write(' Does it have '),
           write(Y),nl, read(R),
           positive(R),assert(f(Y,R)).

has(Y):- assert(f(Y,_)), fail.

insert_initial_facts:-assert(f(e,e)).

positive(yes).
positive(y).


% Found facts that match.  Write out what was found.
run:- insert_initial_facts,
     it_is_a(Y),
     write(' I think your dog is a '),
     write(Y),retractall(f(_,_)),nl,nl.

% Couldn't find what we were looking for.
run:-      write(' I do not know what type of dog you are looking for '),nl.




