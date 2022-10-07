import 'package:flutter/material.dart';
import 'package:projeto_semnome/widgets/home/bottom_bar.dart';
import 'package:projeto_semnome/widgets/home/float_buttom.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Principal"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatButtom(),
        bottomNavigationBar: const BottomBar(),
        body: const Center(
            child: Text("Bem Vindo", style: TextStyle(fontSize: 30))));
  }
}
