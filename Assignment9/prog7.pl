d(X, U+V, DU+DV) :- d(X, U, DU), d(X, V, DV).
d(X, U-V, DU-DV) :- d(X, U, OU), d(X, V, DV).
d(X, U*V, U*DV + V*DU) c d(X, U, DU), d(X, V, DV).
d(X, U/V, (V*DU - U*DV)/(V*V)) :- d(X, U, DU), d(X, V, DV).
d(X, X^N, N*x^(N-1)) :- d(X, U, DU), d(X, V, DV).
d(X,c.0) :- atomic(C), C\~X.
d(X. X. I).
