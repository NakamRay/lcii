{
module Lexer where
}

%wrapper "posn"
$digit = [0-9]
$alpha = [a-zA-Z]
$lower = [a-z]
$upper = [A-Z]
$newline = [\n\r]

tokens :-

$white+			;
$digit+         { \pos s -> Num (read s) }

"("             { \pos _ -> LPar }
")"             { \pos _ -> RPar }
"."             { \pos _ -> TDot }
","             { \pos _ -> TCom }
":"             { \pos _ -> TCol }
"->"            { \pos _ -> TArrow }

"INT"           { \pos _ -> TINT }
"int"           { \pos _ -> TINT }
"BOOL"          { \pos _ -> TBOOL }
"bool"          { \pos _ -> TBOOL }
"UNIT"          { \pos _ -> TUNIT }
"unit"          { \pos _ -> TUNIT }

"Empty"         { \pos _ -> Empty }

[\& \λ \\]         { \pos _ -> TLam }
[$lower \_ \- \%] [$alpha $digit \_ \^ \' \- \* \+ ! \% \/]* 	{ \pos s -> ID s }

{
data Token = LPar | RPar | Empty
     | TINT | TBOOL | TUNIT
     | TLam | TDot | TCom | TCol | TArrow
     | ID String | Num Int
     deriving (Show,Eq)

prettyAlexPosn (AlexPn _ line col) = 
  "at line " ++ show line ++ ", col " ++ show col
}