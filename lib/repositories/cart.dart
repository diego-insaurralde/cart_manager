import 'dart:collection';

import 'package:cart_manager/databases/db_firestore.dart';
import 'package:cart_manager/models/cart_model.dart';
import 'package:cart_manager/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:cart_manager/models/product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _cart = [];
  int productId = 0;
  late FirebaseFirestore db;
  late AuthService auth;
  late bool _isCartActive;
  late CartModel cartInstance;

  UnmodifiableListView<Product> get cart =>
      UnmodifiableListView<Product>(_cart);

  Cart({required this.auth}) {
    _startRepository();
    print("AQUIIII");
  }

  _startRepository() async {
    await _startFirestore();
    await isCartActive();
    await _loadCart();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _loadCart() async {
    if (auth.user != null && _isCartActive) {
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
      final cartDocId = docsCopy.first.id;
      await _loadProducts(cartDocId);
      notifyListeners();
    }
  }

  _loadProducts(cartId) async {
    final snapshot =
        await db.collection('carts/').doc(cartId).collection('products/').get();
    snapshot.docs.forEach((doc) {
      Product product = Product(
          id: doc.id,
          name: doc.get('productName'),
          price: doc.get('productPrice'),
          quantity: doc.get('productQuantity'),
          cartId: doc.get('cartId'));
      _cart.add(product);
    });
  }

  addProduct(Product product) async {
    if (_isCartActive) {
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
      final cartDocId = docsCopy.first.id;

      var docProduct = await db
          .collection('carts/')
          .doc(cartDocId)
          .collection('products/')
          .add({
        'cartId': cartDocId,
        'productName': product.name,
        'productPrice': product.price,
        'productQuantity': product.quantity,
      });
      product.cartId = cartDocId;
      product.id = docProduct.id;
      _cart.add(product);
    } else {
      String cartDocId = await _addCart();
      var docProduct = await db
          .collection('carts/')
          .doc(cartDocId)
          .collection('products/')
          .add({
        'cartId': cartDocId,
        'productName': product.name,
        'productPrice': product.price,
        'productQuantity': product.quantity,
      });
      product.id = docProduct.id;
      product.cartId = cartDocId;
      _cart.add(product);
    }
    notifyListeners();
  }

  _addCart() async {
    DateTime cartDate = DateTime.now();
    CollectionReference carts = db.collection('carts/');
    final snapshot = await db
        .collection('carts/')
        .where("userId", isEqualTo: auth.user!.uid)
        .get();
    int newCartId = snapshot.size + 1;
    final cart = await carts.add({
      'cartId': newCartId,
      'userId': auth.user!.uid,
      'cartName': '${cartDate.day}-${cartDate.month}-${cartDate.year}',
      'cartDate': '${cartDate.day}-${cartDate.month}-${cartDate.year}',
    });

    await db
        .collection('carts_active/')
        .doc(auth.user!.uid)
        .set({"userId": auth.user!.uid, "isCartActive": true});

    cartInstance = CartModel(
        cartIdKey: cart.id,
        name: '${cartDate.day}-${cartDate.month}-${cartDate.year}',
        date: '${cartDate.day}-${cartDate.month}-${cartDate.year}');
    return cart.id;
  }

  deactiveCart() async {
    final snapshotCartActive = await db
        .collection('carts_active/')
        .where(
          'userId',
          isEqualTo: auth.user!.uid,
        )
        .get();
    if (snapshotCartActive.docs.isNotEmpty &&
        snapshotCartActive.docs.first.get('isCartActive') == true) {
      await db
          .collection('carts_active/')
          .doc(snapshotCartActive.docs.first.id)
          .update({'isCartActive': false});
      _cart.clear();
    }

    notifyListeners();
  }

  isCartActive() async {
    if (auth.user != null) {
      final snapshotCartActive = await db
          .collection('carts_active/')
          .where(
            'userId',
            isEqualTo: auth.user!.uid,
          )
          .get();
      if (snapshotCartActive.docs.isEmpty) {
        _isCartActive = false;
      } else {
        _isCartActive = snapshotCartActive.docs.last.get('isCartActive');
      }
      notifyListeners();
    }
  }

  removeProduct(Product product) async {
    await db
        .collection('carts/')
        .doc(product.cartId)
        .collection('products/')
        .doc(product.id)
        .delete();
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
