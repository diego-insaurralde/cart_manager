import 'package:cart_manager/models/cart_model.dart';

import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  final VoidCallback onTap;

  const CartCard({super.key, required this.cart, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Card(
          margin: const EdgeInsets.all(2.0),
          child: ListTile(
            onTap: onTap,
            minVerticalPadding: 1,
            title: const Icon(
              Icons.shopping_cart_rounded,
              size: 30,
              color: Color.fromARGB(255, 104, 146, 55),
            ),
            subtitle: Column(
              children: [
                Text(cart.name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                Text(cart.cartIdKey,
                    style: const TextStyle(
                        fontSize: 12,
                        //fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ],
            ),
          )),
    );
  }
}
