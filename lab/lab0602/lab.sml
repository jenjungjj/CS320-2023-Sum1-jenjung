datatype 'a mylist = 
    mynil
 |  mycons of 'a * 'a mylist 

val xs: int mylist = mynil  (* nil list means it's empty while cons list means there's an element *) 
val xs: int mylist = mycons (1 , mynil)
val xs: int mylist = mycons (1, xs) 

val ys: string mylist = mynil
val ys: string mylist = mycons ("", ys)
val ys: string mylist = mycons ("2", mycons ("1", mycons ("0", mynil)))

val zs: string list = []
val zs: string list = "2" :: zs     (* taking a string "2" and consing it into string list zs *) 
                                    (* :: acts same way as xs *)
val zs: string list = "2" :: "1" :: "0" :: [] (*line 11 and line 16 are mathematically equivalent *)
val zs: string list = ["2", "1", "0"] (* line 17 is also mathematically equivalent to line 16 *)

fun append (xs: 'a mylist, ys: 'a mylist): 'a myList = 
    case xs of 
        mynil => ys (* ys b/c we're trying to append ys into xs *) 
    |   mycons (x, xs0) => 
        mycons (x, append (xs0, ys)) 

fun mylist2string (xs: int mylist): string = 
    case xs of 
        mynil => "mynil"
    |   mycons (x, xs0) => 
        "mycons (" ^ Int.toString x ^ ", " ^ mylist2string xs0 ^ ")"

(*

1 2 3 4 5 6 
(1, 2, 3) (4, 5, 6)

*)
fun split (xs: int list): int list * int list = 
    case xs of
        [] => ys 
    |   x :: xs0 =>
        case ys of 
            [] => xs
        | y :: ys0 =>
          if x <= y then 
            x :: merge (xs0, ys)
          else
            y :: merge (xs, ys0)

fun merge( xs: int list, ys: int list): int list = 
    case (xs, ys) of 
    
