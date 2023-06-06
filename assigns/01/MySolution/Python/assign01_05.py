####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../assign01_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign01-lib.sml)
# mylist_rappend (see list_rappend in assign01-lib.sml)
# mylist_reverse (see list_reverse in assign01-lib.sml)
#
####################################################

def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        x1 = xs.get_cons1()
        x2 = xs.get_cons2()
        return mylist_cons(x1, mylist_append(x2, ys))

def mylist_rappend(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        x1 = xs.get_cons2()
        x2 = xs.get_cons1()
        return mylist_rappend(x1, mylist_cons(x2, ys))

def mylist_reverse(xs):
    def num_reverse(xs, ys):
        if mylist_nilq(xs):
            return ys
        else:
            x1 = xs.get_cons2()
            x2 = xs.get_cons1()
            return num_reverse(x1, mylist_cons(x2, ys))
    return num_reverse(xs, mylist_nil()) 

    

