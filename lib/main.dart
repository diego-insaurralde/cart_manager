import 'package:flutter/material.dart';
import 'package:manager_cart/app.dart';
import 'package:manager_cart/repositories/cart.dart';
import 'package:manager_cart/services/auth_services.dart';
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
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: const App(),
    ),
  );
}
