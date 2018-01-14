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

open Parsing;;
let _ = parse_error;;
# 5 "parser.mly"
open Optree
open Dict
open Tree
# 31 "parser.mly"
let const n t = makeExpr (Constant (n, t))
# 58 "parser.ml"
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
\025\000\025\000\025\000\029\000\029\000\029\000\030\000\030\000\
\032\000\031\000\031\000\015\000\015\000\028\000\028\000\011\000\
\011\000\011\000\033\000\033\000\033\000\034\000\034\000\035\000\
\035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
\027\000\027\000\036\000\036\000\026\000\026\000\026\000\026\000\
\013\000\013\000\013\000\013\000\037\000\037\000\038\000\039\000\
\039\000\017\000\000\000"

let yylen = "\002\000\
\002\000\004\000\000\000\002\000\002\000\002\000\001\000\002\000\
\001\000\002\000\004\000\001\000\002\000\004\000\001\000\002\000\
\004\000\004\000\004\000\002\000\003\000\001\000\003\000\003\000\
\004\000\001\000\000\000\002\000\001\000\001\000\003\000\002\000\
\001\000\000\000\000\000\003\000\002\000\002\000\006\000\005\000\
\004\000\009\000\006\000\000\000\002\000\006\000\001\000\003\000\
\003\000\000\000\002\000\001\000\003\000\000\000\001\000\001\000\
\003\000\003\000\001\000\003\000\003\000\001\000\003\000\001\000\
\001\000\001\000\001\000\001\000\002\000\002\000\002\000\003\000\
\002\000\003\000\001\000\003\000\001\000\004\000\003\000\002\000\
\001\000\004\000\003\000\003\000\002\000\003\000\003\000\001\000\
\000\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\091\000\000\000\
\000\000\000\000\007\000\000\000\000\000\005\000\000\000\090\000\
\000\000\000\000\008\000\000\000\000\000\006\000\000\000\000\000\
\001\000\000\000\004\000\000\000\000\000\010\000\000\000\000\000\
\000\000\013\000\000\000\016\000\000\000\033\000\000\000\029\000\
\000\000\000\000\000\000\065\000\067\000\066\000\000\000\000\000\
\000\000\068\000\000\000\000\000\000\000\000\000\000\000\062\000\
\020\000\000\000\000\000\026\000\000\000\000\000\000\000\019\000\
\000\000\000\000\000\000\000\000\081\000\053\000\000\000\002\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\032\000\000\000\018\000\000\000\071\000\070\000\000\000\011\000\
\000\000\000\000\069\000\000\000\000\000\080\000\000\000\000\000\
\000\000\000\000\000\000\021\000\000\000\028\000\000\000\000\000\
\000\000\000\000\000\000\014\000\017\000\031\000\000\000\000\000\
\038\000\000\000\000\000\000\000\000\000\037\000\000\000\072\000\
\000\000\000\000\073\000\000\000\000\000\079\000\000\000\000\000\
\000\000\063\000\000\000\024\000\023\000\000\000\000\000\083\000\
\000\000\085\000\084\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\074\000\078\000\025\000\082\000\087\000\086\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\076\000\
\000\000\034\000\000\000\040\000\000\000\000\000\000\000\000\000\
\000\000\045\000\000\000\039\000\000\000\049\000\051\000\043\000\
\048\000\000\000\000\000\000\000\000\000\000\000\042\000\046\000"

let yydgoto = "\002\000\
\007\000\008\000\009\000\039\000\010\000\014\000\022\000\011\000\
\019\000\015\000\124\000\020\000\068\000\023\000\024\000\012\000\
\052\000\032\000\064\000\061\000\062\000\040\000\041\000\042\000\
\081\000\053\000\091\000\113\000\163\000\158\000\168\000\159\000\
\054\000\055\000\056\000\125\000\105\000\106\000\138\000"

