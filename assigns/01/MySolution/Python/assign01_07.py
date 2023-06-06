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
            x1 = xs.get_cons1()
            x2 = xs.get_cons2()
            if mylist_nilq(x2):
                return (mylist_cons(x1, mylist_nil()),mylist_nil())
            else:
                y1 = x2.get_cons1()
                y2 = x2.get_cons2()
                (ys, zs) = split(y2)
                return (mylist_cons(x1,ys), mylist_cons(y1,zs))


    def merge(ys, zs):
        if mylist_nilq(ys):
            return zs
        else: 
            y1 = ys.get_cons1()
            y2 = ys.get_cons2()
            if mylist_nilq(zs):
                return (mylist_cons(y1, y2))
            else:
                z1 = zs.get_cons1()
                z2 = zs.get_cons2()
                if (y1 <= z1):
                    return (mylist_cons(y1, merge(y2, mylist_cons(z1,z2))))
                else:
                    return (mylist_cons(z1, merge(mylist_cons(y1, y2),z2)))
    
    if mylist_nilq(xs):
        return mylist_nil()
    else:
        x1 = xs.get_cons1()
        x2 = xs.get_cons2()
        if mylist_nilq(x2):
            return mylist_cons(x1, mylist_nil())
        else:
            y1 = x2.get_cons1()
            y2 = x2.get_cons2()
            ys, zs = split(y2)
            return merge(mylist_mergesort(mylist_cons(x1, ys)),mylist_mergesort(mylist_cons(y1, zs)))
    
