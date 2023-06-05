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
  make_string(strings: string, integer: int): string =
  if integer = 1 then ""
  else make_string(strings, integer -1) ^ str(chr(ord(String.sub(strings,integer-1))))
  
  fun 
  tenth(number: int): int =
  if number < 1 then 1
  else 10*tenth(number-1)

  fun 
  make_integer(strings: string): int =
  let 
  val s0 = ord(String.sub(strings, 0))-48
  val string_size = String.size(strings)
  in
  if s0 < 0 orelse s0 > 10 then raise None
  else if string_size = 1 then s0 * tenth(string_size -1 )
  else 
    s0 * tenth(string_size -1) + make_integer(make_string(strings, string_size))
  end

in
  if cs = "" then NONE 
  else SOME (make_integer(cs)) handle None => NONE

end
			
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-04.sml] *)
