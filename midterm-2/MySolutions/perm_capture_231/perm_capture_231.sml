(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of in satisfying
c < a < b. Note that a, b, and c doe not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)

(*
fun
perm_capture_231
(xs: int list): bool = ...
*)
fun triplet(xs, ys, zs) =
    let
      val x = list_head(xs)
      val y = list_head(ys)
      val z = list_head(zs)
    in
      (x, y, z) :: triplet(list_tail(xs), list_tail(ys), list_tail(zs))
    end

fun drop (n, xs) =
  if n <= 0 then xs
  else
    drop(n - 1, list_tail(xs))

fun perm_capture_231(xs: int list): bool =
  let
    val grouped = triplet(xs, drop (1, xs), drop (2, xs))
  in
    list_exists(fn (a, b, c) => c < a andalso a < b) grouped
  end handle _ => false
(* ****** ****** *)




(* end of [CS320-2023-Sum1-midterm2-perm_capture_231.sml] *)
