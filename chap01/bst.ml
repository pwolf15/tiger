type key = string
datatype tree = LEAF | TREE of tree * key * tree

val empty = LEAF

(* insert: 'a tree * key * 'a tree *)

fun insert(key, LEAF) = TREE(LEAF, key, LEAF)
  | insert(key, TREE(l, k, r)) =
      if key < k
        then TREE(insert(key,l),k,r)
      else if key >= k
        then TREE(l, k, insert(key, r))
      else TREE(l, k, insert(key, r))

fun member(key, LEAF) = false
  | member(key, TREE(l, k, r)) =
      if key < k
        then member(key, l)
      else if key > k
        then member(key, r)
      else true

fun lookup(key, LEAF) = LEAF
  | lookup(key, TREE(l, k, r)) =
    if key < k
      then lookup(key, l)
    else if key > k
      then lookup(key, r)
    else TREE(l, k, r)

fun print_tree(LEAF) = ()
  | print_tree(TREE(l, k, r)) = 
      (print (k ^ "\n"); print_tree(l); print_tree(r))


(* for each level, convert children nodes into list of nodes *)
fun print_lo(LEAF) = ()
  | print_lo(TREE(l, k, r)) =
    let val arr = [] in
      print_tree_list(0, [TREE(l, k, r)])
    end
  
  and print_tree_list(seed, []) = (print("\n"); ())
    | print_tree_list(seed, x) = 
      (print("\n"); print("level " ^ Int.toString(seed) ^ ": "); print_tree_list(seed + 1, (foldl gen_next_level [] x)); ())

  and gen_next_level(LEAF, b) = b
    | gen_next_level(x, b) = case x of
          TREE(LEAF, k, LEAF) => (print(k ^ " "); b)
        | TREE(l, k, LEAF) => (print(k ^ " "); b @ [l])
        | TREE(LEAF, k, r) => (print(k ^ " "); b @ [r])
        | TREE(l, k, r) => (print(k ^ " "); b @ [l, r])
        | _ => b
    

val l = ["t", "s", "i", "p", "f", "b", "i", "s", "t"];

(*print_tree_levelorder(make_bst(l2, LEAF)) *)
val l2 = ["2", "1", "3", "4", "0"]
val l3 = ["5", "3", "7", "2", "4", "6", "8"]
val l4 = ["a", "b", "c", "d", "e", "g", "h", "i"]

fun make_bst([], t) = t
    | make_bst(x::xs, t) =
      (print(x); make_bst(xs, insert(x, t)))

val result = print_lo(make_bst(l3, LEAF))
val result = print("\n")