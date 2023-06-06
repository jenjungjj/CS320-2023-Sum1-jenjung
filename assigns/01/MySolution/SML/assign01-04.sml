(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

(* ****** ****** *)

fun
str2int_opt(cs: string): int option = 
let
  exception None

  fun
  to_string(x1: string, y1: int): string =
  if y1 = 1 then ""
  else to_string(x1, y1 -1) ^ String.str(Char.chr(Char.ord(String.sub(x1,y1-1))))
  
  fun 
  tenth(x1: int): int =
  if x1 < 1 then 1
  else 10 * tenth(x1-1)

  fun 
  to_integer(x1: string): int =
  let 
    val s0 = Char.ord(String.sub(x1, 0))-48
    val x1_size = String.size(x1)
  in
  if s0 < 0 orelse s0 > 10 then raise None
  else if x1_size = 1 then 
    s0 * tenth(x1_size -1)
  else 
    s0 * tenth(x1_size -1) + to_integer(to_string(x1, x1_size))
  end

in
  if cs = "" then NONE 
  else SOME (to_integer(cs)) handle None => NONE

end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-04.sml] *)
