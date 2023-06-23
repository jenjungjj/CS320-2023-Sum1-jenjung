(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_take(fxs, n) = ...
*)
fun 
stream_take(fxs: 'a stream, n: int): 'a stream =
  let
    fun helper(fxs, k) =
      if k <= 0 then stream_nil()
      else
        case fxs() of
          strcon_nil => stream_nil()
        | strcon_cons(x, fx) => stream_cons(x, helper(fx, k - 1))
  in
    helper(fxs, n)
  end
(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_take.sml] *)
