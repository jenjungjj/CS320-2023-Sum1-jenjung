####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-06-12: 10 points
# Please *translate* into Python the SML solution
# to word_neighbors (which is the one for Assign03-02)
#
def strsub(s, index):
    return s[index]

def string_length(s):
    return len(s)

def string_implode(lst):
    return ''.join(lst)

def string_filter(lst, fopr):
    return [ch for ch in lst if fopr(ch)]

def string_tabulate(length, fopr):
    return string_implode([fopr(i) for i in range(length)])

AB = "abcdefghijklmnopqrstuvwxyz"

def string_iforeach(lst, fopr):
    for ch in lst:
        fopr(ch)

def string_imap_list(cs, ifopr):
    result = []
    for i, ch in enumerate(cs):
        result.append(ifopr(i, ch))
    return result

    """
    Note that this function should returns a fnlist
    (not a pylist)
    Your implementation should be combinator-based very
    much like the posted solution.
    """
def neighbors(s: str, num: int, ch: str) -> str:
    def helper(index: int, c: str) -> str:
        return c if index != num else ch
    
    return ''.join(helper(i, c) for i, c in enumerate(s))

def word_neighbors(input: str) -> str:
    def processLetter(idx: int, letter: str) -> str:
        filteredStr = ''.join(c for c in AB if c != letter)
        return ''.join(neighbors(input, idx, h) for h in filteredStr)
    
    return ''.join(processLetter(i, c) for i, c in enumerate(input))


  
#
####################################################
