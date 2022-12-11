# 0 "nth.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "nth.c"
# 1 "partition.h" 1


int partition(int *array, unsigned int left, unsigned int right);
# 2 "nth.c" 2

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
