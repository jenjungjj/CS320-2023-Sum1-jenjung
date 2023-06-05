(* ****** ****** *)

use "./../../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
(*
HX-2023-02-07: 60 points
*)
(* ****** ****** *)

type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int

(* ****** ****** *)

(*
The following function int5_sort
is based on ListMergeSort.sort, which is
defined recursively. Given a tuple of 5
integers, int5_sort returns an ordered tuple
of the same 5 integers. For instance,
int5_sort(1, 2, 1, 2, 2) = (1, 1, 2, 2, 2)
int5_sort(3, 1, 2, 5, 2) = (1, 2, 2, 3, 5)
int5_sort(3, 1, 2, 5, 4) = (1, 2, 3, 4, 5)
*)

(*
val
int5_sort =
fn(xs: int5): int5 =
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys)
in
  (y1, y2, y3, y4, y5)
end
*)

(* ****** ****** *)
(*
Please give a non-recursive implementation of int5_sort
as int5_sort_nr. That is, please implement int5_sort_nr
in a non-recursive manner such that int5_sort(xs) equals
int5_sort_nr(xs) for every 5-tuple xs of the type int5.
*)
(* ****** ****** *)


val
int2_sort_nr =
<<<<<<< HEAD
fn(xs: int2): int2 => 
  let
    val(x1, x2) = xs
  in
    if x1 <= x2 then (x1, x2) else (x2, x1) 
  end 
=======
fn(xs: int2): int2 =>
   let
       val (x1, x2) = xs
   in
       if x1 <= x2 then (x1, x2) else (x2, x1)
   end
>>>>>>> upstream/main

(* ****** ****** *)

val 
int3_sort_nr =
fn (xs: int3): int3 =>
    let
      val(x1, x2, x3) = xs
      val(sorted1, sorted2) = int2_sort_nr (x1, x2)
      val(min, sorted3) = int2_sort_nr (sorted1, x3)
      val(middle, max) = int2_sort_nr(sorted2, sorted3)
    in
      (min, middle, max)
    end

val test02 = int3_sort_nr(8, 3, 5)

(* ****** ****** *)

val 
int4_sort_nr =
fn (xs: int4): int4 =>
    let
      val (x1, x2, x3, x4) = xs
      val (sorted1, sorted2) = int2_sort_nr (x1, x2)
      val (sorted3, sorted4) = int2_sort_nr (x3, x4)
      val (min, middle1) = int2_sort_nr (sorted1, sorted3)
      val (middle2, max) = int2_sort_nr (sorted2, sorted4)
      val(mid1, mid2) = int2_sort_nr(middle1, middle2)
    in
      (min, mid1, mid2, max)
    end

val test01 = int4_sort_nr(2, 4, 6, 1)
(* ****** ****** *)


val 
int5_sort_nr =
fn (xs: int5): int5 =>
    let
      val (x1, x2, x3, x4, x5) = xs
      val (sorted1, sorted2, sorted3, sorted4) = int4_sort_nr(x1, x2, x3, x4)
      val (num1, num2) = int2_sort_nr(sorted1, x5)
      val (num3, num4) = int2_sort_nr(num2, sorted2)
      val (num5, num6) = int2_sort_nr(num4, sorted3)
      val (num7, num8) = int2_sort_nr(num6, sorted4)
    in
      (num1, num3, num5, num7, num8)
    end

(* ****** ****** *)
val test03 = int5_sort_nr(2, 3, 6, 4, 1)
val test04 = int5_sort_nr(2, 1, 4, 5, 3)
val xs2 = int5_sort_nr(2,3,4,4,1)
val xs3 = int5_sort_nr(3,2,4,2,3)
val xs4 = int5_sort_nr(3, 2, 7, 4, 5)
(* end of [CS320-2023-Sum1-quiz01-int5_sort_nonrec.sml] *)
