letterGrade(grade) {
  switch (grade) {
    case >= 90:
      return 'A';
    case >= 80:
      return 'B';
    case >= 70:
      return 'C';
    case >= 60:
      return 'D';
  }
}

void main() {
  print(letterGrade(95));
}
