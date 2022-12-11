import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cart_manager/widgets/auth/auth_check.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cart Manager",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          textTheme: GoogleFonts.openSansTextTheme(
            ThemeData.light().textTheme,
          )),
      home: const AuthCheck(),
    );
  }
}
