####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
"""
//
HX-2023-06-12: 20 points
Solving the N-queen puzzle
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
"""
"""
######
A board of size N is a tuple of length N.
######
For instance, a tuple (0, 0, 0, 0) stands
for a board of size 4 (that is, a 4x4 board)
where there are no queen pieces on the board.
######
For instance, a tuple (2, 1, 0, 0) stands
for a board of size 4 (that is, a 4x4 board)
where there are two queen pieces; the queen piece
on the 1st row is on the 2nd column; the queen piece
on the 2nd row is on the 1st column; the last two rows
contain no queen pieces.
######
This function [solve_N_queen_puzzle] should return
a stream of ALL the boards of size N that contain N
queen pieces (one on each row and on each column) such
that no queen piece on the board can catch any other ones
on the same board.
"""
####################################################
# def solve_N_queen_puzzle(N):
def solve_N_queen_puzzle(N):
    def is_safe(board, row, col):
        for i in range(row):
            if board[i] == col or board[i] - col == i - row or board[i] - col == row - i:
                return False
        return True

    def helper(board, row):
        if row == N:
            yield board.copy()
        else:
            for col in range(N):
                if is_safe(board, row, col):
                    board[row] = col
                    yield from helper(board, row + 1)
                    board[row] = -1

    initial_board = [-1] * N
    return generator_of_stream(stream_make_filter(generator_tabulate(N, lambda _: initial_board), lambda board: board[N - 1] != -1))




####################################################
