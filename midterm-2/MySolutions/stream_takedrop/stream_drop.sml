(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_drop(fxs, n) = ...
*)
fun 
stream_drop(fxs: 'a stream, n: int): 'a stream =
  let
    fun helper(fxs, num) =
      if num <= 0 then fxs
      else
        case fxs() of
          strcon_nil => stream_nil()
        | strcon_cons(_, fx) => helper(fx, num - 1)
  in
    helper(fxs, n)
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_drop.sml] *)
