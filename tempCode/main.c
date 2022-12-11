#include <stdio.h>
#include "nth.h"

void main() {
  int n = 6; // array size
  int array[] = {12, 36, 110, 1, 6, 99}; // array
  int k = 4;
  int result = nth(array, n, k);
  printf("%i\n", result);
}