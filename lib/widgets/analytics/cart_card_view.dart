import 'package:flutter/material.dart';

class CartCardView extends StatelessWidget {
  final List<Widget> cartList;
  const CartCardView({
    required this.cartList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 20), //const EdgeInsets.only(top: 20, bottom: 300),
      child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 2,
          childAspectRatio: 3 / 2,
          children: cartList),
    );
  }
}