let yysindex = "\018\000\
\085\255\000\000\025\255\048\255\051\255\061\255\000\000\013\255\
\049\255\085\255\000\000\076\255\087\255\000\000\025\255\000\000\
\096\255\114\255\000\000\051\255\120\255\000\000\061\255\136\255\
\000\000\128\255\000\000\085\255\243\000\000\000\057\255\153\255\
\031\255\000\000\061\255\000\000\031\255\000\000\123\255\000\000\
\159\255\039\255\161\255\000\000\000\000\000\000\243\000\243\000\
\243\000\000\000\141\255\162\255\204\255\010\255\185\255\000\000\
\000\000\061\255\170\255\000\000\177\255\192\255\031\255\000\000\
\243\000\061\255\188\255\197\255\000\000\000\000\200\255\000\000\
\128\255\243\000\243\000\243\000\128\255\048\255\243\000\162\255\
\000\000\150\255\000\000\066\255\000\000\000\000\243\000\000\000\
\243\000\235\000\000\000\048\255\243\000\000\000\243\000\243\000\
\243\000\219\255\031\255\000\000\064\255\000\000\254\254\226\255\
\211\255\217\255\031\255\000\000\000\000\000\000\001\255\104\255\
\000\000\005\255\198\255\222\255\021\255\000\000\243\000\000\000\
\010\255\010\255\000\000\131\255\230\255\000\000\178\255\185\255\
\185\255\000\000\031\255\000\000\000\000\031\255\031\255\000\000\
\061\255\000\000\000\000\128\255\128\255\243\000\243\000\243\000\
\104\255\243\000\000\000\000\000\000\000\000\000\000\000\000\000\
\249\254\221\255\104\255\082\255\194\255\216\255\228\255\000\000\
\128\255\000\000\223\255\000\000\243\000\128\255\128\255\238\255\
\243\000\000\000\243\000\000\000\093\255\000\000\000\000\000\000\
\000\000\008\255\128\255\128\255\242\255\249\254\000\000\000\000"

let yyrindex = "\000\000\
\233\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\233\255\000\000\000\000\000\000\000\000\231\000\000\000\
\000\000\000\000\000\000\233\000\240\255\000\000\241\000\000\000\
\000\000\015\255\000\000\233\255\000\000\000\000\000\000\003\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\169\255\164\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\218\255\252\255\132\000\030\000\000\000\
\000\000\000\000\000\000\000\000\000\000\246\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\110\255\000\000\008\000\000\000\173\255\000\000\000\000\143\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\245\255\000\000\000\000\000\000\000\000\000\000\042\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\166\000\200\000\000\000\247\255\000\000\000\000\000\000\064\000\
\098\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\249\255\000\000\000\000\133\255\015\255\000\000\000\000\000\000\
\076\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\001\000\000\000\110\000\000\000\000\000\004\000\052\255\000\000\
\015\255\000\000\000\000\000\000\000\000\157\255\015\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\015\255\133\255\000\000\001\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\246\000\009\001\182\255\000\000\005\001\002\001\000\000\
\008\001\000\000\227\255\000\000\248\255\000\000\231\255\229\255\
\253\255\000\000\000\000\192\000\000\000\227\000\000\000\142\000\
\000\000\010\001\230\000\000\000\129\000\146\000\000\000\000\000\
\013\000\029\000\215\255\172\000\182\000\000\000\000\000"

