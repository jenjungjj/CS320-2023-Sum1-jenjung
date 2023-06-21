(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

(*
val theNatPairs: (int*int) stream = fn () => ...
*)


val theNatPairs: (int * int) stream = fn () =>
  let
    fun pairSumLess ((i1, j1), (i2, j2)) =
      i1 + j1 < i2 + j2

    val allPairs = stream_concat (stream_tabulate (10000, fn i =>
      stream_make_map (int1_streamize (i + 1), fn j => (i - j, j))
    ))

    val sortedPairs = stream_make_filter (allPairs, fn p => true)

  in
    sortedPairs ()
  end





(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-05.sml] *)
