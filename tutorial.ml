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