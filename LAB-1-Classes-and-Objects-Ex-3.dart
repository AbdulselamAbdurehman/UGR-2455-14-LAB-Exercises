class Rectangle {
  int width;
  int height;

  Rectangle(this.height, this.width);

  int getArea() {
    return width * height;
  }

  int getPerimeter() {
    return 2 * width + 2 * height;
  }
}

void main() {
  var myRect = Rectangle(5, 3);
  print(myRect.getArea());
  print(myRect.getPerimeter());
}