let yytablesize = 540
let yytable = "\051\000\
\017\000\087\000\115\000\060\000\087\000\059\000\085\000\086\000\
\087\000\070\000\027\000\087\000\095\000\089\000\027\000\034\000\
\089\000\084\000\001\000\161\000\089\000\025\000\034\000\089\000\
\087\000\013\000\096\000\134\000\071\000\069\000\141\000\016\000\
\098\000\069\000\140\000\103\000\089\000\162\000\080\000\016\000\
\104\000\180\000\034\000\034\000\111\000\112\000\114\000\034\000\
\016\000\117\000\144\000\018\000\034\000\065\000\102\000\130\000\
\034\000\021\000\034\000\069\000\034\000\021\000\066\000\127\000\
\021\000\153\000\154\000\074\000\057\000\087\000\067\000\075\000\
\026\000\060\000\116\000\059\000\076\000\120\000\047\000\047\000\
\077\000\089\000\078\000\028\000\079\000\087\000\170\000\004\000\
\126\000\145\000\132\000\174\000\175\000\058\000\004\000\069\000\
\087\000\089\000\139\000\121\000\058\000\122\000\029\000\069\000\
\181\000\182\000\031\000\087\000\089\000\003\000\034\000\104\000\
\155\000\156\000\157\000\004\000\165\000\034\000\179\000\089\000\
\005\000\006\000\149\000\128\000\129\000\150\000\151\000\069\000\
\034\000\033\000\069\000\069\000\035\000\034\000\087\000\173\000\
\034\000\034\000\034\000\157\000\034\000\178\000\034\000\146\000\
\087\000\037\000\089\000\034\000\088\000\038\000\072\000\034\000\
\034\000\034\000\034\000\034\000\089\000\034\000\092\000\034\000\
\034\000\034\000\063\000\093\000\034\000\034\000\073\000\119\000\
\083\000\094\000\034\000\035\000\090\000\034\000\034\000\034\000\
\034\000\034\000\034\000\099\000\034\000\087\000\035\000\034\000\
\034\000\034\000\097\000\030\000\100\000\034\000\035\000\035\000\
\148\000\089\000\034\000\030\000\030\000\087\000\034\000\101\000\
\034\000\034\000\034\000\166\000\108\000\034\000\035\000\109\000\
\035\000\089\000\034\000\030\000\092\000\030\000\034\000\034\000\
\034\000\093\000\034\000\077\000\077\000\077\000\107\000\094\000\
\137\000\077\000\077\000\077\000\131\000\077\000\077\000\077\000\
\077\000\077\000\077\000\135\000\077\000\077\000\136\000\143\000\
\142\000\147\000\167\000\077\000\077\000\077\000\169\000\077\000\
\164\000\052\000\172\000\077\000\077\000\064\000\064\000\064\000\
\003\000\022\000\075\000\064\000\077\000\064\000\077\000\064\000\
\064\000\176\000\064\000\064\000\064\000\183\000\064\000\054\000\
\089\000\043\000\027\000\030\000\088\000\064\000\064\000\064\000\
\036\000\064\000\054\000\034\000\044\000\064\000\064\000\050\000\
\059\000\059\000\054\000\054\000\133\000\059\000\064\000\059\000\
\064\000\059\000\059\000\110\000\059\000\059\000\059\000\171\000\
\059\000\055\000\054\000\082\000\054\000\118\000\184\000\059\000\
\059\000\059\000\177\000\059\000\055\000\160\000\152\000\059\000\
\059\000\000\000\060\000\060\000\055\000\055\000\000\000\060\000\
\059\000\060\000\059\000\060\000\060\000\000\000\060\000\060\000\
\060\000\000\000\060\000\036\000\055\000\000\000\055\000\000\000\
\000\000\060\000\060\000\060\000\000\000\060\000\036\000\000\000\
\000\000\060\000\060\000\000\000\061\000\061\000\036\000\036\000\
\000\000\061\000\060\000\061\000\060\000\061\000\061\000\000\000\
\061\000\061\000\061\000\000\000\061\000\041\000\036\000\000\000\
\036\000\000\000\000\000\061\000\061\000\061\000\000\000\061\000\
\041\000\000\000\000\000\061\000\061\000\000\000\000\000\056\000\
\041\000\041\000\000\000\056\000\061\000\056\000\061\000\056\000\
\056\000\000\000\056\000\056\000\000\000\000\000\056\000\077\000\
\041\000\000\000\041\000\000\000\077\000\056\000\056\000\056\000\
\077\000\056\000\077\000\000\000\000\000\056\000\056\000\000\000\
\000\000\057\000\000\000\000\000\000\000\057\000\056\000\057\000\
\056\000\057\000\057\000\000\000\057\000\057\000\000\000\000\000\
\057\000\000\000\000\000\000\000\000\000\000\000\000\000\057\000\
\057\000\057\000\000\000\057\000\000\000\000\000\000\000\057\000\
\057\000\000\000\000\000\058\000\000\000\000\000\000\000\058\000\
\057\000\058\000\057\000\058\000\058\000\000\000\058\000\058\000\
\000\000\000\000\058\000\000\000\000\000\000\000\000\000\000\000\
\000\000\058\000\058\000\058\000\000\000\058\000\000\000\000\000\
\000\000\058\000\058\000\016\000\000\000\000\000\000\000\044\000\
\045\000\046\000\058\000\016\000\058\000\047\000\123\000\044\000\
\045\000\046\000\000\000\048\000\000\000\047\000\009\000\009\000\
\012\000\012\000\000\000\048\000\000\000\009\000\000\000\012\000\
\015\000\015\000\009\000\009\000\012\000\012\000\000\000\015\000\
\000\000\049\000\000\000\050\000\015\000\015\000\000\000\000\000\
\000\000\049\000\000\000\050\000"

