speaks(allen, russian).
speaks(bob, english).
speaks(mary, russian).
speaks(mary, english).
talkswith(Person1,Person2) :- speaks(Person1,L),speaks(Person2,L), Person1 \= Person2.

mammal(legs,4).
mammal(legs,2).
mammal(arms,0).
mammal(arms,2).

