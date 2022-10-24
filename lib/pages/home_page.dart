import 'package:flutter/material.dart';
import 'package:manager_cart/widgets/home/bottom_bar.dart';
import 'package:manager_cart/widgets/home/float_buttom.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Início",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: Image.asset(
            "images/cart_logo.png",
            fit: BoxFit.fill,
          ),
          leadingWidth: 70,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatButtom(),
        bottomNavigationBar: const BottomBar(),
        body: const Center(
            child: Text("Bem Vindo", style: TextStyle(fontSize: 30))));
  }
}
