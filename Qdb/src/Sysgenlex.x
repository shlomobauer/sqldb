
{
module Sysgenlex (Token(..), AlexPosn(..), alexScanTokens, token_posn) where
}

%wrapper "posn"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters
$graphic    = $printable # $white
@string     = $graphic | " "

tokens :-
  $white+				;
  
  "#".*					;

  ";" 		{ tok (\p s -> TSemi p) }
  "." 		{ tok (\p s -> TDot p) }
  "*" 		{ tok (\p s -> TStar p) }
  "=" 		{ tok (\p s -> TEqual p) }
  ","           { tok (\p s -> TComma p) }
  "("           { tok (\p s -> TLParen p) }
  ")"           { tok (\p s -> TRParen p) }

  "select"	{ tok (\p s -> TSelect p) }
  "from"	{ tok (\p s -> TFrom p) }
  "where"	{ tok (\p s -> TWhere p) }
  "and"		{ tok (\p s -> TAnd p) }
  "or"		{ tok (\p s -> TOr p) }

  $digit+			{ tok (\p s -> TIntLiteral p (read s)) }
  $alpha[$alpha $digit \_ \']*	{ tok (\p s -> TIdent p s) }
  
  \" @string* \"	{ tok (\p s -> TStringLiteral p (init (tail s))) }
{
-- Each action has type :: AlexPosn -> String -> Token

-- a "helper" to improve readability
tok f p s = f p s

-- The token type:
data Token =
  TSemi AlexPosn           |
  TDot AlexPosn            |
  TStar AlexPosn           |
  TEqual AlexPosn          |
  TComma AlexPosn          |
  TLParen AlexPosn         |
  TRParen AlexPosn         |
  TSelect AlexPosn         |
  TFrom AlexPosn           |
  TWhere AlexPosn          |
  TAnd AlexPosn            |
  TOr AlexPosn             |
  TIntLiteral AlexPosn Int |
  TIdent AlexPosn String   |
  TStringLiteral AlexPosn String
  deriving (Eq,Show)

token_posn (TSemi p) = p
token_posn (TDot p) = p
token_posn (TStar p) = p
token_posn (TEqual p) = p
token_posn (TComma p) = p
token_posn (TLParen p) = p
token_posn (TRParen p) = p
token_posn (TSelect p) = p
token_posn (TFrom p) = p
token_posn (TWhere p) = p
token_posn (TAnd p) = p
token_posn (TOr p) = p
token_posn (TIntLiteral p _) = p
token_posn (TIdent p _) = p
token_posn (TStringLiteral p _) = p
}
