import 'dart:math';

abstract class Shape {
  double calculateArea();
}

class Rectangle extends Shape {
  double width;
  double length;

  Rectangle(this.width, this.length);

  @override
  double calculateArea() {
    return width * length;
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return pi * radius * radius;
  }
}

void main() {
  var rect = Circle(1);
  print(rect.calculateArea());
}
