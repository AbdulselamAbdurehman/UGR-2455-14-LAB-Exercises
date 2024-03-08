void main() {
  List<String> hobbies = <String>[];
  if (hobbies.isEmpty) {
    hobbies.add('Reading');
  }
  hobbies.add('Talking');
  hobbies.add('Coding');
  hobbies.sort();
  print(hobbies);
  hobbies.remove('Talking');
  print(hobbies);
}
