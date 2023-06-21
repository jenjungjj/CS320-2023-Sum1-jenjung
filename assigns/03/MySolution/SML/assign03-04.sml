(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

(*
val the_ln2_stream: real stream = fn() => ...
*)

fun ln2_stream_helper (xs: int, prev: real): real strcon =
    let
      fun current(): real =
        if xs mod 2 = 0 then prev - 1.0 / Real.fromInt(xs)
        else prev + 1.0 / Real.fromInt(xs)
      val nextStream = fn () => ln2_stream_helper(xs + 1, current())
    in
      strcon_cons(current(), nextStream)
    end

val the_ln2_stream: real stream = fn () =>
    ln2_stream_helper(1, 0.0)







(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-04.sml] *)
