import 'package:cart_manager/models/cart_model.dart';

import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  final CartModel cart;
  final Function onTap;

  const CartCard({super.key, required this.cart, required this.onTap});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool loading = false;
  loadingCart() async {
    setState(() => loading = true);
    try {
      await widget.onTap();
    } catch (e) {
      setState(() => loading = false);
      throw e;
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Card(
          margin: const EdgeInsets.all(2.0),
          child: (loading)
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 52),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 104, 146, 55),
                      //backgroundColor: Colors.white,
                    ),
                  ),
                )
              : ListTile(
                  onTap: loadingCart,
                  minVerticalPadding: 1,
                  title: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 30,
                    color: Color.fromARGB(255, 104, 146, 55),
                  ),
                  subtitle: Column(
                    children: [
                      Text(widget.cart.name,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                      Text(
                          "R\$${widget.cart.sumCart.toStringAsFixed(2)}"
                              .replaceAll('.', ','),
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
