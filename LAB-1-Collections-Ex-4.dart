class Cart {
  Map<String, int> items = {};

  String addItem(String item, int quantity) {
    items[item] = quantity;
    return '$quantity {$item}s sucessfully added to the cart';
  }

  int get total => items.values.reduce((value, element) => value + element);

  String removeItem(String item) {
    if (items.remove(item) != null) {
      return '$item successfully removed from the cart';
    }
    return "Couldn't find $item";
  }
}

void main() {
  Cart myCart = Cart();
  myCart.addItem('Pc', 10);
  myCart.addItem('mobile', 1);
  myCart.addItem('Projector', 1);
  print(myCart.items);
  print(myCart.total);
  myCart.removeItem('Pc');
  print(myCart.items);
}
