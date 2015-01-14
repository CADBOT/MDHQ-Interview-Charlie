1. My algorithm uses a recursive backtracking approach. The steps
are as follows:
  1. Search for an unused slot. If none are found, we have a solution. (base case)
  2. Iterate 1 through 9 and see if any of these numbers when placed in the slot,
     leave the board in a valid state.
  3. If a valid number is found for the slot, recursively solve the new board
  4. It the recursive call returns failure, try the next number in the range.

2. O(m^n) where m is the number of options for each open slot (9 in the case of 
sudoku) and n is the number of open slots. In the best case it would only take
1 operation for each slot, if it were to find the right number the first time in
each slot. In the average case it will be something like O(x^n) where x < m. This
is because it is unlikely to take 9 attempts for each slot.

3. I designed the program so I can easily test and verify the different components
involved in testing if the board is in a valid state. I also wanted it to be
simple to follow the flow of logic, and to provide a resonable level of encapsulation.

4. I kinda would have liked to make the soduku instances immutable. Making
it immutable would make the program easier to debug if there are ever any 
issues with it. However, making the board immutable would have substantial
performance penalities as we would have to copy the board many times over and
over again. I also was on the fence about if the generate board method should
have been a class method of the Sudoku class.
