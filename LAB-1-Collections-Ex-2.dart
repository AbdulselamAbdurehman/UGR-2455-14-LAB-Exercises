import 'dart:math';

void main() {
  Random random = Random();
  List<int> randList = [];
  for (var i = 0; i < 20; i++) {
    randList.add(random.nextInt(10) + 1);
  }
  print(randList);
  var randSet = randList.toSet();
  print(randSet);
}
