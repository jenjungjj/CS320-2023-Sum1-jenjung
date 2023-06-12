(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list = 
*)

(*)
fun list_longest_ascend(xs: int list): int list =
  let
    fun helper(xs: int list): int list =
      case xs of
        [] => []
      | x :: xs' =>
          let
            val res1 = helper(List.filter (fn y => y >= x) xs')
          in
            if List.length(x :: res1) >= List.length(helper(xs'))
            then x :: res1
            else helper(xs')
          end
  in
    helper(xs)
  end
*)
fun list_longest_ascend(xs: int list): int list =
  let
    fun helper(xs: int list): int list =
      case xs of
        [] => []
      | x :: xs' =>
          let
            val res1 = helper_filter(x, xs')
          in
            if List.length (x :: res1) >= List.length (helper xs')
            then x :: res1
            else helper xs'
          end

    fun helper_filter(x: int, xs: int list): int list =
      case xs of
        [] => []
      | y :: ys =>
          if y >= x then y :: helper_filter(x, ys)
          else helper_filter(x, ys)
  in
    helper xs
  end


(* ****** ****** *)
val xs = list_longest_ascend([1, 2, 3, 4, 5])
(* xs = [1, 2, 3, 4, 5] *)
val zs = list_longest_ascend([2, 1, 3, 3, 4, 4, 5])
(* zs = [1, 3, 3, 4, 4, 5] *)
val ms = list_longest_ascend([2, 1, 1, 3, 3, 2, 4, 4, 5])
(* ms = [1, 1, 3, 3, 2, 4, 4, 5] *) 
val ys = list_longest_ascend([5, 4, 3, 2, 1])
(* ys = [5] *)

(* end of [CS320-2023-Sum1-assign02-04.sml] *)
