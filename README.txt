1. My algorithm uses a recursive backtracking approach. The steps
are as follows:
  1. Search for an unused slot. If none are found, we have a solution. (base case)
  2. Iterate 1 through 9 and see if any of these numbers when placed in the slot,
     leave the board in a valid state.
  3. If a valid number is found for the slot, recursively solve the new board
  4. It the recursive call returns failure, try the next number in the range.
