class Person {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);
}

class Student extends Person {
  int rollNumber;
  List<int> marks;

  Student(String name, int age, String address, this.rollNumber, this.marks)
      : super(name, age, address);

  int totalMarks() {
    var total = 0;
    for (var mark in marks) {
      total += mark;
    }
    return total;
  }

  double averageMark() {
    var totalMark = totalMarks();
    return totalMark / (marks.length);
  }
}

void main() {
  var person1 = Person('abdu', 22, "Addis Ababa");
  print(person1.name);
  person1.name = "gentle";
  print(person1.name);
  print(person1.address);
  person1.address = "Sydney";
  print(person1.address);
  var student1 = Student('stud', 18, 'New York', 2, [89, 95, 87]);
  print(student1.name);
  print(student1.totalMarks());
  print(student1.averageMark());
}
