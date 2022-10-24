import 'package:flutter/material.dart';
import 'package:manager_cart/repositories/cart.dart';
import 'package:manager_cart/widgets/cart/cart_view.dart';
import 'package:manager_cart/widgets/cart/product_card.dart';
import 'package:manager_cart/widgets/cart/save_cart_buttom.dart';
import 'package:manager_cart/widgets/home/bottom_bar.dart';
import 'package:manager_cart/widgets/home/float_buttom.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final DateTime dateToday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Carrinho",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          elevation: 0,
          leading: const Icon(
            Icons.shopping_cart_checkout_rounded,
            color: Colors.white,
            size: 30,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatButtom(),
      bottomNavigationBar: const BottomBar(),
      body: Consumer<Cart>(
        builder: (context, repository, _) => repository.cart.isNotEmpty
            ? Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: 165,
                  child: Card(
                    child: GridView.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 0,
                      childAspectRatio: 9,
                      children: [
                        ListTile(
                          title: const Text("Nº de Itens",
                              style: TextStyle(fontSize: 25)),
                          trailing: Text("${repository.countCart}",
                              style: const TextStyle(fontSize: 25)),
                        ),
                        ListTile(
                          title: const Text("Total",
                              style: TextStyle(fontSize: 25)),
                          trailing: Text(
                              "R\$${repository.sumCart.toStringAsFixed(2)}"
                                  .replaceAll('.', ','),
                              style: const TextStyle(fontSize: 25)),
                        ),
                        const SaveCartButtom()
                      ],
                    ),
                  ),
                ),
                CartView(
                  cart: List.from(
                    repository.cart.map(
                      (Product product) => ProductCard(
                          product: product,
                          onTap: () => {repository.removeProduct(product)}),
                    ),
                  ),
                ),
              ])
            : const Center(
                child: Text("Carrinho Vazio", style: TextStyle(fontSize: 30))),
      ),
    );
  }
}
