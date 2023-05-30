(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

fun stringrev(cs: string): string = 
let
  fun reverse(cs: string, size: int, index: int): string = 
    if index < 0 then ""
  else
    String.substring(cs, index, 1) ^ reverse(cs, size, index -1)
in 
  reverse(cs, String.size cs, String.size cs -1)
end

(* test *)
val string1 = "Hello, World!"
val result = stringrev string1

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-05.sml] *)


