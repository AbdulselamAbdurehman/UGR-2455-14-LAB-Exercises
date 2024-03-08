reverseString(String inputString) {
  var result = '';
  for (int i = inputString.length - 1; i >= 0; i--) {
    result = result + inputString[i];
  }
  return result;
}

void main() {
  print(reverseString('abdu'));
}
