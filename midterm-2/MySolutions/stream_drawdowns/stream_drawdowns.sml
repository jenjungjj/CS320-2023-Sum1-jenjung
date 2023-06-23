(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// a stream fxs of integers and returns a stream consisting
// of all the maximal drawdowns in fxs.
//
*)

(* ****** ****** *)

(*
fun
stream_drawdowns
(fxs: int stream): int list stream = ...
*)

fun
stream_drawdowns
(fxs: int stream): int list stream = 
   let
     fun find_drawdowns(_, []) = 
        cons([], fn() => 
           find_drawdowns(fxs, []))
        |  find_drawdowns(prev, x :: xs) = 
           if x < prev then
            let
              val drawdowns = x :: fn(y => y >= x) xs
            in 
              cons(drawdowns.fn() => find_drawdowns(x, xs))
            end
           else
             find_drawdowns(x, xs)
    in 
      find_drawdowns(Int.minInt, fxs)
    end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-stream_drawdowns.sml] *)
