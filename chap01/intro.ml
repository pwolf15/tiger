type id = string

datatype binop = Plus | Minus | Times | Div

datatype stm = CompoundStm of stm * stm
              | AssignStm of id * exp
              | PrintStm of exp list

    and exp = IdExp of id
            | NumExp of int
            | OpExp of exp * binop * exp
            | EseqExp of stm * exp


(* a := 5 + 3; b := (print(a, a-1), 10*a); print(b) *)
(* prints *)
(* 8 7 *)
(* 80 *)
val prog =
  CompoundStm(AssignStm("a", OpExp(NumExp 5, Plus, NumExp 3)),
    CompoundStm(AssignStm("b",
      EseqExp(PrintStm[IdExp"a", OpExp(IdExp"a", Minus,
                                       NumExp 1)],
            OpExp(NumExp 10, Times, IdExp"a"))),
    PrintStm[IdExp "b"]))

(* returns max number of arguments in any print statement *)
(* use length to get size of PrintStm list *)
(* length([1, 2, 3]) *)
(* maxargs(PrintStm[NumExp 10, NumExp 2]); *)
(* maxargs(prog) => 2 *)

fun myTest x = case x of
  _ => 1

fun maxargs(prog) = case prog of
  CompoundStm (a, b) => Int.max(maxargs(a), maxargs(b))
  | AssignStm(a, b) => maxargsexp(b)
  | PrintStm (x) => Int.max(length(x), foldl Int.max 0 (map maxargsexp x))
  
  and maxargsexp(exp) = case exp of
    IdExp _ => 0
  | NumExp _ => 0
  | OpExp (a, _, b) => Int.max(maxargsexp(a), maxargsexp(b))
  | EseqExp(s, e) => Int.max(maxargs(s), maxargsexp(e))


(* demonstrating map usage *)
fun customPrint x = print (x ^ "\n")
fun test x = map customPrint x

(* demonstrating fold usage *)
fun myMax x = foldl Int.max 0 x

(* interp : stm -> unit *)
(* interprets a program in this language *)
fun interpStm (s, t) = case s of 
      CompoundStm (a, b) => (interpStm(a, t); interpStm(b, t))
    | AssignStm (a, b) => ()
    | PrintStm (x) => ((map print (map (fn y => interpExp(y, t)) x)); ())

    and interpExp (e, t) = case e of
      IdExp _ => "Todo IdExp\n"
    | NumExp _ => "Todo NumExp\n"
    | OpExp _ => "Todo OpExp\n"
    | EseqExp _ => "Todo EseqExp\n"

fun interp (s) = interpStm(s, ())