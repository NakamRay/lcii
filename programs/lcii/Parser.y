{
module Parser where
import Lexer
import DataType
}

%name happyParseExp exp
%name happyParseTypeContext typeContext
%name happyParseEnv env
%name happyParseTerm term

%tokentype { Token }
%error { parseError }

%token
'('     { LPar }
')'     { RPar }
'['     { LSBracket }
']'     { RSBracket }
'{'     { LBrace }
'}'     { RBrace }

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

INT     { TINT }
BOOL    { TBOOL }

UNIT    { TUNIT }

'case'  { TCase }
'<'     { LAngle }
'>'     { RAngle }
'='     { TEqual }
'of'    { TOf }

NUM     { Num $$ }
ID      { ID $$ }
TyID    { TyID $$ }

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
 |      NUM                           { N $1 }
 |      'λ' ID ':' type '.' exp       { L $2 $4 $6 }
 |      '{' exps '}'                  { T $2 }
 |      exp '.' NUM                   { P $1 $3 }
 |      exp exp %prec APP             { A $1 $2 }
 |      '{' recExps '}'               { R $2 }
 |      exp '.' ID                    { F $1 $3 }
 |      inj                           { $1 }
 |      'case' exp 'of' caseExps      { Case $2 $4 }
 |      'Λ' TyID '.' exp              { TyL $2 $4 }
 |      exp type                      { TyA $1 $2 }

-- type

prod:   type            { [$1] }
 |      type ',' prod   { $1 : $3 }

sum:    ID ':' type            { [($1, $3)] }
 |      ID ':' type ',' sum    { ($1, $3) : $5 }

type:   '(' type ')'      { ($2) }
 |      INT               { INT }
 |      BOOL              { BOOL }
 |      TyID              { TyVar $1 }
 |      type '->' type    { $1 :=> $3 }
 |      '{' prod '}'      { Prod $2 }
 |      '{' sum '}'       { Rec $2 }
 |      '<' sum '>'       { Var $2 }
 |      '∀' ID '.' type  { Poly $2 $4 }
 |      UNIT              { Unit }

-- type context

typeContext:
    TyID                  { [$1] }
 |  TyID ',' typeContext  { $1 : $3 }
 |  'Empty'               { [] }

-- term context

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
 |      '{' terms '}'            { T $2 }
 |      term '.' NUM             { P $1 $3 }
 |      term term %prec APP      { A $1 $2 }

{
parseError :: [Token] -> a
parseError [] = error "Parse error at EOF"
parseError (t:ts) = error $ "Parse error: " ++ show t

parseExp         = happyParseExp . alexScanTokens
parseTypeContext = happyParseTypeContext . alexScanTokens
parseEnv         = happyParseEnv . alexScanTokens
parseTerm        = happyParseTerm . alexScanTokens
}
