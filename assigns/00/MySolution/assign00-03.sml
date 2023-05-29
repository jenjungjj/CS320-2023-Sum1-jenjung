(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

exception MyAssertExn

fun
assert(claim: bool) = 
if not (claim)
then raise MyAssertExn
else ()

(* ****** ****** *)

fun
int2str
(x: int): string = 
let

val_ = assert(x >= 0)   (*defensive programming to check if function is defined or not*) 

in

if x < 10
then 
String.chr(Char.chr((Char.ord(#"0") + x mod 10)))
else (* recursion *)
int2str (x div 10) ^
String.chr(Char.chr((Char.ord(#"0") + x mod 10)))     (* char tunrs integer into character *)

end

(* ****** ****** *)

val myans2 = int2str(12345)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-03.sml] *)
