import 'package:flutter/material.dart';

import '../widgets/home/bottom_bar.dart';
import '../widgets/home/float_buttom.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Análise"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.delete_rounded),
                  title: const Text('Remover'),
                  onTap: () => {},
                ),
              ),
            ],
          )
        ],
      ),
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
