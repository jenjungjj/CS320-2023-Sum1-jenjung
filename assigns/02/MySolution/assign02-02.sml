(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
list_range(x, y) returns a list consisting
of all the integers i satisfying x <= i < y.
//
For instance,
list_range(1, 1) = []
list_range(2, 1) = []
list_range(0, 5) = [0,1,2,3,4]
//
Please give a tail-recusive implementation of
the list_range function
//
fun list_range(start: int, finish: int): int list
*)


fun list_range(start: int, finish: int): int list =
    let
        fun helperFunc(start: int, finish: int, acc: int list): int list =
            if start >= finish 
            then
                list_reverse(acc)
            else
                helperFunc(start + 1, finish, start :: acc)
    in
        helperFunc(start, finish, [])
    end

(* ****** ****** *)
val xs = list_range(1, 5)
val ys = list_range(1, 1)
(* end of [CS320-2023-Spring-assign03-02.sml] *)
