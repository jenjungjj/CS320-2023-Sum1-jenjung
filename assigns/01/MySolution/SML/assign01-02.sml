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
fun
xlist_sub
(xs: 'a xlist, i0: int): 'a = 

    if i0 < 0 orelse i0 >= xlist_size(xs) then raise XlistSubscript

    else
    case xs of xlist_nil => raise XlistSubscript
    |  xlist_cons(x1, xs) => 
        if i0 = 0 then x1
        else xlist_sub(xs, i0-1)
    |  xlist_snoc(xs_rest, x1) => 
        if i0 = xlist_size(xs)-1 then x1
        else xlist_sub(xs_rest, i0)
    |  xlist_append(xs, ys) => 
        if i0 < xlist_size(xs) then xlist_sub(xs, i0)
        else xlist_sub(ys, i0 - xlist_size(xs))
    |  xlist_reverse(xs) => 
        xlist_sub(xs, xlist_size(xs)-1-i0)
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-02.sml] *)
