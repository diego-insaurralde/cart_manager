import 'package:flutter/material.dart';

class FloatButtom extends StatelessWidget {
  const FloatButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add_shopping_cart),
      elevation: 2.0,
      backgroundColor: const Color.fromARGB(255, 104, 146, 55),
    );
  }
}
