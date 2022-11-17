import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  final List<Widget> cart;
  const CartView({
    required this.cart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 5, right: 5, top: 5),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: GridView.count(
            crossAxisCount: 1,
            shrinkWrap: true,
            mainAxisSpacing: 2,
            crossAxisSpacing: 0,
            childAspectRatio: 6,
            children: cart),
      ),
    );
  }
}
