{
module Sysgenparse where
import Sysgenlex
import Treedef
}

%name sysgenparse
%tokentype { Token }

-- %error { parseError }

%token
  ';'					{ TSemi _ }
  '.'					{ TDot _ }
  '*'					{ TStar _ }
  '='					{ TEqual _ }
  ','                                   { TComma _ }
  '('                                   { TLParen _ }
  ')'                                   { TRParen _ }

  select				{ TSelect _ }
  from  				{ TFrom _ }
  where					{ TWhere _ }
  and					{ TAnd _ }
  or					{ TOr _ }

  intlit				{ TIntLiteral _ $$ }
  ident		                        { TIdent _ $$ }
  strlit				{ TStringLiteral _ $$ }

%right '='
%left and or

%%

stmts   : stmts stmt                    { StmtList $1 $2 }
	| stmt                          { StmtList SEmpty $1 }

stmt	: select '*' from dotids  ';'	{ SelStmt1 $4 }
        | select
           dotids from dotids ';'       { SelStmt2 $2 $4 }
        | select
           dotids from dotids
            where expr ';'              { SelStmt3 $2 $4 $6 }

expr    : expr and expr                 { AndOp $1 $3 }
        | expr or expr                  { OrOp $1 $3 }
        | dotid '=' dotid               { EqTerm $1 $3 }
        | '(' expr ')'                  { $2 }

dotids  : dotids ',' dotid              { DotIdList $1 $3 }
        | dotid                         { DotIdList DEmpty $1 }

dotid   : dotid '.' id                  { DotId $1 $3 }
        | id                            { DotId DotEmpty $1 }

id      : ident                         { $1 }

{

happyError :: [Token] -> a
happyError tks = error ("Parse error at " ++ lcn ++ "\n")
 where
  lcn = case tks of
         [] -> "eof"
         tk:_ -> "line " ++ show l ++ ", column " ++ show c
          where
           AlexPn _ l c = token_posn tk
}
