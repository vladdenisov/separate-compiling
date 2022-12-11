#include "partition.h"

int nth(int *array, unsigned int n, unsigned int k) {
  k--;
  int left = 0;
  int right = n - 1;
  while (1) {
   int mid = partition(array, left, right);
   if (mid == k) {
    return array[mid];
   }
   if (k < mid) {
    right = mid;
   } else {
    left = mid + 1;
   }
  }
}