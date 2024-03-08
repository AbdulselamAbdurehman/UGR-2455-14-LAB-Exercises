class Product {
  String name;
  double price;
  double quantity;

  Product(this.name, this.price, this.quantity);

  double totalCost() {
    return price * quantity;
  }
}

void main() {
  var myProd = Product('name', 11.2, 4);
  print(myProd.totalCost());
}
