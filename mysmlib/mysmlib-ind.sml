(* ****** ****** *)
(*
HX-2023-05-23:
Library functions
for BUCASCS320-2023-Sum1
This is an individual library,
that is, it is NOT shared by the class.
*)
(* ****** ****** *)
val
rec 
fact = fn(x: int) =>
if x > 0 then x * fact(x-1) else 1

fun
myloop(x: int): int = 
(fact(x); myloop(x+1)) handle Overflow => x

fun
isPrime(n0: int): bool = 
let
fun 
helper(i0: int): bool = 
if i0 >= n0
then true 
else if (n0 mod i0) <> 0 
  then helper(i0+1) else false 
in
if n0 <= 1 then false else helper(2) 
end 

fun
assert(claim: bool) = 
if not(claim)
  then raise MyAssertExn 
  else () 

fun
int2str
(x: int): string =
let
val _ = assert(x >= 0)
in
if x < 10
then
String.str(Char.chr((Char.ord(#"0") + x mod 10)))
else (* recursion *)
int2str(x div 10) ^
String.str(Char.chr((Char.ord(#"0") + x mod 10)))
end

fun helper_str2int(i0: int): int = 
  if i0 <= 0 then 0 else
  10 * helper(i0 -1) + 
  Char.ord(String.sub(cs, i0-1))-Char.ord(#"0")

fun reverse
  (cs: string, size: int, index: int): string = 
    if index < 0 
        then ""
  else
    String.substring(cs, index, 1) 
    ^ reverse(cs, size, index -1)

fun helper_xlist_remove_reverse(xs: 'a xlist, cond: bool): 'a xlist =
      case xs of
        xlist_nil => xlist_nil
      | xlist_cons(x, xs) => if cond then xlist_snoc(helper(xs, true), x) 
        else xlist_cons(x, helper(xs, false))
      | xlist_snoc(xs, x) => if cond then xlist_cons(x, helper(xs, true)) 
        else xlist_snoc(helper(xs, false), x)
      | xlist_append(xs1, xs2) => if cond then xlist_append(helper(xs2, true), helper(xs1, true)) 
        else xlist_append(helper(xs1, false), helper(xs2, false))
      | xlist_reverse(xs) => helper(xs, not cond)

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
(* ****** ****** *)
fun checkRoot(n: int): int =
            if f0 n = 0 then n
            else if f0 (~n) = 0 then ~n
            else if f0 (n + 1) = 0 then checkRoot(n + 1)
            else if f0 (~n - 1) = 0 then checkRoot(~n - 1)
            else checkRoot(n + 1)

fun helperFunc_list_range(start: int, finish: int, acc: int list): int list =
            if start >= finish 
            then
                list_reverse(acc)
            else
                helperFunc(start + 1, finish, start :: acc)

fun loop_list_tabulate(i: int, acc: 'a list): 'a list =
            if i >= n then list_reverse(acc)
            else loop(i + 1, f(i) :: acc)

fun greaterEqual([], _) = []
      | greaterEqual(x :: xs', y) =
          if x >= y 
          then x :: greaterEqual(xs', y)
          else greaterEqual(xs', y)

fun findLongestAscend([]) = []
      | findLongestAscend(x :: xs') =
          let
            val subseq1 = findLongestAscend(greaterEqual(xs', x))
            val subseq2 = findLongestAscend(xs')
          in
            if length(x :: subseq1) >= length(subseq2)
            then x :: subseq1
            else subseq2
          end

fun helper_neighbors(index, c) =
            if index <> num then c else ch

fun 
neighbors(str: string, num: int, ch: char): string =
    let
        fun helper_neighbors(index, c) =
            if index <> num then c else ch
    in
        string_implode (string_imap_list (str, helper_neighbors))
    end

fun processLetter(idx, letter) =
            let
                val filteredStr = string_filter (AB, fn z => z <> letter)
                fun helper(_, h) = neighbors (input, idx, h)

fun current(): real =
        if xs mod 2 = 0 then prev - 1.0 / Real.fromInt(xs)
        else prev + 1.0 / Real.fromInt(xs)

fun ln2_stream_helper (xs: int, prev: real): real strcon =
    let
      fun current(): real =
        if xs mod 2 = 0 then prev - 1.0 / Real.fromInt(xs)
        else prev + 1.0 / Real.fromInt(xs)
      val nextStream = fn () => ln2_stream_helper(xs + 1, current())
    in
      strcon_cons(current(), nextStream)
    end

fun pairSumLess ((i1, j1), (i2, j2)) =
      i1 + j1 < i2 + j2

val allPairs = stream_concat (stream_tabulate (10000, fn i =>
      stream_make_map (int1_streamize (i + 1), fn j => (i - j, j))

fun helper (lst: 'a stream list, n: int) =    (*stream_ziplst *)
      let
        val currentElems = List.map (fn stm => stream_get_at(stm, n)) lst
        val nextStream = fn () => helper (lst, n + 1)
      in
        strcon_cons (currentElems, nextStream)
      end

fun helperFactorial(num: int, number: int, output: int list): int list =
            if num > n then
                output
            else
                helperFactorial(num + 1, number * num, output @ [number])

fun compute_row(prev_row: int list): int list =
      [1] @ int1_foldleft(length prev_row - 1, [], fn (row, y) =>
        row @ [List.nth(prev_row, y) + List.nth(prev_row, y + 1)]
      ) @ [1]


fun groupHelper([], current, acc) = acc
      | groupHelper(x::rest, (count, value), acc) =
          if x = value then
            groupHelper(rest, (count + 1, value), acc)
          else
            groupHelper(rest, (1, x), (count, value)::acc)

fun reverse(acc, []) = acc
      | reverse(acc, x::rest) = reverse(x::acc, rest)

fun triplet(xs, ys, zs) =
    let
      val x = list_head(xs)
      val y = list_head(ys)
      val z = list_head(zs)
    in
      (x, y, z) :: triplet(list_tail(xs), list_tail(ys), list_tail(zs))
    end

fun drop (n, xs) =
  if n <= 0 then xs
  else
    drop(n - 1, list_tail(xs))

fun grab(0, _) = []
  | grab(_, []) = []
  | grab(n, x::xs) = x :: grab(n-1, xs)

fun drop(0, xs) = xs
  | drop(_, []) = []
  | drop(n, _::xs) = drop(n-1, xs)

fun helper([], _, ys) = 
  let
    val n = list_length(xs)
    val k' = if n = 0 then 0 else (k + k0) mod n
    val x = list_nth(xs, k')
    val xs' = grab(k', xs) @ drop(k' + 1, xs)
  in
    helper(xs', k', x :: ys)
  end

fun find_drawdowns(_, []) = 
  cons([], fn() => 
     find_drawdowns(fxs, []))
  |  find_drawdowns(prev, x :: xs) = 
     if x < prev then
      let
        val drawdowns = x :: fn(y => y >= x) xs
      in 
        cons(drawdowns.fn() => find_drawdowns(x, xs))
      end
    else
      find_drawdowns(x, xs)

fun real_power (x: real, n: int): real = 
      if n = 0 then 1.0
      else if n mod 2 = 0 then real_power (x * x, n div 2)
      else x * real_power(x * x, n div 2) 

fun helper_realpower(fxs, xn, n) = fn () =>
      case fxs() of
        strcon_nil => strcon_nil
      | strcon_cons(a, fxs') =>
        let
          val x1 = xn + a * real_power(x0, n)
        in
          strcon_cons(x1, helper_realpower(fxs', x1, n + 1))
        end

fun helper_stream_drop(fxs, num) =
      if num <= 0 then fxs
      else
        case fxs() of
          strcon_nil => stream_nil()
        | strcon_cons(_, fx) => helper_stream_drop(fx, num - 1)

fun helper_steam_take(fxs, k) =
      if k <= 0 then stream_nil()
      else
        case fxs() of
          strcon_nil => stream_nil()
        | strcon_cons(x, fx) => stream_cons(x, helper_stream_take(fx, k - 1))

(* end of [BUCASCS320-2023-Sum1-mysmlib-cls.sml] *)

(* end of [BUCASCS320-2023-Sum1-mysmlib-ind.sml] *)
