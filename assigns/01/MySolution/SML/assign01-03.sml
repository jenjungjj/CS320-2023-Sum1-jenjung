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
        fun reverseHelper(Nil, acc) = acc
          | reverseHelper(Cons(x, tl), acc) = reverseHelper(tl(), Cons(x, acc))
          | reverseHelper(_, _) = raise XlistReverseError

        fun removeReverseHelper(Nil, acc) = reverseHelper(acc, Nil)
          | removeReverseHelper(Cons(x, tl), acc) = removeReverseHelper(tl(), Cons(x, acc))
          | removeReverseHelper(_, _) = raise XlistReverseError
    in
        removeReverseHelper(xs, Nil)
    end

					   
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-03.sml] *)
