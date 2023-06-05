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

def list_append(xs, ys):
    if xs == []:
        return ys
    else:
        return [xs[0]] + list_append(xs[1:], ys)

def list_rappend(xs, ys):
    if xs == []:
        return ys
    else:
        return list_rappend(xs[1:], [xs[0]] + ys)

def list_reverse(xs):
    def list_rappend(xs, ys):
        if xs == []:
            return ys
        else:
            return list_rappend(xs[1:], [xs[0]] + ys)
    
    return list_rappend(xs, [])
