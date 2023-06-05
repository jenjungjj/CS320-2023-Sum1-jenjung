fun list2string (xs: int list) = 
    case xs of 
        [] => "[]"
    |   x :: xs => Int.toString x ^ " :: " ^ list2string xs 

fun list2string (toString: 'a -> string, xs: 'a list) =         (* extend with an extra argument *)
    case xs of 
        [] => "[]"
    |   x :: xs => toString x ^ " :: " ^ list2string (toString, xs)

fun intlist2string(xs: int list) : string = 
    list2string (Int.toString, xs) 

fun list_lte (xs: int list, pivot: int): int list =     (* less than or equal to function *)
    case xs of 
        [] => []
    |   x :: xs =>
        if x <= pivot then 
            x :: list_lte (xs, pivot) 
        else 
            list_lte (xs, pivot)    (* discard the element and keep traversing thru the list *)

fun list_gt (xs: int list, pivot: int): int list = 
    case xs of 
        [] => []
    | x :: xs => 
        if x > pivot then 
            x :: list_gt (xs, pivot)
        else    
            list_gt (xs, pivot) 

fun list_filter (cond: 'a -> bool, xs: 'a list): 'a list = 
    case xs of 
        [] => []
    |   x :: xs => 
        if cond x then      (* if condition on x is true then *)
            x :: list_filter (cond, xs)        (* keep x and apply list_filter *) 
        else
            list_filter (cond, xs) 

fun qsort(xs: int list): int list = 
    case xs of 
        [] => []
    | pivot :: xs =>
        let 
        (* [x for x in xs if x <= pivot] *)
        val l = list_filter (fn x => x <= pivot, xs)  
        (* [x for x in xs if x > pivot ] *)      
        val r = list_filter (fn x => x > pivot, xs)
        in qsort (l) @ [pivot] @ qsort (r)
        end 

fun qsort(lte: 'a * 'a -> bool, xs: 'a list): 'a list = 
    case xs of 
        [] => []
    | pivot :: xs =>
        let 
        (* [x for x in xs if x <= pivot] *)
        val l = list_filter (fn x => lte (x, pivot), xs)  
        (* [x for x in xs if x > pivot ] *)      
        val r = list_filter (fn x => not (lte (x, pivot)), xs)
        in qsort (lte, l) @ [pivot] @ qsort (lte, r)
        end 

val xs = 
    qsort 
    (fn (xs, ys) => List.length xs <= List.length ys,
     [[], [1,2], [2], [1, 2, 3, 4], [1, 2, 3], [1, 2, 3, 4, 5], []])

val ys = 
    qsort 
    (fn (xs, ys) => List.length xs > List.length ys,
     [[1,2], [2], [1, 2, 3, 4], [1, 2, 3], [1, 2, 3, 4, 5], []])

(* ****** ****** *)

(* ('a -> 'b) * ('a list) -> 'b list *)
fun list_map (fopr: 'a -> 'b, xs: 'a list): 'b list = 
    case xs of 
        [] => []
    |   x :: xs => 
        fopr x :: list_map (fopr, xs) 

val xs0 = [1, 2, 3, 4, 5, 6]
(* [ x + 1 for x in xs0] *)
val xs1 = list_map(fn x => x + 1, xs0) 
(* [ x * x for x in xs0] *)
val xs2 = list_map (fn x => x * x, xs0) 

val ys0 = ["abc", "xyz", "321", "hello", "world", "Boston"] 

(* val ys1 = list_map (fn x => ?, xs0, ys0)  *) (* this is incorrect bc list_map can only take in two arguments *)
(* how to fix this ? *)
fun list_zip (xs: 'a list, ys: 'b list): ('a * 'b) list = 
    case (xs, ys) of
        ([], _) => []
    |   (_, []) => []
    |   (x :: xs, y :: ys) =>
            (x, y) :: list_zip (xs, ys)

val ys1 = list_map (fn (x,y) => Int.toString x ^ y, list_zip (xs0, ys0))
val ys2 = list_map (fn (x,y) => 
    let fun loop i = 
        if i < x then   
            y ^ loop (i + 1)
        else 
            ""
    in 
        loop 0
    end, 
        list_zip(xs0, ys0))

(* ***** ***** *)

(*  python structure for foldleft()

acc = 0
for x in xs:
    acc = something with x and acc  // loop until we reach acc 
return acc 

*)
fun foldleft (fopr: 'a * 'b -> 'b, xs: 'a list, acc: 'b): 'b =
    case xs of 
        [] => acc 
    | x :: xs => 
        foldleft (fopr, xs, fopr (x, acc)) 

(*

xs0 = [1, 2, 3, 4, 5, 6]
acc = 0     // acc is current accumulator value
for x in xs0:
    acc = x + acc
return acc

*)

val sum0 = 
    foldleft ( fn (x, acc) => x + acc, xs0, 0)       (* set initial accumulator value to be 0 *)
val sum1 = foldleft( fn (x, acc) => x * acc, xs0, 1) 

(*
for (x, i) in enum(xs0):
    acc = computed from x, i and acc
return acc 
*)

val (sum2, _) = foldleft (fn (x, (acc, i)) => ((x+i) * acc, i+1 ), xs0, (1, 0))
(* ****** ******* *)

