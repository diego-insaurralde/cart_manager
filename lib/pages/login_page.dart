import 'package:flutter/material.dart';
import 'package:cart_manager/pages/create_account_page.dart';
import 'package:cart_manager/services/auth_services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  login() async {
    try {
      await context.read<AuthService>().login(email.text, password.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 140,
          ),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.email,
                          color: Colors.green,
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            decoration: const InputDecoration(
                              border: null, //OutlineInputBorder(),
                              hintText: "Email",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Informe um email válido");
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.lock,
                          color: Colors.green,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: null, //OutlineInputBorder(),
                              hintText: "Senha",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Informe a senha");
                              } else if (value.length < 8) {
                                "A senha deve conter no mínimo 8 dígitos";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => {
                            if (formKey.currentState!.validate())
                              {
                                FocusManager.instance.primaryFocus?.unfocus(),
                                login()
                              }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 104, 146, 55))),
                          child: const Text("Entrar",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () => {},
                          child: const Text("Recuperar Senha"),
                        ),
                        TextButton(
                          onPressed: () => {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => const CreateAccountPage(),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                            )
                          },
                          child: const Text("Criar Conta"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: const Text(
                            "Experimentar",
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height * 0.2,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Image.asset("images/cart_logo_2.png",
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
