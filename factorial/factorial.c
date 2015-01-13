#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int *data;
  int capacity;
} List;


void list_init(List *list) {
  list->capacity = 50;
  list->data = malloc(sizeof(int) * 50);
}

void list_grow(List *list) {
  list->capacity *= 2;
  list->data = realloc(list->data, sizeof(int) * list->capacity); 
}

int list_get(List *list, int index) {
  return list->data[index];
}

void list_set(List *list, int index, int value) {
  if (index + 1 > list->capacity) {
    list_grow(list);
  }
  list->data[index] = value;
}

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

/*
int factorial_memo_dyn(int x, List *memo) {
  if (x == 0)
    return 1;
}
*/

int main() {
  printf("%d", factorial_memo(5));
  /*
  List memo;
  list_init(&memo);
  int result = factoral_memo_dyn(10, &memo);





  List list;
  list_init(&list);
  list_set(&list, 3, 30);
  list_set(&list, 5, 232);
  list_set(&list, 60, 1010);
  for (int i = 0; i < 99; i++) {
    printf("%d\n", list_get(&list, i));
  }
  */
}

