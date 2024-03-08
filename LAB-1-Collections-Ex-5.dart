class Student {
  String name;
  List<int> marks;

  Student(this.name, this.marks);

  double average() {
    if (marks.isEmpty) {
      return 0;
    }
    return marks.reduce((sum, val) => sum + val) / marks.length;
  }
}

void main() {
  var student = Student('abdu', [90, 92, 97]);
  print(student.average());
}
