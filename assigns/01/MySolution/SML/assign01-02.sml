(* ****** ****** *)
use "./../../assign01-lib.sml";
(* ****** ****** *)
use "./../../MySolution/SML/assign01-01.sml";
(* ****** ****** *)

(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

(* ****** ****** *)


exception XlistSubscript

fun xlist_sub(xs: 'a xlist, i0: int): 'a =
    let
        fun subHelper(Nil, _) = raise XlistSubscript
          | subHelper(Cons(x, _), 0) = x
          | subHelper(Cons(_, tl), i) = subHelper(tl(), i - 1)
          | subHelper(_, _) = raise XlistSubscript
    in
        if i0 < 0 then
            raise XlistSubscript
        else
            subHelper(xs, i0)
    end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-02.sml] *)
