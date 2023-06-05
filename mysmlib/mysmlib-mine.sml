(* ****** ****** *)
(*
HX-2023-05-23:
Library functions
for BUCASCS320-2023-Sum1
This is a class-wide library,
that is, it is shared by the class.
*)
(* ****** ****** *)

val int_max = Int.max
val int_min = Int.min

(* ****** ****** *)

type 'a optn = 'a option

(* ****** ****** *)

exception
ERROR320 of string optn

(* ****** ****** *)

exception ConsMatch320
exception OptnSubscript320
exception ListSubscript320

(* ****** ****** *)

exception NotImplemented320

(* ****** ****** *)

fun
assert320
(claim: bool): unit =
if claim
  then () else raise ERROR320(NONE)
(* end of [assert320] *)

fun
assert320_some
(claim: bool, errmsg: string): unit =
if claim
  then () else raise ERROR320(SOME(errmsg))
(* end of [assert320_some] *)

(* ****** ****** *)

val abs_int =
fn(i0: int) =>
if i0 >= 0 then i0 else ~i0

(* ****** ****** *)

(*
fun
pow_int_int
(x: int, y: int): int =
if y <= 0
then 1 else x * pow_int_int(x, y-1)
*)
fun
pow_int_int
(x: int, y: int): int =
let
  fun loop(y: int, res: int): int =
    if y > 0
    then loop(y-1, x * res) else res
in
  loop(y, 1)
end

(* ****** ****** *)

fun
char_of_digit
(digit: int): char =
let
  val () =
  assert320_some
  (digit >= 0, "int2char")
  val () =
  assert320_some
  (digit <= 9, "int2char")
