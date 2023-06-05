####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign01-lib.sml)
#
####################################################
def mylist_mergesort(xs):
    def split(xs):
        if mylist_nilq(xs):
            return (mylist_nil(), mylist_nil())
        else:
            x1 = xs.cons1
            xs_rest = xs.cons2
            if mylist_nilq(xs_rest):
                return (mylist_cons(x1, mylist_nil()),mylist_nil())
            else:
                x2 = xs_rest.cons1
                xs_rest = xs_rest.cons2
                (ys, zs) = split(xs_rest)
                return (mylist_cons(x1,ys), mylist_cons(x2,zs))


    def merge(ys, zs):
        if mylist_nilq(ys):
            return zs
        else: 
            y1 = ys.cons1
            ys_rest = ys.cons2
            if mylist_nilq(zs):
                return (mylist_cons(y1, ys_rest))
            else:
                z1 = zs.cons1
                zs_rest = zs.cons2
                if (y1 <= z1):
                    return (mylist_cons(y1, merge(ys_rest, mylist_cons(z1,zs_rest))))
                else:
                    return (mylist_cons(z1, merge(mylist_cons(y1, ys_rest),zs_rest)))
    
    if mylist_nilq(xs):
        return mylist_nil()
    else:
        x1 = xs.cons1
        xs_rest = xs.cons2
        if mylist_nilq(xs_rest):
            return mylist_cons(x1, mylist_nil())
        else:
            x2 = xs_rest.cons1
            xs_rest = xs_rest.cons2
            ys, zs = split(xs_rest)
            return merge(mylist_mergesort(mylist_cons(x1, ys)),mylist_mergesort(mylist_cons(x2, zs)))
    
