import 'package:cart_manager/repositories/cart_repository.dart';
import 'package:cart_manager/repositories/products_repository.dart';
import 'package:flutter/material.dart';
import 'package:cart_manager/app.dart';
import 'package:cart_manager/repositories/cart.dart';
import 'package:cart_manager/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(
          create: (context) => Cart(auth: context.read<AuthService>()),
        ),
        ChangeNotifierProvider(
            create: (context) =>
                CartRepository(auth: context.read<AuthService>())),
        ChangeNotifierProvider(
            create: (context) =>
                ProductsRepository(auth: context.read<AuthService>()))
      ],
      child: const App(),
    ),
  );
}
