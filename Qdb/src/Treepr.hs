module Treepr where
import Treedef

-- pretty print stmt list
ptreeStmtList (StmtList SEmpty stmt) = ptreeStmt stmt

ptreeStmtList (StmtList a b) = do
 ptreeStmtList a
 ptreeStmt b
 
-- pretty print stmt
ptreeStmt (SelStmt1 a) =
 do
  putStrLn ("select" ++ " * from " ++ (pShowDotList a) ++ ";")

ptreeStmt (SelStmt2 a b) = 
 do
  putStrLn ("select" ++ " " ++
   (pShowDotList a) ++ " " ++ "from " ++ (pShowDotList b) ++ ";")

ptreeStmt (SelStmt3 a b c) = 
 do
  putStrLn ("select" ++ " " ++
   (pShowDotList a) ++ " " ++ "from " ++ (pShowDotList b) ++
    " where " ++ (ptreeLogicOp c) ++ ";")

ptreeLogicOp (AndOp a b) =
 "(" ++ ptreeLogicOp(a) ++ " and " ++ ptreeLogicOp(b) ++ ")"

ptreeLogicOp (OrOp a b) =
 "(" ++ ptreeLogicOp(a) ++ " or " ++ ptreeLogicOp(b) ++ ")"

ptreeLogicOp (EqTerm a b) =
 pShowDotId(a) ++ " = " ++ pShowDotId(b)

pShowDotList (DotIdList DEmpty a) = 
 pShowDotId a

pShowDotList (DotIdList a b) =
 pShowDotList(a) ++ "," ++ pShowDotId(b)

pShowDotId (DotEmpty) = ""
 
pShowDotId (DotId a b) =
 let z = pShowDotId(a) in
  if z == ""
  then b
  else z ++ "." ++ b
  
-- spaces for formatting
spaces i = let space = " " ++ space in take i space
