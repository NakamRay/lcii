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
"=>"            { \pos _ -> TLArrow }
"+"             { \pos _ -> TPlus }
"∀"            { \pos _ -> TAll }

"INT"           { \pos _ -> TINT }
"int"           { \pos _ -> TINT }
"BOOL"          { \pos _ -> TBOOL }
"bool"          { \pos _ -> TBOOL }

"UNIT"          { \pos _ -> TUNIT }
"unit"          { \pos _ -> TUNIT }

"{"             { \pos _ -> LBrace }
"}"             { \pos _ -> RBrace }

"case"          { \pos _ -> TCase }
"<"             { \pos _ -> LAngle }
">"             { \pos _ -> RAngle }
"="             { \pos _ -> TEqual }
"of"            { \pos _ -> TOf }

"Empty"         { \pos _ -> Empty }

[\λ \\]         { \pos _ -> TLam }
[\Λ \&]         { \pos _ -> TLLam }
[$lower \_ \- \%] [$alpha $digit \_ \^ \' \* ! \% \/]* 	{ \pos s -> ID s }

{
data Token = LPar | RPar | Empty | TPlus | TLLam
     | TINT | TBOOL | TUNIT | LBrace | RBrace | TAll
     | TLam | TDot | TCom | TCol | TArrow | TLArrow
     | TCase | LAngle | RAngle | TEqual | TOf
     | ID String | Num Int
     deriving (Show,Eq)

prettyAlexPosn (AlexPn _ line col) = 
  "at line " ++ show line ++ ", col " ++ show col
}