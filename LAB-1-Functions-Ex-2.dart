bool isPrime(n) {
  for (int i = 2; i < n; i++) {
    if (n % i == 0) {
      return true;
    }
  }
  return false;
}

void main() {
  var left = 5;
  var right = 20;
  for (int i = left; i < right; i++) {
    print(isPrime(i));
  }
}
