import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:manager_cart/models/product.dart';

class Cart extends ChangeNotifier {
  List<Product> _cart = [];

  UnmodifiableListView<Product> get cart =>
      UnmodifiableListView<Product>(_cart);

  Cart() {
    loadCart();
  }
  loadCart() {
    _cart = [
      Product(name: "Refrigerante", price: 7.50, quantity: 2),
      Product(name: "Leite", price: 3.50, quantity: 6),
      Product(name: "Óleo", price: 3.00, quantity: 2),
      Product(name: "Pão", price: 6.75, quantity: 3),
      Product(name: "Vassoura", price: 10.50, quantity: 1),
      Product(name: "Sabão", price: 2.50, quantity: 2),
      Product(name: "Arroz", price: 3.50, quantity: 6),
      Product(name: "Frutas", price: 3.00, quantity: 2),
      Product(name: "Doce de Leite", price: 6.75, quantity: 3),
      Product(name: "Leite Condensado", price: 10.50, quantity: 1),
      Product(name: "Creme de Leite", price: 7.50, quantity: 2),
      Product(name: "Macarrão", price: 3.50, quantity: 6),
      Product(name: "Molho", price: 3.00, quantity: 2),
      Product(name: "Cerveja", price: 6.75, quantity: 3),
      Product(name: "Manteiga", price: 10.50, quantity: 1),
    ];
    notifyListeners();
  }

  addProduct(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  removeProduct(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  int get countCart {
    if (cart.isNotEmpty) {
      return List.from(cart.map((Product product) => product.quantity))
          .reduce((value, element) => value + element);
    } else {
      return 0;
    }
  }

  double get sumCart {
    if (cart.isNotEmpty) {
      return List.from(
              cart.map((Product product) => product.price * product.quantity))
          .reduce((value, element) => value + element);
    } else {
      return 0;
    }
  }
}
