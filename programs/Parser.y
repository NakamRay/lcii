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
':'     { TCol }
'->'    { TArrow }
'+'     { TPlus }
'Empty' { Empty }

ID      { ID $$ }
NUM     { Num $$ }
INT     { TINT }
BOOL    { TBOOL }

UNIT    { TUNIT }

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

inj:    '(' '<' NUM '=' exp '>' ':' type ')'  { Inj $3 $5 $8 }

exp:    '(' ')'                       { U }
 |      '(' exp ')'                   { $2 }
 |      ID ':' type                   { C $1 $3 }
 |      ID                            { V $1 }
 |      'λ' ID ':' type '.' exp       { L $2 $4 $6 }
 |      '(' exp ',' exps ')'          { T ($2 : $4) }
 |      exp '.' NUM                   { P $1 $3 }
 |      exp exp %prec APP             { A $1 $2 }
 |      'case' inj 'of' exps          { Case $2 $4 }

-- type

prod:   type            { [$1] }
 |      type ',' prod   { $1 : $3 }

sum:    type            { [$1] }
 |      type '+' sum    { $1 : $3 }

type:   INT             { INT }
 |      BOOL            { BOOL }
 |      type '->' type  { $1 :=> $3 }
 |      '(' prod ')'    { Prod $2 }
 |      '(' sum ')'     { Variant $2 }
 |      UNIT            { Unit }

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