let yycheck = "\029\000\
\004\000\004\001\077\000\031\000\004\001\031\000\048\000\049\000\
\004\001\035\000\008\001\004\001\003\001\016\001\012\001\001\001\
\016\001\047\000\001\000\027\001\016\001\009\001\008\001\016\001\
\004\001\001\001\017\001\030\001\037\000\033\000\026\001\001\001\
\058\000\037\000\034\001\065\000\016\001\045\001\042\000\001\001\
\066\000\034\001\028\001\029\001\074\000\075\000\076\000\033\001\
\001\001\079\000\030\001\001\001\038\001\023\001\063\000\097\000\
\042\001\001\001\044\001\063\000\046\001\001\001\032\001\093\000\
\001\001\140\000\141\000\029\001\012\001\004\001\040\001\033\001\
\024\001\101\000\078\000\101\000\038\001\012\001\027\001\028\001\
\042\001\016\001\044\001\008\001\046\001\004\001\161\000\031\001\
\092\000\119\000\099\000\166\000\167\000\037\001\031\001\099\000\
\004\001\016\001\107\000\087\000\037\001\089\000\016\001\107\000\
\179\000\180\000\011\001\004\001\016\001\025\001\001\001\137\000\
\142\000\143\000\144\000\031\001\035\001\008\001\026\001\016\001\
\036\001\037\001\131\000\095\000\096\000\134\000\135\000\131\000\
\019\001\016\001\134\000\135\000\013\001\001\001\004\001\165\000\
\027\001\028\001\029\001\169\000\008\001\171\000\033\001\013\001\
\004\001\010\001\016\001\038\001\008\001\022\001\028\001\042\001\
\043\001\044\001\045\001\046\001\016\001\001\001\009\001\027\001\
\028\001\029\001\010\001\014\001\008\001\033\001\008\001\018\001\
\008\001\020\001\038\001\008\001\011\001\001\001\042\001\019\001\
\044\001\045\001\046\001\010\001\008\001\004\001\019\001\027\001\
\028\001\029\001\002\001\019\001\012\001\033\001\027\001\028\001\
\015\001\016\001\038\001\027\001\028\001\004\001\042\001\008\001\
\044\001\029\001\046\001\010\001\008\001\033\001\043\001\008\001\
\045\001\016\001\038\001\043\001\009\001\045\001\042\001\043\001\
\044\001\014\001\046\001\002\001\003\001\004\001\035\001\020\001\
\008\001\008\001\009\001\010\001\010\001\012\001\013\001\014\001\
\015\001\016\001\017\001\010\001\019\001\020\001\028\001\018\001\
\043\001\012\001\027\001\026\001\027\001\028\001\019\001\030\001\
\028\001\010\001\028\001\034\001\035\001\002\001\003\001\004\001\
\024\001\012\001\012\001\008\001\043\001\010\001\045\001\012\001\
\013\001\028\001\015\001\016\001\017\001\028\001\019\001\008\001\
\028\001\028\000\010\000\015\000\028\001\026\001\027\001\028\001\
\023\000\030\001\019\001\020\000\028\001\034\001\035\001\028\001\
\003\001\004\001\027\001\028\001\101\000\008\001\043\001\010\001\
\045\001\012\001\013\001\073\000\015\001\016\001\017\001\162\000\
\019\001\008\001\043\001\042\000\045\001\080\000\182\000\026\001\
\027\001\028\001\169\000\030\001\019\001\146\000\137\000\034\001\
\035\001\255\255\003\001\004\001\027\001\028\001\255\255\008\001\
\043\001\010\001\045\001\012\001\013\001\255\255\015\001\016\001\
\017\001\255\255\019\001\008\001\043\001\255\255\045\001\255\255\
\255\255\026\001\027\001\028\001\255\255\030\001\019\001\255\255\
\255\255\034\001\035\001\255\255\003\001\004\001\027\001\028\001\
\255\255\008\001\043\001\010\001\045\001\012\001\013\001\255\255\
\015\001\016\001\017\001\255\255\019\001\008\001\043\001\255\255\
\045\001\255\255\255\255\026\001\027\001\028\001\255\255\030\001\
\019\001\255\255\255\255\034\001\035\001\255\255\255\255\004\001\
\027\001\028\001\255\255\008\001\043\001\010\001\045\001\012\001\
\013\001\255\255\015\001\016\001\255\255\255\255\019\001\009\001\
\043\001\255\255\045\001\255\255\014\001\026\001\027\001\028\001\
\018\001\030\001\020\001\255\255\255\255\034\001\035\001\255\255\
\255\255\004\001\255\255\255\255\255\255\008\001\043\001\010\001\
\045\001\012\001\013\001\255\255\015\001\016\001\255\255\255\255\
\019\001\255\255\255\255\255\255\255\255\255\255\255\255\026\001\
\027\001\028\001\255\255\030\001\255\255\255\255\255\255\034\001\
\035\001\255\255\255\255\004\001\255\255\255\255\255\255\008\001\
\043\001\010\001\045\001\012\001\013\001\255\255\015\001\016\001\
\255\255\255\255\019\001\255\255\255\255\255\255\255\255\255\255\
\255\255\026\001\027\001\028\001\255\255\030\001\255\255\255\255\
\255\255\034\001\035\001\001\001\255\255\255\255\255\255\005\001\
\006\001\007\001\043\001\001\001\045\001\011\001\012\001\005\001\
\006\001\007\001\255\255\017\001\255\255\011\001\024\001\025\001\
\024\001\025\001\255\255\017\001\255\255\031\001\255\255\031\001\
\024\001\025\001\036\001\037\001\036\001\037\001\255\255\031\001\
\255\255\039\001\255\255\041\001\036\001\037\001\255\255\255\255\
\255\255\039\001\255\255\041\001"

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
# 428 "parser.ml"
               : Tree.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'decl_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 40 "parser.mly"
                                        ( makeBlock (_1, _3) )
