import 'package:flutter/material.dart';
import 'package:projeto_semnome/repositories/cart.dart';
import 'package:projeto_semnome/widgets/cart/cart_view.dart';
import 'package:projeto_semnome/widgets/cart/product_card.dart';
import 'package:projeto_semnome/widgets/home/bottom_bar.dart';
import 'package:projeto_semnome/widgets/home/float_buttom.dart';
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
        title: const Text("Carrinho"),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatButtom(),
      bottomNavigationBar: const BottomBar(),
      body: Consumer<Cart>(
        builder: (context, repository, _) => repository.cart.isNotEmpty
            ? Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Card(
                    child: GridView.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 0,
                      childAspectRatio: 9,
                      children: [
                        Center(
                          child: Text(
                              "${dateToday.day}/${dateToday.month}/${dateToday.year}",
                              style: const TextStyle(
                                fontSize: 20,
                              )),
                        ),
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
                      ],
                    ),
                  ),
                ),
                CartView(
                  cart: List.from(
                    repository.cart.map(
                      (Product product) => ProductCard(
                          product: product,
                          onTap: () =>
                              {context.read<Cart>().removeProduct(product)}),
                    ),
                  ),
                )
              ])
            : const Center(
                child: Text("Carrinho Vazio", style: TextStyle(fontSize: 30))),
      ),
    );
  }
}
