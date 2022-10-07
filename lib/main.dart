import 'package:flutter/material.dart';
import 'package:projeto_semnome/app.dart';
import 'package:projeto_semnome/repositories/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const App(),
    ),
  );
}
