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
      padding: const EdgeInsetsDirectional.only(top: 150, bottom: 30),
      child: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 2,
          crossAxisSpacing: 0,
          childAspectRatio: 6,
          children: cart),
    );
  }
}
