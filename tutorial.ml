fun length l = (case l
    of [] => 0
    | [a] => 1
    | _ :: r => 1 + length r
);

fun length [] = 0
    | length [a] = 1
    | length (_ :: r) = 1 + length r

fun even 0 = true
    | even n = odd(n - 1)

and odd 0 = false
    | odd n = even(n - 1)

fun max (a, b) =
    if a > b then a
    else b

datatype btree = LEAF
    | NODE of int * btree * btree
    
fun depth LEAF = 0
    | depth (NODE(_,t1,t2)) = 
        max(depth t1, depth t2) + 1

fun insert(LEAF,k) = NODE(k, LEAF, LEAF)
    | insert(NODE(i,t1,t2),k) =
        if k > i then NODE(i, t1, insert(t2, k))
        else if k < i then NODE(i, insert(t1, k),t2)
        else NODE(i,t1,t2)

(* in-order traversal of btrees *)
fun inord LEAF = []
    | inord(NODE(i,t1,t2)) =
        inord(t1) @ (i :: inord(t2))

(* representing programs as datatypes *)
type id = string

datatype binop = PLUS | MINUS | TIMES | DIV

datatype stm = SEQ of stm * stm
    | ASSIGN of id * exp
    | PRINT of exp list

and exp = VAR of id
    | CONST of int
    | BINOP of binop * exp * exp
    | ESEQ of stm * exp

val prog =
    SEQ(ASSIGN("a", BINOP(PLUS, CONST 5, CONST 3)),
        PRINT[VAR "a"])

fun sizeS (SEQ(s1, s2)) = sizeS s1 + sizeS s2
    | sizeS (ASSIGN(i, e)) = 2 + sizeE e
    | sizeS (PRINT es) = 1 + sizeEL es

and sizeE (BINOP(_, e1, e2)) = sizeE e1 + sizeE e2 + 2
    | sizeE (ESEQ(s, e)) = sizeS s + sizeE e
    | sizeE _ = 1

and sizeEL [] = 0
    | sizeEL (e::es) = sizeE e + sizeEL es

(* primitive types: unit, int, real, char, string, instream, oustream
    composite types: units, tuples, records, function types
    datatypes: tagged unions, recursive data structures, bool, list, user-defined: trees, expressions, etc.
    type abbreviations,
    polymorphic types
*)
type king = {name: string, born: int, crowned: int, died: int, country: string }

fun lifetime({born,died,...}: king) = 
    died - born

(* merged two sorted lists *)
fun merge(x, nil) = x
    | merge(nil, y) = y
    | merge(l as x::xs, m as y::ys) =
        if x < y then x :: merge(xs, m)
        else if y < x then y :: merge(l, m)
        else x :: merge(xs, ys)

val linenum = ref 0; (* create updateable ref cell *)
fun newLine() = linenum := !linenum + 1; (* increment it *)
fun lineCount() = !linenum; (* access ref cell *)

local val x = 1
in fun new1 () = let val x = x + 1 in x end
end (* new1 always returns 2 *)

local val x = ref 1
in fun new2 () = (x := !x + 1; !x)
end (* new2 returns 2,3,4, ... on successive calls *)

signature MANUFACTURER =
sig
    type car
    val first : car
    val built : car -> int  
    val mutate: car -> int -> car
    val show: car -> string
end

signature YEAR =
sig
    eqtype year
    val first: year
    val second: year
    val newYear: year -> year
    val show: year -> string
end

signature MCSIG =
sig 
    structure C : MANUFACTURER
    structure Y : YEAR
end

structure Ford =
struct 
    type car = {make: string, built: int}
    val first = {make= "Ford", built=1904}
    fun mutate ({make,built}: car) year =
        {make = make, built = year}
    fun built({built,...}: car) = built
    fun show(c) = if built c < built first then " - "
                    else "(generic Ford)"
end

structure Year =
struct
    type year = int
    val first = 1900
    val second = 2000
    fun newYear(y: year) = y + 1
    fun show(y: year) = Int.toString y
end

structure MutableCar =
struct
    structure C = Ford
    structure Y = Year
end

signature ORD =
sig
    type t
    val less : t * t -> bool
end

functor Sort(X: ORD) =
struct
    fun insert(x, nil) = [x]
    | insert(x,l as y::ys) =
        if X.less(x, y) then x::l
        else y::insert(x, ys)
    fun sort (m : X.t list) = foldl insert nil m
end

structure IntOrd: ORD =
struct
    val t = int
    val less = Int.<
end

structure IntSort = Sort(IntOrd)

signature UID =
    sig 
        type uid
        val same : (uid * uid) -> bool
        val compare : (uid * uid) -> order
        val gensym : unit -> uid
    end

(* structure UId :> UID =
    struct
        type uid = int (* abstract *)
        fun same (a : uid, b) = (a = b)
        val compare = Int.compare

        val count = ref 0 (* hidden *)
        fun gensym () = let
            val id = !count
            in
                count := id + 1
                id
            end
    end *)
(* 
type ('item, 'strm) reader
    = 'strm -> ('item, 'strm) option

val scan : (char, 'strm) reader
    -> (ty, 'strm) reader
 *)
