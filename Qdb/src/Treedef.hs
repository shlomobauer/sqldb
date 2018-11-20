module Treedef where

data StmtList
 = StmtList StmtList Stmt
 | SEmpty
 deriving (Show, Eq)

data Stmt
 = SelStmt1 DotIdList
 | SelStmt2 DotIdList DotIdList
 | SelStmt3 DotIdList DotIdList LogicOp
 deriving (Show, Eq)

data DotId
 = DotId DotId String
 | DotEmpty
 deriving (Show, Eq)

data DotIdList
 = DotIdList DotIdList DotId
 | DEmpty
 deriving (Show, Eq)

data LogicOp
 = AndOp LogicOp LogicOp
 | OrOp LogicOp LogicOp
 | EqTerm DotId DotId
 deriving (Show, Eq)
