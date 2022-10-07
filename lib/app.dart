import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_semnome/pages/home_page.dart';

class App extends StatelessWidget {
  final String np = "Sem nome";
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: np,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.light().textTheme,
          )),
      home: const Home(),
    );
  }
}
