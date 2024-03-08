import 'dart:math';

void main() async {
  String randomQoute = await simulateAsync();
  print(randomQoute);
}

simulateAsync() async {
  const duration = Duration(seconds: 3);

  const List<String> quotes = ["Right is might.", 'Stay humble.'];
  var random = Random();
  int quoteNumber = random.nextInt(2);
  return Future.delayed(duration, () => quotes[quoteNumber]);
}
