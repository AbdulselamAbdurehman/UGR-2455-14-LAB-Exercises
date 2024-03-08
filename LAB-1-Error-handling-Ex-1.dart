import 'dart:io';

void main() {
  print('Enter integer between 1 and 10(inclusive)');
  try {
    var input = int.parse(stdin.readLineSync()!);
    print('Your input is $input');
  } on FormatException {
    print('Invalid text entered!');
  }
}
