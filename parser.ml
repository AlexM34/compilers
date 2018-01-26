type token =
  | IDENT of (Dict.ident)
  | MULOP of (Optree.op)
  | ADDOP of (Optree.op)
  | RELOP of (Optree.op)
  | NUMBER of (int)
  | CHAR of (char)
  | STRING of (Optree.symbol * int)
  | SEMI
  | DOT
  | COLON
  | LPAR
  | RPAR
  | COMMA
  | SUB
  | BUS
  | EQUAL
  | MINUS
  | ASSIGN
  | VBAR
  | ARROW
  | BADTOK
  | IMPOSSIBLE
  | ARRAY
  | BEGIN
  | CONST
  | DO
  | ELSE
  | END
  | IF
  | OF
  | PROC
  | RECORD
  | RETURN
  | THEN
  | TO
  | TYPE
  | VAR
  | WHILE
  | NOT
  | POINTER
  | NIL
  | REPEAT
  | UNTIL
  | FOR
  | ELSIF
  | CASE
  | STEP

open Parsing;;
let _ = parse_error;;
# 5 "parser.mly"
open Optree
open Dict
open Tree
# 31 "parser.mly"
let const n t = makeExpr (Constant (n, t))
# 59 "parser.ml"
let yytransl_const = [|
  264 (* SEMI *);
  265 (* DOT *);
  266 (* COLON *);
  267 (* LPAR *);
  268 (* RPAR *);
  269 (* COMMA *);
  270 (* SUB *);
  271 (* BUS *);
  272 (* EQUAL *);
  273 (* MINUS *);
  274 (* ASSIGN *);
  275 (* VBAR *);
  276 (* ARROW *);
  277 (* BADTOK *);
  278 (* IMPOSSIBLE *);
  279 (* ARRAY *);
  280 (* BEGIN *);
  281 (* CONST *);
  282 (* DO *);
  283 (* ELSE *);
  284 (* END *);
  285 (* IF *);
  286 (* OF *);
  287 (* PROC *);
  288 (* RECORD *);
  289 (* RETURN *);
  290 (* THEN *);
  291 (* TO *);
  292 (* TYPE *);
  293 (* VAR *);
  294 (* WHILE *);
  295 (* NOT *);
  296 (* POINTER *);
  297 (* NIL *);
  298 (* REPEAT *);
  299 (* UNTIL *);
  300 (* FOR *);
  301 (* ELSIF *);
  302 (* CASE *);
  303 (* STEP *);
    0|]

