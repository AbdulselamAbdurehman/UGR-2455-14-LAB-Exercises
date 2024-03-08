import 'dart:io';

void main() {
  const speedOfLight = 299792458; // meters per second
  print('Enter the distance (in meters):');
  var distance = double.parse(stdin.readLineSync()!);

  var time = distance / speedOfLight;

  print('It took ${time} seconds');
}
