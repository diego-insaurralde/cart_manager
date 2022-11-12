import 'dart:collection';

import 'package:cart_manager/databases/db_firestore.dart';
import 'package:cart_manager/models/cart_model.dart';
import 'package:cart_manager/models/product.dart';
import 'package:cart_manager/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsRepository extends ChangeNotifier {
  final List<Product> _products = [];
  late FirebaseFirestore db;
  late AuthService auth;
  late CartModel cart;
  UnmodifiableListView<Product> get products =>
      UnmodifiableListView<Product>(_products);

  ProductsRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  loadProducts(CartModel cart) async {
    final snapshot = await db
        .collection('carts/')
        .doc(cart.cartIdKey)
        .collection('products/')
        .get();
    snapshot.docs.forEach((doc) {
      Product product = Product(
          id: doc.id,
          name: doc.get('productName'),
          price: doc.get('productPrice'),
          quantity: doc.get('productQuantity'));
      _products.add(product);
      this.cart = cart;
    });
    notifyListeners();
  }

  addProduct(Product product) async {
    var prod = await db
        .collection('carts/')
        .doc(cart.cartIdKey)
        .collection('products/')
        .add({
      'cartId': cart.cartIdKey,
      'productName': product.name,
      'productPrice': product.price,
      'productQuantity': product.quantity,
    });
    product.id = prod.id;
    _products.add(product);

    notifyListeners();
  }

  removeProduct(Product product) async {
    await db
        .collection('carts/')
        .doc(product.cartId)
        .collection('products/')
        .doc(product.id)
        .delete();
    _products.remove(product);
    notifyListeners();
  }

  int get countCart {
    if (products.isNotEmpty) {
      return List.from(products.map((Product product) => product.quantity))
          .reduce((value, element) => value + element);
    } else {
      return 0;
    }
  }

  double get sumCart {
    if (products.isNotEmpty) {
      return List.from(products
              .map((Product product) => product.price * product.quantity))
          .reduce((value, element) => value + element);
    } else {
      return 0;
    }
  }
}
