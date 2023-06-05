(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'xlist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'xlist_reverse'
3. 'xs' and 'ys' use the same number of 'xlist_append'
//
*)
  
(* ****** ****** *)

fun
xlist_remove_reverse
(xs: 'a xlist): 'a xlist = 
let
  fun
  helper(xs: 'a xlist, switch: bool): 'a xlist =

  case xs of xlist_nil => xlist_nil
  |  xlist_cons(x1, xs) => 
        if switch = true then xlist_snoc(helper(xs, true), x1)
        else xlist_cons(x1, helper(xs, false))
  |  xlist_snoc(xs, x1) =>
        if switch = true then xlist_cons(x1, helper(xs, true))
        else xlist_snoc(helper(xs, false), x1)
  |  xlist_append(xs, ys) => 
        if switch = true then xlist_append(helper(ys, true), helper(xs, true))
        else xlist_append(helper(xs, false), helper(ys, false))
  |  xlist_reverse(xs) => helper(xs, not switch)
in
  helper(xs, false)
end

					   
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-03.sml] *)
