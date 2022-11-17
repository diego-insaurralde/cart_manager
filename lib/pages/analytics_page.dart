import 'package:cart_manager/models/cart_model.dart';
import 'package:cart_manager/repositories/cart_repository.dart';
import 'package:cart_manager/repositories/products_repository.dart';
import 'package:cart_manager/widgets/analytics/cart_card.dart';
import 'package:cart_manager/widgets/analytics/cart_card_view.dart';
import 'package:cart_manager/widgets/cart/cart_save_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home/bottom_bar.dart';
import '../widgets/home/float_buttom.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Análise",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          leading: const Icon(Icons.stacked_bar_chart_rounded,
              size: 30, color: Colors.white)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatButtom(),
      bottomNavigationBar: const BottomBar(),
      body: Consumer<CartRepository>(
        builder: (context, carts, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Carrinhos",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Flexible(
              flex: 5,
              child: CartCardView(
                cartList: List.from(
                  carts.cart.map((CartModel cart) => CartCard(
                      cart: cart,
                      onTap: () async => {
                            await context
                                .read<ProductsRepository>()
                                .loadProducts(cart),
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => const CartSaveView(),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                            )
                          })),
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: Divider(
                thickness: 4.0,
              ),
            ),
            const Text(
              "Gráfico",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Flexible(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Card(),
                ))
          ],
        ),
      ),
    );
  }
}
