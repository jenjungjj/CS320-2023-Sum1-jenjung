(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

fun
stringrev
(cs: string): string = 
let
    fun revHelper
    (cs: string, size: int, index: int): string =
        if index < 0 then
            " "
        else
            String.substring(cs, index, 1) ^
            revHelper(cs, size, index -1)
in
    revHelper(cs, String.size cs, String.size cs -1) 

end

(* ****** ****** *)
val reversed = stringrev("Hello, World!")

(* end of [CS320-2023-Spring-assign00-05.sml] *)
