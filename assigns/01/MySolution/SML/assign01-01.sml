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
(*
datatype 'a xlist =
  xlist_nil
| xlist_cons of 'a * 'a xlist
| xlist_snoc of 'a xlist * 'a

fun xlist_size(xs: 'a xlist): int =
  case xs of
    xlist_nil => 0
  | xlist_cons(_, xs) => 1 + xlist_size(xs)
  | xlist_snoc(xs, _) => xlist_size(xs) + 1
*)
datatype 'a xlist =
  xlist_nil
| xlist_cons of 'a * 'a xlist
| xlist_snoc of 'a xlist * 'a

fun xlist_size(xs: 'a xlist): int =
  let
    fun xlist_length_helper(xs: 'a xlist, acc: int): int =
      case xs of
        xlist_nil => acc
      | xlist_cons(_, xs) => xlist_length_helper(xs, acc + 1)
      | xlist_snoc(xs, _) => xlist_length_helper(xs, acc + 1)
  in
    xlist_length_helper(xs, 0)
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-01.sml] *)
