import 'package:flutter/material.dart';

import '../widgets/home/bottom_bar.dart';
import '../widgets/home/float_buttom.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

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
      body: const Center(
        child: Text(
          "Análise de Dados",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
