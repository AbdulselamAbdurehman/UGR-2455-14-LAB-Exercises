class Person {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);
}

void main() {
  var person1 = Person('abdu', 22, "Addis Ababa");
  print(person1.name);
  person1.name = "gentle";
  print(person1.name);
  print(person1.address);
  person1.address = "Sydney";
  print(person1.address);
}
