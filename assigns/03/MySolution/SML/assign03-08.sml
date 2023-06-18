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
fun 
stream_ziplst (streams: 'a stream list): 'a list stream =
  let
    fun zip_streams [] = Stream.empty()
      | zip_streams (stream::rest) =
          Stream.zip(stream, zip_streams rest, op::)
          |> Stream.map (fn (x, xs) => x::xs)
  in
    zip_streams streams
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-08.sml] *)
