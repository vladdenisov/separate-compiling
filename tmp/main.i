# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 2 "main.c" 2
# 1 "nth.h" 1

/* stdio.h */

# 3 "nth.h"
int nth(int *array, unsigned int n, unsigned int k);
# 3 "main.c" 2

void main() {
  int n = 6;
  int array[] = {12, 36, 110, 1, 6, 99};
  int k = 4;
  int result = nth(array, n, k);
  printf("%i\n", result);
}
