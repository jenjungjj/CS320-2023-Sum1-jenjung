datatype weekday = 
    Monday | Tuesday | Wednesday | Thursday | Friday 

fun print_weekday(wday: weekday): unit = 
    case wday of 
        Monday => print "Monday"    (* pattern matching caluse similar to switch statement *) 
    |   Tuesday => print "Tuesday"
    |   _ => print "Whatever"   

fun intdiv(x: int, y: int): int option = 
    if y <> 0 then SOME(x div y) else NONE 

fun use_intdiv(x: int, y: int): unit = 
    let 
        val opt = intdiv(x, y) 
    in
        case opt of 
            NONE => print "The divider y is zero!!" 
        |   SOME res => print ("The result equals " ^ Int.toString(res) ^ "\n")
    end 