type key = string
datatype tree = LEAF | TREE of tree * key * tree

val empty = LEAF

(* insert: 'a tree * key * 'a tree *)

fun insert(key, LEAF) = TREE(LEAF, key, LEAF)
  | insert(key, TREE(l, k, r)) =
      if key < k
        then TREE(insert(key,l),k,r)
      else if key > k
        then TREE(l, k, insert(key, r))
      else TREE(l, k, r)

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
      print(k ^ "\n");
      print_tree_list([l, r])
    end
  
  and print_tree_list([]) = ()
    | print_tree_list(x) = 
      (print_tree_list((foldl gen_next_level [] x)); ())

  and gen_next_level(a, b) = [];
    

val l = ["t", "s", "i", "p", "f", "b", "s", "t"];

(*print_tree_levelorder(make_bst(l2, LEAF)) *)
val l2 = ["b", "c", "a"]

fun make_bst([], _) = LEAF
    | make_bst(x::xs, t) =
      insert(x, make_bst(xs, t))