places([place(_,0), place(_,1), place(_,2), place(_,3), place(_,4), place(_,5), place(_,6), place(_,7)]).
married(mrAstor, mrsAstor).
married(mrBlake, mrsBlake).
married(mrCrane, mrsCrane).
married(mrDavis, mrsDavis).
married(mrsAstor, mrAstor).
married(mrsBlake, mrBlake).
married(mrsCrane, mrCrane).
married(mrsDavis, mrDavis).
male(mrAstor).
male(mrBlake).
male(mrCrane).
male(mrDavis).
dinner(Y) :- places(Places),
member(place(mrAstor, A), Places),
member(place(mrsAstor, MA), Places),
member(place(mrBlake, B), Places), B is ((MA + 1) mod 8),
member(place(mrsBlake, MB), Places),
member(place(mrCrane, C), Places),
member(place(mrsCrane, MC), Places), MC is ((B + 4) mod 8),
member(place(mrDavis, D), Places),
member(place(mrsDavis, MD), Places), MD is 0,



member(place(I, 0), Places),
member(place(J, 1), Places),
member(place(K, 2), Places),
member(place(L, 3), Places),
member(place(M, 4), Places),
member(place(N, 5), Places),
member(place(O, 6), Places),
member(place(P, 7), Places),
married(P,J),
not(married(I, K)),
not(married(J, L)),
not(married(K, M)),
not(married(L, N)),
not(married(M, O)),
not(married(N, P)),
not(married(O, I)),
member(place(Y, Z), Places),
member(place(Zq, Q), Places), Q is (Z+1) mod 8,
member(place(Zr, R), Places), R is (Z+2) mod 8,
member(place(Zs, S), Places), S is (Z+3) mod 8,
member(place(Zt, T), Places), T is (Z+4) mod 8,
member(place(Zu, U), Places), U is (Z+5) mod 8,
member(place(Zv, V), Places), V is (Z+6) mod 8,
member(place(Zw, W), Places), W is (Z+7) mod 8,
betweenMen(Zq, Zw),
not(betweenMen(Zq, Zs)),
not(betweenMen(Zr, Zt)),
not(betweenMen(Zs, Zu)),
not(betweenMen(Zt, Zv)),
not(betweenMen(Zu, Zw)),
not(betweenMen(Zv, Y)),
not(betweenMen(Y, Zr)),
print_places(Places).


betweenMen(X, Y) :- male(X), male(Y).
not(X) :- \+X.
print_places([]).
print_places([A | B]) :- write(A), nl,
print_places(B).