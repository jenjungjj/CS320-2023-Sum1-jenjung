(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-01: 10 points
//
Please implement a function
that computes the size of an xlist DIRECTLY:
//
fun xlist_size(xs: 'a xlist): int
//
That is, you should NOT convert xlist into list
and then compute the size of the converted list
//
*)

(* ****** ****** *)

datatype 'a xlist =
  xlist_nil
| xlist_cons of 'a * 'a xlist
| xlist_snoc of 'a xlist * 'a
| xlist_append of 'a xlist * 'a xlist
| xlist_reverse of 'a xlist

fun xlist_size(xs: 'a xlist): int =
  case xs of
    xlist_nil => 0
  | xlist_cons(_, xs) => 1 + xlist_size(xs)
  | xlist_snoc(xs, _) => xlist_size(xs) + 1
  | xlist_append(xs1, xs2) => xlist_size(xs1) + xlist_size(xs2)
  | xlist_reverse(xs) => xlist_size(xlist_reverse(xs))


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-01.sml] *)
