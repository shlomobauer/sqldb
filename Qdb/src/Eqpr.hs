module Eqpr where
import Treedef

ptreeEq (StmtList SEmpty stmt) =  ptreeEqStmt stmt

ptreeEq (StmtList a b) = do
 ptreeEq a
 ptreeEqStmt b
 
ptreeEqStmt (SelStmt1 a) =
 do
  return ()

ptreeEqStmt (SelStmt2 a b) = 
 do
  return ()

ptreeEqStmt (SelStmt3 a b c) =
 ptreeEqLogicOp c

ptreeEqLogicOp (AndOp a b) =
 do
  ptreeEqLogicOp a
  ptreeEqLogicOp b

ptreeEqLogicOp (OrOp a b) =
 do
  ptreeEqLogicOp a
  ptreeEqLogicOp b

ptreeEqLogicOp (EqTerm a b) =
 putStrLn(pEqShowDotId(a) ++ "," ++ pEqShowDotId(b))

pEqShowDotId (DotEmpty) = ""
 
pEqShowDotId (DotId a b) =
 let z = pEqShowDotId(a) in
  if z == ""
  then b
  else z ++ "." ++ b
