(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-02: midterm-06: 20 points
//
Given a list of integers xs, list_grouping(xs)
returns a list of pairs (n, x) where n indicates
the number of times x occurs in xs; for each x in
xs, there must be a pair (n, x) for some n in the
returned list.
//
For instance,
list_grouping([1,2]) = [[1,1], [1,2]]
list_grouping([1,2,2,2,1]) = [[2,1], [3,2]]
list_grouping([1,2,1,2,3]) = [[2,1], [2,2], [1,3]]
//
In order to receive full credit, your implementation
should be able to handle a list containing 1M elements
in less than 10 seconds (mine can do it in less than
two seconds)
//
*)
(* ****** ****** *)
(*
IF YOU WANT TO SORT A LIST, YOU MUST IMPLEMENT
SOME SORTING FUNCTION ON YOUR OWN. Your implementation
is not allowed to make use of library functions except
those in the library for this class.
*)
(* ****** ****** *)
(*
fun
list_grouping(xs: int list): (int * int) list = ...
*)
(* ****** ****** *)
(*
(*
Some testing code:
*)
val N = 1000
val nxs =
list_grouping(list_map(list_fromto(0, N), fn i => N-i))
*)
(* ****** ****** *)
(*
(*
Some testing code:
*)
Your implementation needs to be efficient to pass the
following test:
val N = 1000000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)
(* ****** ****** *)

fun merge([], ys) = ys
  | merge(xs, []) = xs
  | merge(x::xs, y::ys) =
      if x > y then  
        x :: merge(xs, y::ys)
      else
        y :: merge(x::xs, ys)

fun split xs =
  let
    fun splitHelper ([], accM, accN) = (List.rev accM, List.rev accN)
      | splitHelper ([a], accM, accN) = (List.rev (a :: accM), List.rev accN)
      | splitHelper (a :: b :: cs, accM, accN) = splitHelper(cs, a :: accM, b :: accN)
  in
    splitHelper(xs, [], [])
  end

fun mergesort [] = []
  | mergesort [a] = [a]
  | mergesort xs =
      let
        val (M, N) = split xs
      in
        merge(mergesort M, mergesort N)
      end

(*)
fun list_grouping(xs: int list): (int * int) list =
  let
    fun helper(a: (int * int) list, x: int, acc: (int * int) list): (int * int) list =
      if a = [] then
        (1, x) :: acc
      else if not(#2 (List.hd a) = x) then
        (1, x) :: acc
      else
        (#1 (List.hd a) + 1, #2 (List.hd a)) :: List.tl a @ acc
  in
    List.foldl (fn (x, a) => helper(a, x, [])) [] (mergesort xs)
  end
*)
fun list_grouping(xs: int list): (int * int) list =
  let
    fun helper(a: (int * int) list, x: int, acc: (int * int) list): (int * int) list =
      case a of
        [] => (1, x) :: acc
      | (count, value) :: rest =>
          if value = x then
            (count + 1, value) :: rest @ acc
          else
            (1, x) :: acc
  in
    List.foldl (fn (x, a) => helper(a, x, [])) [] (mergesort xs)
  end


(* ****** ****** *)

(*
Some testing code:
val N = 1000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*) 
(* ****** ****** *)
val N = 1000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
(* end of [CS320-2023-Sum1-midterm1-list_grouping.sml] *)
