import 'package:flutter/material.dart';
import 'package:cart_manager/services/auth_services.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _userEmail = TextEditingController();
  final _userPassword = TextEditingController();
  final _userCompleteName = TextEditingController();

  bool loading = false;

  createAccount() async {
    setState(() => loading = true);
    try {
      await context
          .read<AuthService>()
          .createAccount(_userEmail.text, _userPassword.text);
      if (!mounted) return;
      Navigator.of(context).pop();
    } on AuthException catch (e) {
      setState(() => loading = false);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  submitButton() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Text("Nothing to do")),
    );
  }

  emailValidation(value) {
    RegExp pattern = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    bool isEmail = pattern.hasMatch(value);
    return !isEmail;
  }

  passwordValidation(value) {
    RegExp pattern = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");
    bool isPassword = pattern.hasMatch(value);
    return !isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _userCompleteName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          border: null, //OutlineInputBorder(),
                          hintText: "Nome Completo",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira seu nome completo";
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
                      Icons.email,
                      color: Colors.green,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _userEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: null, //OutlineInputBorder(),
                          hintText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira um email válido";
                          }
                          if (emailValidation(value)) {
                            return "Email inválido";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        controller: _userPassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: null, //OutlineInputBorder(),
                          hintText: "Senha",
                        ),
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Insira pelo menos 8 dígitos";
                          }
                          if (passwordValidation(value)) {
                            return "Deve conter números, letras maiúsculas e minúsculas";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {
                          FocusManager.instance.primaryFocus?.unfocus(),
                          createAccount()
                        }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 104, 146, 55))),
                    child: const Text("Vamos às Compras",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.height * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child:
                        Image.asset("images/cart_logo_2.png", fit: BoxFit.fill),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
