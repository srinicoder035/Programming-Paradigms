data Expr = Num Int | Var String | Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr
    deriving(Eq, Ord, Show)

diff x (Num c) = Num 0
diff x (Var y) = if x == y then Num 1 else Num 0
diff x (Add u v) = Add (diff x u) (diff x v)
diff x (Sub u v) = Sub (diff x u) (diff x v)
diff x (Mul u v) = Add (Mul u (diff x v)) (Mul v (diff x u))


-- Converted to prefix notation so as to eliminate the paranthesized notation
formatExpr (Num n) = show n
formatExpr (Var x) = x
formatExpr (Add a b) = "(+)" ++ formatExpr a ++ " " ++ formatExpr b 
formatExpr (Sub a b) = "(-)" ++ formatExpr a ++ " " ++ formatExpr b 
formatExpr (Mul a b) = "(*)" ++ formatExpr a ++ " " ++ formatExpr b 
formatExpr (Div a b) = "(/)" ++ formatExpr a ++ " " ++ formatExpr b 

main = print $ formatExpr $ diff "x" (Add (Mul (Num 2) (Var "x")) (Num 1))