(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
int2real
coerces an int into a real:
*)
val int2real = Real.fromInt
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-01: 10 points
*)
(* ****** ****** *)
(*
Given a list of reals xs, list_averages(xs)
returns another list ys of reals such that:
ys[0] = xs[0] / 1.0
ys[1] = (xs[0] + xs[1]) / 2.0
ys[2] = (xs[0] + xs[1] + xs[2]) / 3.0
In general, ys[i] is the average of the first
(i+1) elements in xs.
//
For instance,
list_averages([]) = []
list_averages([1.0,2.0,3.0]) = [1.0,1.5,2.0]
list_averages([1.0,2.0,3.0,4.0]) = [1.0,1.5,2.0,2.5]
//
Note that you are allowed to define recursive
functions in your implementation of list_averages.
//
*)
(* ****** ****** *)

fun list_averages(xs: real list): real list =
  let
    val result = foreach_to_foldleft(list_foreach) (xs, ([], 0.0, 1.0), fn (acc, x) =>
      let
        val newAverage = (#2 acc + x) / (#3 acc)
        val newAcc = list_append (#1 acc, [newAverage])
        val newSum = #2 acc + x
        val newDivisor = #3 acc + 1.0
      in
        (newAcc, newSum, newDivisor)
      end
    )
  in
    #1 result
  end

(* ****** ****** *)
val xs = [1.0, 2.0, 3.0, 4.0, 5.0];
val ys = list_averages(xs);

(* end of [CS320-2023-Sum1-midterm1-list_averages.sml] *)
