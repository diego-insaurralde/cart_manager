import 'package:flutter/material.dart';
import 'package:projeto_semnome/pages/analytics_page.dart';
import 'package:projeto_semnome/pages/cart_page.dart';
import 'package:projeto_semnome/pages/home_page.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  openHome(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Home()),
    );
  }

  openCart(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CartPage()),
    );
  }

  openAnalytics(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AnalyticsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightGreen,
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => {openHome(context)},
            iconSize: 35,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_rounded),
            onPressed: () => {openCart(context)},
            iconSize: 35,
            color: Colors.white,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: () {
              openAnalytics(context);
            },
            iconSize: 35,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
