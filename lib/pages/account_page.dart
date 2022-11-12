import 'package:flutter/material.dart';
import 'package:cart_manager/services/auth_services.dart';
import 'package:cart_manager/widgets/home/bottom_bar.dart';
import 'package:cart_manager/widgets/home/float_buttom.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Conta",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            leading: const Icon(Icons.person, size: 30, color: Colors.white)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatButtom(),
        bottomNavigationBar: const BottomBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              child: Card(
                elevation: 5,
                child: ListTile(
                  title: const Icon(
                    Icons.person,
                    size: 150,
                    color: Color.fromARGB(255, 104, 146, 55),
                  ),
                  subtitle: Center(
                      child: Text(
                          context.read<AuthService>().user!.email.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 104, 146, 55),
                              fontWeight: FontWeight.bold))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: OutlinedButton(
                  onPressed: () => {
                        Navigator.popUntil(context, ModalRoute.withName("/")),
                        context.read<AuthService>().logout()
                      },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Sair",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
