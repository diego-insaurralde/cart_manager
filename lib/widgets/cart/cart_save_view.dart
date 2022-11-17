import 'package:cart_manager/models/product.dart';
import 'package:cart_manager/repositories/products_repository.dart';
import 'package:cart_manager/widgets/cart/cart_view.dart';
import 'package:cart_manager/widgets/cart/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSaveView extends StatefulWidget {
  const CartSaveView({
    super.key,
  });

  @override
  State<CartSaveView> createState() => _CartSaveViewState();
}

class _CartSaveViewState extends State<CartSaveView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 100),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Consumer<ProductsRepository>(builder: (
            context,
            cart,
            child,
          ) {
            return Column(children: [
              SizedBox(
                width: double.infinity,
                height: 165,
                child: GridView.count(
                    crossAxisCount: 1,
                    controller: ScrollController(keepScrollOffset: false),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 0,
                    childAspectRatio: 9,
                    children: [
                      ListTile(
                        title: Text(
                          cart.cart.date,
                          style: const TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ListTile(
                        title: const Text("Nº de Itens",
                            style: TextStyle(fontSize: 25)),
                        trailing: Text("${cart.countCart}",
                            style: const TextStyle(fontSize: 25)),
                      ),
                      ListTile(
                        title:
                            const Text("Total", style: TextStyle(fontSize: 25)),
                        trailing: Text(
                            "R\$${cart.sumCart.toStringAsFixed(2)}"
                                .replaceAll('.', ','),
                            style: const TextStyle(fontSize: 25)),
                      ),
                    ]),
              ),
              Flexible(
                child: CartView(
                  cart: List.from(
                    cart.products.map(
                      (Product product) => ProductCard(
                          product: product,
                          onTap: () => {cart.removeProduct(product)}),
                    ),
                  ),
                ),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}
