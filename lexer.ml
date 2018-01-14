# 4 "lexer.mll"
 
open Print
open Optree
open Dict
open Parser
open Lexing
open Source

let lineno = ref 1                      (* Current line in input file *)

let symtable = 
  Util.make_hash 100
    [ ("array", ARRAY); ("begin", BEGIN);
      ("const", CONST); ("do", DO); ("if", IF ); ("else", ELSE); 
      ("end", END); ("of", OF); ("proc", PROC); ("record", RECORD);
      ("return", RETURN); ("then", THEN); ("to", TO);
      ("type", TYPE); ("var", VAR); ("while", WHILE);
      ("pointer", POINTER); ("nil", NIL);
      ("repeat", REPEAT); ("until", UNTIL); ("for", FOR);
      ("elsif", ELSIF); ("case", CASE);
      ("and", MULOP And); ("div", MULOP Div); ("or", ADDOP Or);
      ("not", NOT); ("mod", MULOP Mod) ]

let lookup s =
  try Hashtbl.find symtable s with
    Not_found ->
      let t = IDENT (intern s) in
      Hashtbl.add symtable s t; t

(* |strtbl| -- table of string constants from source program *)
let strtbl = ref []

(* |get_string| -- convert a string constant *)
let get_string s =
  let lab = gensym () in
  let n = String.length s in
  let s' = Bytes.create n
  and i = ref 0 and j = ref 0 in
  while !i <> n do
    let c = s.[!i] in
    Bytes.set s' !j c;
    if c = '"' then incr i;
    incr i; incr j
  done;
  strtbl := (lab, Bytes.sub_string s' 0 !j)::!strtbl;
  STRING (lab, !j)

(* |string_table| -- return contents of string table *)
let string_table () = List.rev !strtbl

let next_line lexbuf =
  incr lineno; Source.note_line !lineno lexbuf

# 56 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\226\255\227\255\228\255\003\000\002\000\034\000\237\255\
    \238\255\239\255\240\255\241\255\242\255\243\255\244\255\005\000\
    \246\255\003\000\248\255\249\255\250\255\002\000\053\000\077\000\
    \087\000\084\000\106\000\253\255\107\000\252\255\003\000\004\000\
    \231\255\229\255\233\255\234\255\232\255\137\000\252\255\253\255\
    \254\255\107\000\255\255";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\255\255\025\000\020\000\019\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\010\000\
    \255\255\008\000\255\255\255\255\255\255\028\000\028\000\001\000\
    \000\000\255\255\255\255\255\255\255\255\255\255\004\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\002\000\255\255";
  Lexing.lex_default = 
   "\002\000\000\000\000\000\000\000\255\255\255\255\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\255\255\
    \000\000\255\255\000\000\000\000\000\000\031\000\026\000\255\255\
    \255\255\255\255\255\255\000\000\255\255\000\000\255\255\031\000\
    \000\000\000\000\000\000\000\000\000\000\039\000\000\000\000\000\
    \000\000\255\255\000\000";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\004\000\003\000\000\000\004\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \004\000\000\000\021\000\004\000\030\000\031\000\030\000\022\000\
    \015\000\014\000\007\000\009\000\013\000\008\000\019\000\033\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\017\000\020\000\006\000\010\000\005\000\036\000\
    \032\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\012\000\025\000\011\000\016\000\034\000\
    \035\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\028\000\018\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\027\000\029\000\040\000\042\000\000\000\000\000\000\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\000\000\041\000\000\000\000\000\024\000\000\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\000\000\255\255\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\038\000";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\004\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\004\000\021\000\030\000\031\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\015\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
    \017\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\022\000\000\000\000\000\006\000\
    \006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\025\000\000\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\026\000\028\000\037\000\041\000\255\255\255\255\255\255\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\255\255\037\000\255\255\255\255\024\000\255\255\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\021\000\255\255\031\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\022\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\037\000";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec token lexbuf =
    __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
let
# 72 "lexer.mll"
                                    s
# 203 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 73 "lexer.mll"
                                ( lookup s )
# 207 "lexer.ml"

  | 1 ->
let
# 74 "lexer.mll"
            s
# 213 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 74 "lexer.mll"
                                ( NUMBER (int_of_string s) )
# 217 "lexer.ml"

  | 2 ->
let
# 75 "lexer.mll"
             c
# 223 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf (lexbuf.Lexing.lex_start_pos + 1) in
# 75 "lexer.mll"
                                ( CHAR c )
# 227 "lexer.ml"

  | 3 ->
# 76 "lexer.mll"
                                ( CHAR '\'' )
# 232 "lexer.ml"

  | 4 ->
let
# 77 "lexer.mll"
                          s
# 238 "lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) (lexbuf.Lexing.lex_curr_pos + -1) in
# 77 "lexer.mll"
                                ( get_string s )
# 242 "lexer.ml"

  | 5 ->
# 78 "lexer.mll"
                                ( SEMI )
# 247 "lexer.ml"

  | 6 ->
# 79 "lexer.mll"
                                ( DOT )
# 252 "lexer.ml"

  | 7 ->
# 80 "lexer.mll"
                                ( VBAR )
# 257 "lexer.ml"

  | 8 ->
# 81 "lexer.mll"
                                ( COLON )
# 262 "lexer.ml"

  | 9 ->
# 82 "lexer.mll"
                                ( ARROW )
# 267 "lexer.ml"

  | 10 ->
# 83 "lexer.mll"
                                ( LPAR )
# 272 "lexer.ml"

  | 11 ->
# 84 "lexer.mll"
                                ( RPAR )
# 277 "lexer.ml"

  | 12 ->
# 85 "lexer.mll"
                                ( COMMA )
# 282 "lexer.ml"

  | 13 ->
# 86 "lexer.mll"
                                ( SUB )
# 287 "lexer.ml"

  | 14 ->
# 87 "lexer.mll"
                                ( BUS )
# 292 "lexer.ml"

  | 15 ->
# 88 "lexer.mll"
                                ( EQUAL )
# 297 "lexer.ml"

  | 16 ->
# 89 "lexer.mll"
                                ( ADDOP Plus )
# 302 "lexer.ml"

  | 17 ->
# 90 "lexer.mll"
                                ( MINUS )
# 307 "lexer.ml"

  | 18 ->
# 91 "lexer.mll"
                                ( MULOP Times )
# 312 "lexer.ml"

  | 19 ->
# 92 "lexer.mll"
                                ( RELOP Lt )
# 317 "lexer.ml"

  | 20 ->
# 93 "lexer.mll"
                                ( RELOP Gt )
# 322 "lexer.ml"

  | 21 ->
# 94 "lexer.mll"
                                ( RELOP Neq )
# 327 "lexer.ml"

  | 22 ->
# 95 "lexer.mll"
                                ( RELOP Leq )
# 332 "lexer.ml"

  | 23 ->
# 96 "lexer.mll"
                                ( RELOP Geq )
# 337 "lexer.ml"

  | 24 ->
# 97 "lexer.mll"
                                ( ASSIGN )
# 342 "lexer.ml"

  | 25 ->
# 98 "lexer.mll"
                                ( token lexbuf )
# 347 "lexer.ml"

  | 26 ->
# 99 "lexer.mll"
                                ( comment lexbuf; token lexbuf )
# 352 "lexer.ml"

  | 27 ->
# 100 "lexer.mll"
                                ( next_line lexbuf; token lexbuf )
# 357 "lexer.ml"

  | 28 ->
# 101 "lexer.mll"
                                ( BADTOK )
# 362 "lexer.ml"

  | 29 ->
# 102 "lexer.mll"
                                ( err_message "unexpected end of file" 
                                    [] !lineno; 
                                  exit 1 )
# 369 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and comment lexbuf =
    __ocaml_lex_comment_rec lexbuf 37
and __ocaml_lex_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 107 "lexer.mll"
                                ( () )
# 381 "lexer.ml"

  | 1 ->
# 108 "lexer.mll"
                                ( next_line lexbuf; comment lexbuf )
# 386 "lexer.ml"

  | 2 ->
# 109 "lexer.mll"
                                ( comment lexbuf )
# 391 "lexer.ml"

  | 3 ->
# 110 "lexer.mll"
                                ( err_message "end of file in comment" 
                                    [] !lineno; 
                                  exit 1 )
# 398 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_comment_rec lexbuf __ocaml_lex_state

;;