let yytransl_block = [|
  257 (* IDENT *);
  258 (* MULOP *);
  259 (* ADDOP *);
  260 (* RELOP *);
  261 (* NUMBER *);
  262 (* CHAR *);
  263 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\005\000\005\000\005\000\005\000\
\006\000\006\000\010\000\009\000\009\000\012\000\007\000\007\000\
\014\000\008\000\016\000\018\000\018\000\020\000\020\000\021\000\
\021\000\021\000\019\000\019\000\004\000\022\000\022\000\023\000\
\023\000\024\000\025\000\025\000\025\000\025\000\025\000\025\000\
\025\000\025\000\025\000\029\000\029\000\029\000\030\000\033\000\
\033\000\034\000\034\000\034\000\034\000\031\000\031\000\035\000\
\032\000\032\000\015\000\015\000\028\000\028\000\011\000\011\000\
\011\000\036\000\036\000\036\000\037\000\037\000\038\000\038\000\
\038\000\038\000\038\000\038\000\038\000\038\000\038\000\027\000\
\027\000\039\000\039\000\026\000\026\000\026\000\026\000\013\000\
\013\000\013\000\013\000\040\000\040\000\041\000\042\000\042\000\
\017\000\000\000"

let yylen = "\002\000\
\002\000\004\000\000\000\002\000\002\000\002\000\001\000\002\000\
\001\000\002\000\004\000\001\000\002\000\004\000\001\000\002\000\
\004\000\004\000\004\000\002\000\003\000\001\000\003\000\003\000\
\004\000\001\000\000\000\002\000\001\000\001\000\003\000\002\000\
\001\000\000\000\000\000\003\000\002\000\002\000\006\000\005\000\
\004\000\003\000\006\000\000\000\002\000\006\000\005\000\001\000\
\003\000\003\000\005\000\003\000\001\000\001\000\003\000\003\000\
\000\000\002\000\001\000\003\000\000\000\001\000\001\000\003\000\
\003\000\001\000\003\000\003\000\001\000\003\000\001\000\001\000\
\001\000\001\000\001\000\002\000\002\000\002\000\003\000\002\000\
\003\000\001\000\003\000\001\000\004\000\003\000\002\000\001\000\
\004\000\003\000\003\000\002\000\003\000\003\000\001\000\000\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\098\000\000\000\
\000\000\000\000\007\000\000\000\000\000\005\000\000\000\097\000\
\000\000\000\000\008\000\000\000\000\000\006\000\000\000\000\000\
\001\000\000\000\004\000\000\000\000\000\010\000\000\000\000\000\
\000\000\013\000\000\000\016\000\000\000\033\000\000\000\029\000\
\000\000\000\000\000\000\072\000\074\000\073\000\000\000\000\000\
\000\000\075\000\000\000\000\000\000\000\000\000\000\000\069\000\
\020\000\000\000\000\000\026\000\000\000\000\000\000\000\019\000\
\000\000\000\000\000\000\000\000\088\000\060\000\000\000\002\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\032\000\000\000\000\000\018\000\000\000\078\000\077\000\000\000\
\011\000\000\000\000\000\076\000\000\000\000\000\087\000\000\000\
\000\000\000\000\000\000\000\000\021\000\000\000\028\000\000\000\
\000\000\000\000\000\000\000\000\014\000\017\000\031\000\000\000\
\000\000\038\000\000\000\000\000\000\000\000\000\037\000\000\000\
\000\000\079\000\000\000\000\000\080\000\000\000\000\000\086\000\
\000\000\000\000\000\000\070\000\000\000\024\000\023\000\000\000\
\000\000\090\000\000\000\092\000\091\000\000\000\000\000\000\000\
\000\000\000\000\000\000\042\000\000\000\081\000\085\000\025\000\
\089\000\094\000\093\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\083\000\000\000\034\000\000\000\
\040\000\000\000\000\000\000\000\047\000\000\000\000\000\000\000\
\000\000\000\000\045\000\000\000\039\000\000\000\000\000\000\000\
\049\000\056\000\058\000\043\000\055\000\000\000\000\000\000\000\
\000\000\000\000\046\000"

let yydgoto = "\002\000\
\007\000\008\000\009\000\039\000\010\000\014\000\022\000\011\000\
\019\000\015\000\126\000\020\000\068\000\023\000\024\000\012\000\
\052\000\032\000\064\000\061\000\062\000\040\000\041\000\042\000\
\081\000\053\000\092\000\114\000\168\000\083\000\163\000\177\000\
\160\000\161\000\164\000\054\000\055\000\056\000\127\000\106\000\
\107\000\140\000"

let yysindex = "\007\000\
\225\255\000\000\058\255\079\255\097\255\105\255\000\000\005\255\
\099\255\225\255\000\000\124\255\112\255\000\000\058\255\000\000\
\133\255\150\255\000\000\097\255\155\255\000\000\105\255\173\255\
\000\000\154\255\000\000\225\255\246\000\000\000\001\255\185\255\
\026\255\000\000\105\255\000\000\026\255\000\000\169\255\000\000\
\204\255\093\255\207\255\000\000\000\000\000\000\246\000\246\000\
\246\000\000\000\165\255\208\255\078\000\040\255\219\255\000\000\
\000\000\105\255\216\255\000\000\217\255\236\255\026\255\000\000\
\246\000\105\255\239\255\252\255\000\000\000\000\009\000\000\000\
\154\255\246\000\246\000\246\000\154\255\079\255\246\000\208\255\
\000\000\166\255\154\255\000\000\012\255\000\000\000\000\246\000\
\000\000\246\000\014\255\000\000\079\255\246\000\000\000\246\000\
\246\000\246\000\011\000\026\255\000\000\011\255\000\000\063\255\
\012\000\001\000\017\000\026\255\000\000\000\000\000\000\104\255\
\019\255\000\000\057\255\243\255\013\000\120\255\000\000\246\000\
\005\000\000\000\040\255\040\255\000\000\197\255\030\000\000\000\
\048\255\219\255\219\255\000\000\026\255\000\000\000\000\026\255\
\026\255\000\000\105\255\000\000\000\000\154\255\154\255\246\000\
\246\000\246\000\019\255\000\000\246\000\000\000\000\000\000\000\
\000\000\000\000\000\000\251\254\021\000\019\255\161\255\019\000\
\039\000\003\000\027\000\036\000\000\000\154\255\000\000\035\000\
\000\000\246\000\246\000\246\000\000\000\246\000\154\255\154\255\
\040\000\246\000\000\000\246\000\000\000\019\255\019\255\013\255\
\000\000\000\000\000\000\000\000\000\000\151\255\246\000\154\255\
\019\255\251\254\000\000"

let yyrindex = "\000\000\
\043\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\043\000\000\000\000\000\000\000\000\000\235\000\000\000\
\000\000\000\000\000\000\237\000\071\000\000\000\245\000\000\000\
\000\000\226\255\000\000\043\000\000\000\000\000\000\000\117\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\195\255\076\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\144\255\190\255\139\000\031\000\000\000\
\000\000\000\000\000\000\000\000\000\000\073\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\043\255\000\000\045\000\000\000\250\255\000\000\000\000\042\000\
\000\000\000\000\226\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\063\000\000\000\000\000\000\000\000\000\000\000\
\081\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\175\000\211\000\000\000\084\000\000\000\000\000\
\000\000\067\000\103\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\075\000\000\000\000\000\203\255\226\255\000\000\
\000\000\000\000\117\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\076\000\000\000\153\000\083\255\000\000\
\091\000\000\000\093\000\215\255\000\000\226\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\238\255\226\255\
\000\000\000\000\000\000\000\000\000\000\086\255\087\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\203\255\
\114\255\076\000\000\000"

let yygindex = "\000\000\
\000\000\071\001\113\001\182\255\000\000\112\001\105\001\000\000\
\114\001\000\000\227\255\000\000\230\255\000\000\231\255\232\255\
\253\255\000\000\000\000\030\001\000\000\062\001\000\000\228\000\
\000\000\098\001\073\001\000\000\204\000\000\000\234\000\000\000\
\239\000\000\000\000\000\100\000\156\000\212\255\010\001\024\001\
\000\000\000\000"

let yytablesize = 543
let yytable = "\051\000\
\017\000\021\000\116\000\086\000\087\000\059\000\060\000\001\000\
\121\000\070\000\071\000\021\000\057\000\025\000\016\000\088\000\
\088\000\085\000\044\000\045\000\046\000\166\000\088\000\122\000\
\047\000\125\000\016\000\090\000\090\000\069\000\048\000\004\000\
\099\000\069\000\090\000\104\000\103\000\058\000\080\000\167\000\
\105\000\004\000\096\000\034\000\112\000\113\000\115\000\058\000\
\065\000\118\000\034\000\088\000\049\000\132\000\050\000\191\000\
\097\000\066\000\013\000\069\000\088\000\034\000\151\000\090\000\
\129\000\067\000\088\000\156\000\157\000\034\000\034\000\034\000\
\090\000\134\000\117\000\034\000\059\000\060\000\090\000\016\000\
\034\000\141\000\143\000\035\000\034\000\034\000\034\000\034\000\
\034\000\128\000\147\000\179\000\136\000\016\000\035\000\053\000\
\069\000\018\000\050\000\052\000\186\000\187\000\035\000\035\000\
\069\000\021\000\152\000\088\000\053\000\153\000\154\000\050\000\
\052\000\105\000\158\000\159\000\162\000\194\000\035\000\090\000\
\035\000\074\000\026\000\088\000\027\000\075\000\051\000\029\000\
\027\000\069\000\076\000\028\000\069\000\069\000\077\000\090\000\
\078\000\142\000\079\000\051\000\182\000\183\000\184\000\031\000\
\159\000\084\000\084\000\084\000\162\000\146\000\190\000\084\000\
\084\000\084\000\088\000\084\000\084\000\084\000\084\000\084\000\
\084\000\193\000\084\000\084\000\088\000\033\000\090\000\035\000\
\088\000\084\000\084\000\084\000\089\000\084\000\093\000\038\000\
\090\000\084\000\084\000\094\000\090\000\084\000\037\000\120\000\
\192\000\095\000\084\000\123\000\084\000\124\000\084\000\071\000\
\071\000\071\000\063\000\170\000\072\000\071\000\171\000\071\000\
\088\000\071\000\071\000\034\000\071\000\071\000\071\000\172\000\
\071\000\149\000\034\000\073\000\090\000\030\000\084\000\071\000\
\071\000\071\000\091\000\071\000\098\000\030\000\030\000\071\000\
\071\000\100\000\034\000\071\000\101\000\034\000\034\000\034\000\
\071\000\034\000\071\000\034\000\071\000\030\000\034\000\030\000\
\034\000\054\000\054\000\102\000\034\000\034\000\034\000\034\000\
\034\000\003\000\034\000\130\000\131\000\034\000\034\000\004\000\
\034\000\034\000\034\000\109\000\005\000\006\000\088\000\034\000\
\034\000\034\000\034\000\034\000\175\000\034\000\034\000\034\000\
\110\000\108\000\090\000\034\000\133\000\137\000\034\000\034\000\
\139\000\034\000\034\000\034\000\138\000\144\000\145\000\034\000\
\148\000\066\000\066\000\034\000\034\000\034\000\066\000\034\000\
\066\000\150\000\066\000\066\000\173\000\066\000\066\000\066\000\
\169\000\066\000\084\000\174\000\061\000\176\000\178\000\084\000\
\066\000\066\000\066\000\084\000\066\000\084\000\181\000\061\000\
\066\000\066\000\003\000\188\000\066\000\067\000\067\000\061\000\
\061\000\066\000\067\000\066\000\067\000\066\000\067\000\067\000\
\059\000\067\000\067\000\067\000\022\000\067\000\093\000\061\000\
\062\000\061\000\096\000\094\000\067\000\067\000\067\000\082\000\
\067\000\095\000\043\000\062\000\067\000\067\000\095\000\044\000\
\067\000\068\000\068\000\062\000\062\000\067\000\068\000\067\000\
\068\000\067\000\068\000\068\000\048\000\068\000\068\000\068\000\
\057\000\068\000\027\000\062\000\036\000\062\000\030\000\036\000\
\068\000\068\000\068\000\135\000\068\000\034\000\111\000\036\000\
\068\000\068\000\180\000\082\000\068\000\195\000\063\000\036\000\
\036\000\068\000\063\000\068\000\063\000\068\000\063\000\063\000\
\119\000\063\000\063\000\189\000\185\000\063\000\165\000\036\000\
\041\000\036\000\155\000\000\000\063\000\063\000\063\000\000\000\
\063\000\000\000\000\000\041\000\063\000\063\000\000\000\000\000\
\063\000\000\000\064\000\041\000\041\000\063\000\064\000\063\000\
\064\000\063\000\064\000\064\000\000\000\064\000\064\000\000\000\
\000\000\064\000\000\000\041\000\000\000\041\000\000\000\000\000\
\064\000\064\000\064\000\000\000\064\000\000\000\000\000\000\000\
\064\000\064\000\000\000\000\000\064\000\000\000\065\000\000\000\
\000\000\064\000\065\000\064\000\065\000\064\000\065\000\065\000\
\000\000\065\000\065\000\000\000\000\000\065\000\000\000\000\000\
\000\000\000\000\000\000\000\000\065\000\065\000\065\000\000\000\
\065\000\000\000\000\000\000\000\065\000\065\000\016\000\000\000\
\065\000\000\000\044\000\045\000\046\000\065\000\000\000\065\000\
\047\000\065\000\009\000\009\000\012\000\012\000\048\000\000\000\
\000\000\009\000\000\000\012\000\015\000\015\000\009\000\009\000\
\012\000\012\000\000\000\015\000\000\000\000\000\000\000\000\000\
\015\000\015\000\000\000\000\000\049\000\000\000\050\000"

let yycheck = "\029\000\
\004\000\001\001\077\000\048\000\049\000\031\000\031\000\001\000\
\083\000\035\000\037\000\001\001\012\001\009\001\001\001\004\001\
\004\001\047\000\005\001\006\001\007\001\027\001\004\001\012\001\
\011\001\012\001\001\001\016\001\016\001\033\000\017\001\031\001\
\058\000\037\000\016\001\065\000\063\000\037\001\042\000\045\001\
\066\000\031\001\003\001\001\001\074\000\075\000\076\000\037\001\
\023\001\079\000\008\001\004\001\039\001\098\000\041\001\043\001\
\017\001\032\001\001\001\063\000\004\001\019\001\015\001\016\001\
\094\000\040\001\004\001\142\000\143\000\027\001\028\001\029\001\
\016\001\100\000\078\000\033\001\102\000\102\000\016\001\001\001\
\038\001\108\000\026\001\008\001\042\001\043\001\044\001\045\001\
\046\001\093\000\120\000\166\000\030\001\001\001\019\001\013\001\
\100\000\001\001\013\001\013\001\175\000\176\000\027\001\028\001\
\108\000\001\001\133\000\004\001\026\001\136\000\137\000\026\001\
\026\001\139\000\144\000\145\000\146\000\192\000\043\001\016\001\
\045\001\029\001\024\001\004\001\008\001\033\001\013\001\016\001\
\012\001\133\000\038\001\008\001\136\000\137\000\042\001\016\001\
\044\001\034\001\046\001\026\001\170\000\171\000\172\000\011\001\
\174\000\002\001\003\001\004\001\178\000\030\001\180\000\008\001\
\009\001\010\001\004\001\012\001\013\001\014\001\015\001\016\001\
\017\001\191\000\019\001\020\001\004\001\016\001\016\001\013\001\
\004\001\026\001\027\001\028\001\008\001\030\001\009\001\022\001\
\016\001\034\001\035\001\014\001\016\001\038\001\010\001\018\001\
\034\001\020\001\043\001\088\000\045\001\090\000\047\001\002\001\
\003\001\004\001\010\001\035\001\028\001\008\001\038\001\010\001\
\004\001\012\001\013\001\001\001\015\001\016\001\017\001\047\001\
\019\001\013\001\008\001\008\001\016\001\019\001\008\001\026\001\
\027\001\028\001\011\001\030\001\002\001\027\001\028\001\034\001\
\035\001\010\001\001\001\038\001\012\001\027\001\028\001\029\001\
\043\001\008\001\045\001\033\001\047\001\043\001\001\001\045\001\
\038\001\027\001\028\001\008\001\042\001\008\001\044\001\045\001\
\046\001\025\001\001\001\096\000\097\000\028\001\029\001\031\001\
\019\001\008\001\033\001\008\001\036\001\037\001\004\001\038\001\
\027\001\028\001\029\001\042\001\010\001\044\001\033\001\046\001\
\008\001\035\001\016\001\038\001\010\001\010\001\029\001\042\001\
\008\001\044\001\033\001\046\001\028\001\043\001\018\001\038\001\
\028\001\003\001\004\001\042\001\043\001\044\001\008\001\046\001\
\010\001\012\001\012\001\013\001\026\001\015\001\016\001\017\001\
\028\001\019\001\009\001\013\001\008\001\027\001\019\001\014\001\
\026\001\027\001\028\001\018\001\030\001\020\001\028\001\019\001\
\034\001\035\001\024\001\028\001\038\001\003\001\004\001\027\001\
\028\001\043\001\008\001\045\001\010\001\047\001\012\001\013\001\
\010\001\015\001\016\001\017\001\012\001\019\001\009\001\043\001\
\008\001\045\001\028\001\014\001\026\001\027\001\028\001\012\001\
\030\001\020\001\028\000\019\001\034\001\035\001\028\001\028\001\
\038\001\003\001\004\001\027\001\028\001\043\001\008\001\045\001\
\010\001\047\001\012\001\013\001\026\001\015\001\016\001\017\001\
\028\001\019\001\010\000\043\001\008\001\045\001\015\000\023\000\
\026\001\027\001\028\001\102\000\030\001\020\000\073\000\019\001\
\034\001\035\001\167\000\042\000\038\001\194\000\004\001\027\001\
\028\001\043\001\008\001\045\001\010\001\047\001\012\001\013\001\
\080\000\015\001\016\001\178\000\174\000\019\001\149\000\043\001\
\008\001\045\001\139\000\255\255\026\001\027\001\028\001\255\255\
\030\001\255\255\255\255\019\001\034\001\035\001\255\255\255\255\
\038\001\255\255\004\001\027\001\028\001\043\001\008\001\045\001\
\010\001\047\001\012\001\013\001\255\255\015\001\016\001\255\255\
\255\255\019\001\255\255\043\001\255\255\045\001\255\255\255\255\
\026\001\027\001\028\001\255\255\030\001\255\255\255\255\255\255\
\034\001\035\001\255\255\255\255\038\001\255\255\004\001\255\255\
\255\255\043\001\008\001\045\001\010\001\047\001\012\001\013\001\
\255\255\015\001\016\001\255\255\255\255\019\001\255\255\255\255\
\255\255\255\255\255\255\255\255\026\001\027\001\028\001\255\255\
\030\001\255\255\255\255\255\255\034\001\035\001\001\001\255\255\
\038\001\255\255\005\001\006\001\007\001\043\001\255\255\045\001\
\011\001\047\001\024\001\025\001\024\001\025\001\017\001\255\255\
\255\255\031\001\255\255\031\001\024\001\025\001\036\001\037\001\
\036\001\037\001\255\255\031\001\255\255\255\255\255\255\255\255\
\036\001\037\001\255\255\255\255\039\001\255\255\041\001"

let yynames_const = "\
  SEMI\000\
  DOT\000\
  COLON\000\
  LPAR\000\
  RPAR\000\
  COMMA\000\
  SUB\000\
  BUS\000\
  EQUAL\000\
  MINUS\000\
  ASSIGN\000\
  VBAR\000\
  ARROW\000\
  BADTOK\000\
  IMPOSSIBLE\000\
  ARRAY\000\
  BEGIN\000\
  CONST\000\
  DO\000\
  ELSE\000\
  END\000\
  IF\000\
  OF\000\
  PROC\000\
  RECORD\000\
  RETURN\000\
  THEN\000\
  TO\000\
  TYPE\000\
  VAR\000\
  WHILE\000\
  NOT\000\
  POINTER\000\
  NIL\000\
  REPEAT\000\
  UNTIL\000\
  FOR\000\
  ELSIF\000\
  CASE\000\
  STEP\000\
  "

let yynames_block = "\
  IDENT\000\
  MULOP\000\
  ADDOP\000\
  RELOP\000\
  NUMBER\000\
  CHAR\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'block) in
    Obj.repr(
# 37 "parser.mly"
                                        ( Prog (_1, ref []) )
# 441 "parser.ml"
               : Tree.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'decl_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 40 "parser.mly"
                                        ( makeBlock (_1, _3) )
# 449 "parser.ml"
               : 'block))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parser.mly"
                                        ( [] )
# 455 "parser.ml"
               : 'decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decl_list) in
    Obj.repr(
# 44 "parser.mly"
                                        ( _1 @ _2 )
# 463 "parser.ml"
               : 'decl_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'const_decls) in
    Obj.repr(
# 47 "parser.mly"
                                        ( _2 )
# 470 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decls) in
    Obj.repr(
# 48 "parser.mly"
                                        ( _2 )
# 477 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'proc_decl) in
    Obj.repr(
# 49 "parser.mly"
                                        ( [_1] )
# 484 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'type_decls) in
    Obj.repr(
# 50 "parser.mly"
                                        ( [TypeDecl _2] )
# 491 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'const_decl) in
    Obj.repr(
# 53 "parser.mly"
                                        ( [_1] )
# 498 "parser.ml"
               : 'const_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'const_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'const_decls) in
    Obj.repr(
# 54 "parser.mly"
                                        ( _1 :: _2 )
# 506 "parser.ml"
               : 'const_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Dict.ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 57 "parser.mly"
                                        ( ConstDecl (_1, _3) )
# 514 "parser.ml"
               : 'const_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'type_decl) in
    Obj.repr(
# 60 "parser.mly"
                                        ( [_1] )
# 521 "parser.ml"
               : 'type_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'type_decls) in
    Obj.repr(
# 61 "parser.mly"
                                        ( _1 :: _2 )
# 529 "parser.ml"
               : 'type_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Dict.ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typexpr) in
    Obj.repr(
# 64 "parser.mly"
                                        ( (_1, _3) )
# 537 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 67 "parser.mly"
                                        ( [_1] )
# 544 "parser.ml"
               : 'var_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decls) in
    Obj.repr(
# 68 "parser.mly"
                                        ( _1 :: _2 )
# 552 "parser.ml"
               : 'var_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'ident_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typexpr) in
    Obj.repr(
# 71 "parser.mly"
                                        ( VarDecl (VarDef, _1, _3) )
# 560 "parser.ml"
               : 'var_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'proc_heading) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'block) in
    Obj.repr(
# 74 "parser.mly"
                                        ( ProcDecl (_1, _3) )
# 568 "parser.ml"
               : 'proc_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'name) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'params) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'return_type) in
    Obj.repr(
# 77 "parser.mly"
                                        ( Heading (_2, _3, _4) )
# 577 "parser.ml"
               : 'proc_heading))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "parser.mly"
                                        ( [] )
# 583 "parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'formal_decls) in
    Obj.repr(
# 81 "parser.mly"
                                        ( _2 )
# 590 "parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_decl) in
    Obj.repr(
# 84 "parser.mly"
                                        ( [_1] )
# 597 "parser.ml"
               : 'formal_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_decl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formal_decls) in
    Obj.repr(
# 85 "parser.mly"
                                        ( _1 :: _3 )
# 605 "parser.ml"
               : 'formal_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ident_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 88 "parser.mly"
                                        ( VarDecl (CParamDef, _1, _3) )
# 613 "parser.ml"
               : 'formal_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'ident_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 89 "parser.mly"
                                        ( VarDecl (VParamDef, _2, _4) )
# 621 "parser.ml"
               : 'formal_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'proc_heading) in
    Obj.repr(
# 90 "parser.mly"
                                        ( PParamDecl _1 )
# 628 "parser.ml"
               : 'formal_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
                                        ( None )
# 634 "parser.ml"
               : 'return_type))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 94 "parser.mly"
                                        ( Some _2 )
# 641 "parser.ml"
               : 'return_type))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 97 "parser.mly"
                                        ( match _1 with [x] -> x
                                            | xs -> makeStmt (Seq _1, 0) )
# 649 "parser.ml"
               : 'stmts))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 101 "parser.mly"
                                        ( [_1] )
# 656 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 102 "parser.mly"
                                        ( _1 :: _3 )
# 664 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'line) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt1) in
    Obj.repr(
# 105 "parser.mly"
                                        ( makeStmt (_2, _1) )
# 672 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser.mly"
                                        ( failwith "impossible" )
# 678 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "parser.mly"
                                        ( !Lexer.lineno )
# 684 "parser.ml"
               : 'line))
; (fun __caml_parser_env ->
    Obj.repr(
# 113 "parser.mly"
                                        ( Skip )
# 690 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
                                        ( Assign (_1, _3) )
# 698 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'name) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'actuals) in
    Obj.repr(
# 115 "parser.mly"
                                        ( ProcCall (_1, _2) )
# 706 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr_opt) in
    Obj.repr(
# 116 "parser.mly"
                                        ( Return _2 )
# 713 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmts) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'elses) in
    Obj.repr(
# 117 "parser.mly"
                                        ( IfStmt (_2, _4, _5) )
# 722 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 118 "parser.mly"
                                        ( WhileStmt (_2, _4) )
# 730 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'stmts) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                                        ( RepeatStmt (_2, _4) )
# 738 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'for_clause) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 121 "parser.mly"
                                        ( let v = makeExpr (Variable (fst (_1))) in
                                          let lo = List.map (fun (l, h, s, b) -> l) (snd (_1)) in
                                          let hi = List.map (fun (l, h, s, b) -> h) (snd (_1)) in
                                          let step = List.map (fun (l, h, s, b) -> s) (snd (_1)) in
                                          let bool_st = List.map (fun (l, h, s, b) -> b) (snd (_1)) in
                                          ForStmt (v, lo, hi, step, bool_st, _2) )
# 751 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'arms) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'else_part) in
    Obj.repr(
# 127 "parser.mly"
                                        ( CaseStmt (_2, _4, _5) )
# 760 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    Obj.repr(
# 130 "parser.mly"
                                        ( makeStmt (Skip, 0) )
# 766 "parser.ml"
               : 'elses))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 131 "parser.mly"
                                        ( _2 )
# 773 "parser.ml"
               : 'elses))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'line) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'elses) in
    Obj.repr(
# 132 "parser.mly"
                                        ( makeStmt (IfStmt (_3, _5, _6), _2) )
# 783 "parser.ml"
               : 'elses))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'name) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'for_elems) in
    Obj.repr(
# 135 "parser.mly"
                                 ( _2, _4 )
# 791 "parser.ml"
               : 'for_clause))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'for_elem) in
    Obj.repr(
# 138 "parser.mly"
                ( [_1] )
# 798 "parser.ml"
               : 'for_elems))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'for_elem) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'for_elems) in
    Obj.repr(
# 139 "parser.mly"
                              ( _1 :: _3 )
# 806 "parser.ml"
               : 'for_elems))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "parser.mly"
                   ( _1, _3, const 1 integer, const 2 boolean )
# 814 "parser.ml"
               : 'for_elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 143 "parser.mly"
                               ( _1, _5, _3, const 2 boolean )
# 823 "parser.ml"
               : 'for_elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 144 "parser.mly"
                      ( _1, const 0 integer, const 0 integer, _3 )
# 831 "parser.ml"
               : 'for_elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 145 "parser.mly"
            ( _1, _1, const 1 integer, const 2 boolean )
# 838 "parser.ml"
               : 'for_elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arm) in
    Obj.repr(
# 148 "parser.mly"
                                        ( [_1] )
# 845 "parser.ml"
               : 'arms))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arm) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arms) in
    Obj.repr(
# 149 "parser.mly"
                                        ( _1 :: _3 )
# 853 "parser.ml"
               : 'arms))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 152 "parser.mly"
                                        ( (_1, _3) )
# 861 "parser.ml"
               : 'arm))
; (fun __caml_parser_env ->
    Obj.repr(
# 155 "parser.mly"
                                        ( makeStmt (Skip, 0) )
# 867 "parser.ml"
               : 'else_part))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 156 "parser.mly"
                                        ( _2 )
# 874 "parser.ml"
               : 'else_part))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Dict.ident) in
    Obj.repr(
# 159 "parser.mly"
                                        ( [_1] )
# 881 "parser.ml"
               : 'ident_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Dict.ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ident_list) in
    Obj.repr(
# 160 "parser.mly"
                                        ( _1 :: _3 )
# 889 "parser.ml"
               : 'ident_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 163 "parser.mly"
                                        ( None )
# 895 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 164 "parser.mly"
                                        ( Some _1 )
# 902 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple) in
    Obj.repr(
# 167 "parser.mly"
                                        ( _1 )
# 909 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Optree.op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple) in
    Obj.repr(
# 168 "parser.mly"
                                        ( makeExpr (Binop (_2, _1, _3)) )
# 918 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple) in
    Obj.repr(
# 169 "parser.mly"
                                        ( makeExpr (Binop (Eq, _1, _3)) )
# 926 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 172 "parser.mly"
                                        ( _1 )
# 933 "parser.ml"
               : 'simple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Optree.op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 173 "parser.mly"
                                        ( makeExpr (Binop (_2, _1, _3)) )
# 942 "parser.ml"
               : 'simple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 174 "parser.mly"
                                        ( makeExpr (Binop (Minus, _1, _3)) )
# 950 "parser.ml"
               : 'simple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 177 "parser.mly"
                                        ( _1 )
# 957 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Optree.op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 178 "parser.mly"
                                        ( makeExpr (Binop (_2, _1, _3)) )
# 966 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'variable) in
    Obj.repr(
# 181 "parser.mly"
                                        ( _1 )
# 973 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 182 "parser.mly"
                                        ( const _1 integer )
# 980 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Optree.symbol * int) in
    Obj.repr(
# 183 "parser.mly"
                                        ( let (lab, len) = _1 in
                                          makeExpr (String (lab, len)) )
# 988 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 185 "parser.mly"
                                        ( const (int_of_char _1) character )
# 995 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    Obj.repr(
# 186 "parser.mly"
                                        ( makeExpr Nil )
# 1001 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'name) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'actuals) in
    Obj.repr(
# 187 "parser.mly"
                                        ( makeExpr (FuncCall (_1, _2)) )
# 1009 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 188 "parser.mly"
                                        ( makeExpr (Monop (Not, _2)) )
# 1016 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 189 "parser.mly"
                                        ( makeExpr (Monop (Uminus, _2)) )
# 1023 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 190 "parser.mly"
                                        ( _2 )
# 1030 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    Obj.repr(
# 193 "parser.mly"
                                        ( [] )
# 1036 "parser.ml"
               : 'actuals))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 194 "parser.mly"
                                        ( _2 )
# 1043 "parser.ml"
               : 'actuals))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 197 "parser.mly"
                                        ( [_1] )
# 1050 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_list) in
    Obj.repr(
# 198 "parser.mly"
                                        ( _1 :: _3 )
# 1058 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 201 "parser.mly"
                                        ( makeExpr (Variable _1) )
# 1065 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 202 "parser.mly"
                                        ( makeExpr (Sub (_1, _3)) )
# 1073 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 203 "parser.mly"
                                        ( makeExpr (Select (_1, _3)) )
# 1081 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'variable) in
    Obj.repr(
# 204 "parser.mly"
                                        ( makeExpr (Deref _1) )
# 1088 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 207 "parser.mly"
                                        ( TypeName _1 )
# 1095 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 208 "parser.mly"
                                        ( Array (_2, _4) )
# 1103 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fields) in
    Obj.repr(
# 209 "parser.mly"
                                        ( Record _2 )
# 1110 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 210 "parser.mly"
                                        ( Pointer _3 )
# 1117 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'field_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'opt_semi) in
    Obj.repr(
# 213 "parser.mly"
                                        ( [_1] )
# 1125 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'field_decl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 214 "parser.mly"
                                        ( _1 :: _3 )
# 1133 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ident_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 217 "parser.mly"
                                        ( VarDecl (FieldDef, _1, _3) )
# 1141 "parser.ml"
               : 'field_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 220 "parser.mly"
                                        ( () )
# 1147 "parser.ml"
               : 'opt_semi))
; (fun __caml_parser_env ->
    Obj.repr(
# 221 "parser.mly"
                                        ( () )
# 1153 "parser.ml"
               : 'opt_semi))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Dict.ident) in
    Obj.repr(
# 224 "parser.mly"
                                        ( makeName (_1, !Lexer.lineno) )
# 1160 "parser.ml"
               : 'name))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Tree.program)
