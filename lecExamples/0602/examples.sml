exception NotFound
(*
[("a", 0), ("b", 1), ("c", 2), ...
]*)
(*
    This is a tail-recursive function
    *)
fun 
dbase_search
(dbase: (string * 'a) list, key: 'a): 'a = 
case dbase of 
 nil => raise NotFound
 kx1 :: dbase (* name shadowing *) => 
 if key = #1(kx1) then #2(kx1) else dbase_search(dbase, key) 

 (* ***** ***** *)

 val mydbase = [("a", 0), ("b", 1), ("c", 2)]
val x0 = dbase_search(mydbase, "a")

(* ***** ***** *)

(* end of [associated.sml] *)