in
  chr(ord(#"0") + digit)
end (* end of [char_of_digit] *)

(* ****** ****** *)

fun
print_int
(x: int) = print(Int.toString(x))
fun
print_char
(c: char) = print( String.str(c) )

(* ****** ****** *)
fun
print_bool
(x: bool) = print(Bool.toString(x))
(* ****** ****** *)

fun
print_string(cs: string) = print(cs)

(* ****** ****** *)

fun
print_newline() = print("\n")
fun
println(cs) = (print(cs); print_newline())
fun
println_string(cs) = (print(cs); print_newline())

(* ****** ****** *)

fun
list_is_nil(xs: 'a list): bool =
(
case xs of nil => true | _ :: _ => false)
fun
list_is_cons(xs: 'a list): bool =
(
case xs of nil => false | _ :: _ => true)

(* ****** ****** *)

fun
list_unnil(xs: 'a list): unit =
(
case xs of nil => () | _ => raise ConsMatch320)
fun
list_uncons(xs: 'a list): 'a * 'a list =
(
case xs of
x1 :: xs => (x1, xs) | _ => raise ConsMatch320)

(* ****** ****** *)

fun
optn_is_none(xs: 'a optn): bool =
(
case xs of NONE => true | SOME _ => false)
fun
optn_is_some(xs: 'a optn): bool =
(
case xs of NONE => false | SOME _ => true)

(* ****** ****** *)

fun
optn_unnone(xs: 'a optn): unit =
(
case xs of NONE => () | _ => raise ConsMatch320)
fun
optn_unsome(xs: 'a optn): 'a =
(
case xs of SOME x0 => x0 | _ => raise ConsMatch320)

(* ****** ****** *)

(*
fun
list_length
(xs: 'a list): int =
(
case xs of
  nil => 0
| head :: tail => 1 + list_length(tail)
)
*)

fun
list_length
(xs: 'a list): int =
let
  fun
  loop
  (xs: 'a list, res: int): int =
  case xs of
    nil => res
  | _ :: xs => loop(xs, res+1)
in
  loop(xs, 0)
end (* end of [list_length(xs)]: let *)

(* ****** ****** *)

fun
list_extend
(xs: 'a list, x0: 'a): 'a list =
(
case xs of
  nil => [x0]
| x1 :: xs => x1 :: list_extend(xs, x0)
)

(* ****** ****** *)

fun
list_head(xs: 'a list): 'a =
case xs of
  nil => raise Empty | x1 :: _ => x1
fun
list_tail(xs: 'a list): 'a list =
case xs of
  nil => raise Empty | _ :: xs => xs

val hd = list_head (* hd is an alias *)
val tl = list_tail (* tl is an alias *)

(* ****** ****** *)

(*
datatype 'a optn = NONE | SOME of 'a
*)
fun
list_headopt(xs: 'a list): 'a optn =
case xs of
  nil => NONE | x1 :: _ => SOME(x1)
fun
list_tailopt(xs: 'a list): 'a list optn =
case xs of
  nil => NONE | _ :: xs => SOME(xs)

(* ****** ****** *)

(*
fun
list_last(xs: 'a list): 'a =
case xs of
  nil => raise Empty
| x1 :: xs =>
  (case xs of nil => x1 | _ => list_last(xs))
*)
fun
list_last(xs: 'a list): 'a =
let
  fun loop(x1, xs) =
  (case xs of
     nil => x1
   | x2 :: xs => loop(x2, xs))
in
  case xs of
    nil => raise Empty | x1 :: xs => loop(x1, xs)
end

(* ****** ****** *)

fun
list_append
(xs: 'a list, ys: 'a list): 'a list =
(
case xs of
  nil => ys
| x1 :: xs => x1 :: list_append(xs, ys)
)

val op@ = list_append
  
(* ****** ****** *)

fun
list_fromto
(start: int, finish: int): int list =
let
  fun
  loop
  (finish: int, res: int list): int list =
  if start < finish
  then loop(finish-1, (finish-1) :: res) else res
in
  loop(finish, [(*nil*)])
end

(* ****** ****** *)

(*
fun
list_reverse(xs: 'a list): 'a list =
(
case xs of
  nil => nil
| x1 :: xs => list_reverse(xs) @ [x1]
)
*)
fun
list_rappend
(xs: 'a list, ys: 'a list): 'a list =
(
case xs of
  nil => ys
| x1 :: xs => list_rappend(xs, x1 :: ys)
)

(* ****** ****** *)

fun
list_reverse
(xs: 'a list): 'a list = list_rappend(xs, [])

(* ****** ****** *)

(*
(*
This is an inefficient tail-recursive
implementation of list_append as it traverses
the first argument TWICE.
*)
fun
list_append
( xs: 'a list
, ys: 'a list): 'a list =
(
  case ys of
    nil => ys
  | _ => list_rappend(list_reverse(xs), ys) )
*)

(* A Swiss army's knife for left-handed
*)
fun 
list_foldl
(xs: 'a list, r0: 'a, fopr: 'r * 'a -> 'r) 
(* fopr is a first order function and 
a function that takes a first order function as its argument is a second order funtion *)
(
  case xs of 
    nil => r0
  | x1 :: xs => list_foldl(xs, fopr(r0, x1), fopr)
)

(* A Swiss army's knife for right handed
*)
fun 
list_foldr
(xs: 'a list, r0: 'r, fopr: 'a * 'r -> 'r) 
(* fopr is a first order function and 
a function that takes a first order function as its argument is a second order funtion *)
(
  case xs of 
    nil => r0
  | x1 :: xs => fopr(z1, list_foldr(xs, r0, fopr))
)
(*
this list_foldr implementation is tail-recursive 
*)
fun 
list_foldr
(xs: 'a list, r0: 'r, fopr: 'a * 'r -> 'r) =
list_foldl(list_reverse(xs), r0, fn(r, x) => fopr(x, r)) 

fun list_length
(xs: 'a list): int = 
list_foldl(xs, 0, fn(r, x) => r + 1) 

fun
list_append
(xs: 'a list, x0: 'a): 'a list =
list_foldr(xs, ys, fn(x, r) => x :: r)

fun
list_rappend
(xs: 'a list, x0: 'a): 'a list =
list_foldl(xs, ys, fn(x, r) => x :: r)

(* ****** ****** *)

fun list_map(xs: 'apple list, 
fopr: 'apple -> 'banana): 'banana list =
list_foldr(xs, [], fn(x, r) => fopr(x) :: r) 

(* ****** ****** *)

fun 
string_foldl
(xs: string, 
r0: 'r, fopr:'r * char -> 'r): 'r =  (* char b/c string is a sequence of characters *)
let 
  val ln = Sting.size(xs)
  fun loop(i0: int, r0: 'r): 'r = 
    if i0 < ln then 
    loop(i0+1, fopr(String.sub(xs, i0), r0)) else r0  
in
  loop(0, r0) 
end

(* ****** ****** *)

fun 
string_length(xs) = 
string_foldl(xs, 0, fn(r, x) => r + 1) 

(* ****** ****** *)

(* ****** ****** *)

(* ****** ****** *)

(* end of [BUCASCS320-2023-Sum1-mysmlib-cls.sml] *)
