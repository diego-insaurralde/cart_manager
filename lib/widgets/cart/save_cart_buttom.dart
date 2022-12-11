import 'package:cart_manager/models/cart_model.dart';
import 'package:cart_manager/repositories/cart.dart';
import 'package:cart_manager/repositories/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveCartButtom extends StatefulWidget {
  const SaveCartButtom({
    super.key,
  });

  @override
  State<SaveCartButtom> createState() => _SaveCartButtomState();
}

class _SaveCartButtomState extends State<SaveCartButtom> {
  getCart() {
    CartModel? cart = Provider.of<Cart>(context, listen: false).cartInstance;
    cart?.sumCart = Provider.of<Cart>(context, listen: false).sumCart;
    return cart;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 40,
        child: ElevatedButton(
          onPressed: () => {
            Provider.of<Cart>(context, listen: false).deactiveCart(),
            Provider.of<CartRepository>(context, listen: false)
                .addCart(getCart()!)
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 104, 146, 55))),
          child: const Text("Finalizar",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
