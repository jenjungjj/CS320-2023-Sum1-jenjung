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

fun list_longest_ascend(xs: int list): int list =
  let
    fun greaterEqual([], _) = []
      | greaterEqual(x :: xs', y) =
          if x >= y 
          then x :: greaterEqual(xs', y)
          else greaterEqual(xs', y)

    fun findLongestAscend([]) = []
      | findLongestAscend(x :: xs') =
          let
            val subseq1 = findLongestAscend(greaterEqual(xs', x))
            val subseq2 = findLongestAscend(xs')
          in
            if length(x :: subseq1) >= length(subseq2)
            then x :: subseq1
            else subseq2
          end
  in
    findLongestAscend(xs)
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
val ps = list_longest_ascend([4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1])
(* ps = [1, 1, 1, 1, 1, 1, 1, 1, 1] *)
(* end of [CS320-2023-Sum1-assign02-04.sml] *)
