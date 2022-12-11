int partition(int *array, unsigned int left, unsigned int right) {
  int v = array[(left + right) / 2];
  int i = left;
  int j = right;
  while (i < j) {
    while (array[i] < v) {
      i++;
    }
    while (array[j] > v) {
      j--;
    }
    int t = array[i];
    array[i] = array[j];
    array[j] = t;
  }
  return j;
}