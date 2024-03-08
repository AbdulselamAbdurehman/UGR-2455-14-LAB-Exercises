void main() {
  Map<String, int> studInfo = {};
  studInfo.putIfAbsent('Abebe', () => 88);
  print(studInfo);
  if (!studInfo.containsKey('Abdu')) {
    studInfo['Abdu'] = 93;
  }
  studInfo.forEach((stud, mark) {
    print('$stud got $mark/100');
  });

  for (var name in studInfo.keys) {
    print('$name is here');
  }
  studInfo.remove('Abebe');
  print(studInfo);
}