# 436 "parser.ml"
               : 'block))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parser.mly"
                                        ( [] )
# 442 "parser.ml"
               : 'decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decl_list) in
    Obj.repr(
# 44 "parser.mly"
                                        ( _1 @ _2 )
# 450 "parser.ml"
               : 'decl_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'const_decls) in
    Obj.repr(
# 47 "parser.mly"
                                        ( _2 )
# 457 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decls) in
    Obj.repr(
# 48 "parser.mly"
                                        ( _2 )
# 464 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'proc_decl) in
    Obj.repr(
# 49 "parser.mly"
                                        ( [_1] )
# 471 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'type_decls) in
    Obj.repr(
# 50 "parser.mly"
                                        ( [TypeDecl _2] )
# 478 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'const_decl) in
    Obj.repr(
# 53 "parser.mly"
                                        ( [_1] )
# 485 "parser.ml"
               : 'const_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'const_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'const_decls) in
    Obj.repr(
# 54 "parser.mly"
                                        ( _1 :: _2 )
# 493 "parser.ml"
               : 'const_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Dict.ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 57 "parser.mly"
                                        ( ConstDecl (_1, _3) )
# 501 "parser.ml"
               : 'const_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'type_decl) in
    Obj.repr(
# 60 "parser.mly"
                                        ( [_1] )
# 508 "parser.ml"
               : 'type_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'type_decls) in
    Obj.repr(
# 61 "parser.mly"
                                        ( _1 :: _2 )
# 516 "parser.ml"
               : 'type_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Dict.ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typexpr) in
    Obj.repr(
# 64 "parser.mly"
                                        ( (_1, _3) )
# 524 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 67 "parser.mly"
                                        ( [_1] )
# 531 "parser.ml"
               : 'var_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decls) in
    Obj.repr(
# 68 "parser.mly"
                                        ( _1 :: _2 )
# 539 "parser.ml"
               : 'var_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'ident_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typexpr) in
    Obj.repr(
# 71 "parser.mly"
                                        ( VarDecl (VarDef, _1, _3) )
# 547 "parser.ml"
               : 'var_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'proc_heading) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'block) in
    Obj.repr(
# 74 "parser.mly"
                                        ( ProcDecl (_1, _3) )
# 555 "parser.ml"
               : 'proc_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'name) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'params) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'return_type) in
    Obj.repr(
# 77 "parser.mly"
                                        ( Heading (_2, _3, _4) )
# 564 "parser.ml"
               : 'proc_heading))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "parser.mly"
                                        ( [] )
# 570 "parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'formal_decls) in
    Obj.repr(
# 81 "parser.mly"
                                        ( _2 )
# 577 "parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_decl) in
    Obj.repr(
# 84 "parser.mly"
                                        ( [_1] )
# 584 "parser.ml"
               : 'formal_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_decl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formal_decls) in
    Obj.repr(
# 85 "parser.mly"
                                        ( _1 :: _3 )
# 592 "parser.ml"
               : 'formal_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ident_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 88 "parser.mly"
                                        ( VarDecl (CParamDef, _1, _3) )
# 600 "parser.ml"
               : 'formal_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'ident_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 89 "parser.mly"
                                        ( VarDecl (VParamDef, _2, _4) )
# 608 "parser.ml"
               : 'formal_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'proc_heading) in
    Obj.repr(
# 90 "parser.mly"
                                        ( PParamDecl _1 )
# 615 "parser.ml"
               : 'formal_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
                                        ( None )
# 621 "parser.ml"
               : 'return_type))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 94 "parser.mly"
                                        ( Some _2 )
# 628 "parser.ml"
               : 'return_type))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 97 "parser.mly"
                                        ( match _1 with [x] -> x
                                            | xs -> makeStmt (Seq _1, 0) )
# 636 "parser.ml"
               : 'stmts))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 101 "parser.mly"
                                        ( [_1] )
# 643 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 102 "parser.mly"
                                        ( _1 :: _3 )
# 651 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'line) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt1) in
    Obj.repr(
# 105 "parser.mly"
                                        ( makeStmt (_2, _1) )
# 659 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser.mly"
                                        ( failwith "impossible" )
# 665 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "parser.mly"
                                        ( !Lexer.lineno )
# 671 "parser.ml"
               : 'line))
; (fun __caml_parser_env ->
    Obj.repr(
# 113 "parser.mly"
                                        ( Skip )
# 677 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
                                        ( Assign (_1, _3) )
# 685 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'name) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'actuals) in
    Obj.repr(
# 115 "parser.mly"
                                        ( ProcCall (_1, _2) )
# 693 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr_opt) in
    Obj.repr(
# 116 "parser.mly"
                                        ( Return _2 )
# 700 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmts) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'elses) in
    Obj.repr(
# 117 "parser.mly"
                                        ( IfStmt (_2, _4, _5) )
# 709 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 118 "parser.mly"
                                        ( WhileStmt (_2, _4) )
# 717 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'stmts) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                                        ( RepeatStmt (_2, _4) )
# 725 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : 'name) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 121 "parser.mly"
                                        ( let v = makeExpr (Variable _2) in
                                          ForStmt (v, _4, _6, _8, ref None) )
# 736 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'arms) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'else_part) in
    Obj.repr(
# 123 "parser.mly"
                                        ( CaseStmt (_2, _4, _5) )
# 745 "parser.ml"
               : 'stmt1))
; (fun __caml_parser_env ->
    Obj.repr(
# 126 "parser.mly"
                                        ( makeStmt (Skip, 0) )
# 751 "parser.ml"
               : 'elses))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 127 "parser.mly"
                                        ( _2 )
# 758 "parser.ml"
               : 'elses))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'line) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'elses) in
    Obj.repr(
# 128 "parser.mly"
                                        ( makeStmt (IfStmt (_3, _5, _6), _2) )
# 768 "parser.ml"
               : 'elses))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arm) in
    Obj.repr(
# 131 "parser.mly"
                                        ( [_1] )
# 775 "parser.ml"
               : 'arms))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arm) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arms) in
    Obj.repr(
# 132 "parser.mly"
                                        ( _1 :: _3 )
# 783 "parser.ml"
               : 'arms))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 135 "parser.mly"
                                        ( (_1, _3) )
# 791 "parser.ml"
               : 'arm))
; (fun __caml_parser_env ->
    Obj.repr(
# 138 "parser.mly"
                                        ( makeStmt (Skip, 0) )
# 797 "parser.ml"
               : 'else_part))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 139 "parser.mly"
                                        ( _2 )
# 804 "parser.ml"
               : 'else_part))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Dict.ident) in
    Obj.repr(
# 142 "parser.mly"
                                        ( [_1] )
# 811 "parser.ml"
               : 'ident_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Dict.ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ident_list) in
    Obj.repr(
# 143 "parser.mly"
                                        ( _1 :: _3 )
# 819 "parser.ml"
               : 'ident_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 146 "parser.mly"
                                        ( None )
# 825 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 147 "parser.mly"
                                        ( Some _1 )
# 832 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple) in
    Obj.repr(
# 150 "parser.mly"
                                        ( _1 )
# 839 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Optree.op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple) in
    Obj.repr(
# 151 "parser.mly"
                                        ( makeExpr (Binop (_2, _1, _3)) )
# 848 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple) in
    Obj.repr(
# 152 "parser.mly"
                                        ( makeExpr (Binop (Eq, _1, _3)) )
# 856 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 155 "parser.mly"
                                        ( _1 )
# 863 "parser.ml"
               : 'simple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Optree.op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 156 "parser.mly"
                                        ( makeExpr (Binop (_2, _1, _3)) )
# 872 "parser.ml"
               : 'simple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 157 "parser.mly"
                                        ( makeExpr (Binop (Minus, _1, _3)) )
# 880 "parser.ml"
               : 'simple))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 160 "parser.mly"
                                        ( _1 )
# 887 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Optree.op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 161 "parser.mly"
                                        ( makeExpr (Binop (_2, _1, _3)) )
# 896 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'variable) in
    Obj.repr(
# 164 "parser.mly"
                                        ( _1 )
# 903 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 165 "parser.mly"
                                        ( const _1 integer )
# 910 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Optree.symbol * int) in
    Obj.repr(
# 166 "parser.mly"
                                        ( let (lab, len) = _1 in
                                          makeExpr (String (lab, len)) )
# 918 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 168 "parser.mly"
                                        ( const (int_of_char _1) character )
# 925 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    Obj.repr(
# 169 "parser.mly"
                                        ( makeExpr Nil )
# 931 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'name) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'actuals) in
    Obj.repr(
# 170 "parser.mly"
                                        ( makeExpr (FuncCall (_1, _2)) )
# 939 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 171 "parser.mly"
                                        ( makeExpr (Monop (Not, _2)) )
# 946 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'factor) in
    Obj.repr(
# 172 "parser.mly"
                                        ( makeExpr (Monop (Uminus, _2)) )
# 953 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 173 "parser.mly"
                                        ( _2 )
# 960 "parser.ml"
               : 'factor))
; (fun __caml_parser_env ->
    Obj.repr(
# 176 "parser.mly"
                                        ( [] )
# 966 "parser.ml"
               : 'actuals))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 177 "parser.mly"
                                        ( _2 )
# 973 "parser.ml"
               : 'actuals))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 180 "parser.mly"
                                        ( [_1] )
# 980 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_list) in
    Obj.repr(
# 181 "parser.mly"
                                        ( _1 :: _3 )
# 988 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 184 "parser.mly"
                                        ( makeExpr (Variable _1) )
# 995 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 185 "parser.mly"
                                        ( makeExpr (Sub (_1, _3)) )
# 1003 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'variable) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 186 "parser.mly"
                                        ( makeExpr (Select (_1, _3)) )
# 1011 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'variable) in
    Obj.repr(
# 187 "parser.mly"
                                        ( makeExpr (Deref _1) )
# 1018 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'name) in
    Obj.repr(
# 190 "parser.mly"
                                        ( TypeName _1 )
# 1025 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 191 "parser.mly"
                                        ( Array (_2, _4) )
# 1033 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fields) in
    Obj.repr(
# 192 "parser.mly"
                                        ( Record _2 )
# 1040 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 193 "parser.mly"
                                        ( Pointer _3 )
# 1047 "parser.ml"
               : 'typexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'field_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'opt_semi) in
    Obj.repr(
# 196 "parser.mly"
                                        ( [_1] )
# 1055 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'field_decl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 197 "parser.mly"
                                        ( _1 :: _3 )
# 1063 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ident_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typexpr) in
    Obj.repr(
# 200 "parser.mly"
                                        ( VarDecl (FieldDef, _1, _3) )
# 1071 "parser.ml"
               : 'field_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 203 "parser.mly"
                                        ( () )
# 1077 "parser.ml"
               : 'opt_semi))
; (fun __caml_parser_env ->
    Obj.repr(
# 204 "parser.mly"
                                        ( () )
# 1083 "parser.ml"
               : 'opt_semi))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Dict.ident) in
    Obj.repr(
# 207 "parser.mly"
                                        ( makeName (_1, !Lexer.lineno) )
# 1090 "parser.ml"
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
