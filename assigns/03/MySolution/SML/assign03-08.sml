(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

fun stream_ziplst (xs: 'a stream list): 'a list stream =
  let
    fun helper (lst: 'a stream list, n: int) =
      let
        val currentElems = List.map (fn stm => stream_get_at(stm, n)) lst
        val nextStream = fn () => helper (lst, n + 1)
      in
        strcon_cons (currentElems, nextStream)
      end
      handle Subscript => strcon_nil
  in
    fn () => helper (xs, 0)
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-08.sml] *)
