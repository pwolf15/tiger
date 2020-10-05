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
fun maxargs(prog) = case prog of
    PrintStm _ => 2
  | _ => 1