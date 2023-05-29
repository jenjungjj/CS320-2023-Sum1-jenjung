(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

(*
fun
isPrime
(n0: int): bool =
raise MyNotImplementedExn
*)

(* ****** ****** *)
(* when you use fun, compiler assumes you want to use recursion. 
    when you use val, compiler assumes you are not using recursion, so you need to indicate
*)
fun
isPrime(n0: int): bool = 
let 
(* ****** ****** *)
fun
helper(i0: int): bool = 
if i0 >= n0
then true
else if (n0 mod i0) <> 0
    then helper(i0+1) else false
(* ****** ****** *)  
in

if n0 <= 1 then false else helper(2)

end 

(* ****** ****** *)

val myans1 = isPrime(5)
val myans2 = isPrime(727)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-02.sml] *)
