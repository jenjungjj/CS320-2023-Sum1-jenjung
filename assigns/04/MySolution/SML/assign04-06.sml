(* ****** ****** *)
(*
HX-2023-06-20: 10 points
*)
(* ****** ****** *)

(*
Please *translate* the following function
list_merge2 into list_kmerge2, where the latter
is of the so-called continuation-passing style (CPS)
*)

(* ****** ****** *)

(*
fun
list_merge2
(xs1: int list
,xs2: int list): int list =
(
case xs1 of
  nil => xs2
| x1 :: xs1 =>
(
case xs2 of
  nil => x1 :: xs1
| x2 :: xs2 =>
  if
  (x1 <= x2)
  then x1 :: list_merge2(xs1, x2 :: xs2)
  else x2 :: list_merge2(x1 :: xs1, xs2)
)
)
*)

(* ****** ****** *)

(*
fun
list_kmerge2
(xs1: int list
,xs2: int list, ret: int list -> 'a): 'a = ...
*)

fun
list_kmerge2
(xs1: int list
,xs2: int list, ret: int list -> 'a): 'a =
let
  fun helper(xs1, xs2, k) =
    case xs1 of
      nil => k xs2
    | x1 :: xs1' =>
      case xs2 of
        nil => k (x1 :: xs1')
      | x2 :: xs2' =>
        if x1 <= x2 then
          helper(xs1', xs2, fn result => k (x1 :: result))
        else
          helper(xs1, xs2', fn result => k (x2 :: result))
in
  helper(xs1, xs2, ret)
end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign04-06.sml] *)
