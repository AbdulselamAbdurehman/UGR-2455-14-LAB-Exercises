calculate(leftOperand, operator, rightOperand) {
  switch (operator) {
    case '+':
      return leftOperand + rightOperand;
    case '-':
      return leftOperand - rightOperand;
    case '/':
      return leftOperand / rightOperand;
    case '*':
      return leftOperand * rightOperand;
    default:
      return leftOperand + rightOperand;
  }
}

void main() {
  print(calculate(4, "-", 5));
}
