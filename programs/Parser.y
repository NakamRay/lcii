{
module Parser where
import Lexer
import DataType
}

%name happyParseExp exp
%name happyParseEnv env
%name happyParseTerm term

%tokentype { Token }
%error { parseError }

%token
'('     { LPar }
')'     { RPar }
'.'     { TDot }
','     { TCom }
'λ'     { TLam }
'Λ'     { TLLam }
':'     { TCol }
'->'    { TArrow }
'=>'    { TLArrow }
'+'     { TPlus }
'∀'    { TAll }
'Empty' { Empty }

ID      { ID $$ }
NUM     { Num $$ }
INT     { TINT }
BOOL    { TBOOL }

UNIT    { TUNIT }

'{'     { LBrace }
'}'     { RBrace }

'case'  { TCase }
'<'     { LAngle }
'>'     { RAngle }
'='     { TEqual }
'of'    { TOf }

%nonassoc '(' ID
%nonassoc APP

%%
Start:  exp		{ $1 }

-- exp

exps:   exp             { [$1] }
 |      exp ',' exps    { $1 : $3 }

recExps: ID '=' exp               { [($1, $3)] }
 |       ID '=' exp ',' recExps   { ($1, $3) : $5 }

caseExps: ID '=>' exp               { [($1, $3)] }
 |        ID '=>' exp ',' caseExps  { ($1, $3) : $5 }

inj:    '(' '<' ID '=' exp '>' ':' type ')'  { Inj $3 $5 $8 }

exp:    '(' ')'                       { U }
 |      '(' exp ')'                   { $2 }
 |      ID ':' type                   { C $1 $3 }
 |      ID ':' ID                     { C $1 (TyVar $3) }
 |      ID                            { V $1 }
 |      'λ' ID ':' type '.' exp       { L $2 $4 $6 }
 |      '(' exp ',' exps ')'          { T ($2 : $4) }
 |      exp '.' NUM                   { P $1 $3 }
 |      exp exp %prec APP             { A $1 $2 }
 |      '{' recExps '}'               { R $2 }
 |      exp '.' ID                    { F $1 $3 }
 |      inj                           { $1 }
 |      'case' exp 'of' caseExps      { Case $2 $4 }
 |      'Λ' ID '.' exp                { TyL $2 $4 }
 |      exp type                      { TyA $1 $2 }

-- type

prod:   type            { [$1] }
 |      type ',' prod   { $1 : $3 }

sum:    ID ':' type            { [($1, $3)] }
 |      ID ':' type ',' sum    { ($1, $3) : $5 }

type:   INT               { INT }
 |      BOOL              { BOOL }
 |      ID                { TyVar $1 }
 |      type '->' type    { $1 :=> $3 }
 |      '(' prod ')'      { Prod $2 }
 |      '<' sum '>'       { Var $2 }
 |      '∀' ID '.' type  { Poly $2 $4 }
 |      UNIT              { Unit }

-- type environment

env:    decl            { [$1] }
 |      decl ',' env    { $1 : $3 }
 |      'Empty'         { [] }

decl:   ID ':' type     { ($1,$3) }

-- term

terms:  term             { [$1] }
 |      term ',' terms   { $1 : $3 }

term:   '(' term ')'             { $2 }
 |      ID ':' type              { C $1 $3 }
 |      ID                       { V $1 }
 |      'λ' ID '.' term          { L $2 INT $4 }
 |      '(' term ',' terms ')'   { T ($2 : $4) }
 |      term '.' NUM             { P $1 $3 }
 |      term term %prec APP      { A $1 $2 }

{
parseError :: [Token] -> a
parseError [] = error "Parse error at EOF"
parseError (t:ts) = error $ "Parse error: " ++ show t

parseExp     = happyParseExp . alexScanTokens
parseEnv     = happyParseEnv . alexScanTokens
parseTerm    = happyParseTerm . alexScanTokens
}