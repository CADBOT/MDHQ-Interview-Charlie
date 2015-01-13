#include <stdio.h>
#include <stdlib.h>

int factorial(int x) {
  if (x == 0)
    return 1;
  return x * factorial(x-1);
}

int factorial_memo(int x) {
  // Any bigger and int wouldn't be able to hold it
  static int memo[13];
  if (x == 0)
    return 1; 
  if (memo[x] == 0)
    memo[x] = x * factorial_memo(x-1);
  return memo[x];
}
