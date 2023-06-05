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
        x1 = xs.cons1
        xs_rest = xs.cons2
        return mylist_cons(x1, mylist_append(xs_rest, ys))

def mylist_rappend(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        x1 = xs.cons1
        xs_rest = xs.cons2
        return mylist_cons(x1, mylist_append(xs_rest, ys))

def mylist_reverse(xs):
    if mylist_nilq(xs):
        return ys
    return mylist_rappend(xs, mylist_nil())
