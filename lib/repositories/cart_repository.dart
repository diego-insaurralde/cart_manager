import 'dart:collection';

import 'package:cart_manager/databases/db_firestore.dart';
import 'package:cart_manager/models/cart_model.dart';
import 'package:cart_manager/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartRepository extends ChangeNotifier {
  final List<CartModel> _carts = [];
  late FirebaseFirestore db;
  late AuthService auth;

  UnmodifiableListView<CartModel> get cart =>
      UnmodifiableListView<CartModel>(_carts);

  CartRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _loadCart();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  addCart(CartModel cart) {
    _carts.add(cart);
    notifyListeners();
  }

  _loadCart() async {
    if (auth.user != null) {
      final snapshot = await db
          .collection('carts/')
          .where("userId", isEqualTo: auth.user!.uid)
          .get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docsCopy =
          List.of(snapshot.docs);
      docsCopy.sort((docA, docB) => docB
          .get('cartId')
          .toString()
          .compareTo(docA.get('cartId').toString()));
      docsCopy.forEach((doc) async {
        CartModel cart = CartModel(
            cartIdKey: doc.id,
            name: doc.get('cartName'),
            date: doc.get('cartDate'),
            sumCart: doc.get('sumCart'));
        _carts.add(cart);
      });
    }
  }
}
