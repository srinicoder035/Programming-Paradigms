puzzle(Name) :-

    L = [[mason, Pos1, Blond1, Handsome1, UnScared1],
         [alex,  Pos2, Blond2, Handsome2, UnScared2],
         [steve, Pos3, Blond3, Handsome3, UnScared3],
         [simon, Pos4, Blond4, Handsome4, UnScared4]
        ],

   permutation([1,2,3,4], [Pos1,Pos2,Pos3,Pos4]),
   maplist(yn,
       [Blond1, Handsome1, UnScared1,
        Blond2, Handsome2, UnScared2,
        Blond3, Handsome3, UnScared3,
        Blond4, Handsome4, UnScared4
       ]),
       
   yn(y).
   yn(n).
       
   member([mason, I1, _,_,_], L),
   member([_,     I2, n,_,_], L),
   member([_,     I3, n,_,_], L),

   (I2>I1, I3>I1 ; I2<I1, I3<I1),
   
   member([alex,  I1, _,_], L),
   member([_,     I2, y,_], L),
   
   (I2>I1; I2<I1)
   
   member([mason,  I1, y,_], L),
   member([alex,   I2, y,_], L),
   member([simon,  I3, y,_], L),
   
   (I2>I1, I3>I1 ; I2<I1, I3<I1),
   
    member([Name,  _, y, y, y], L).
