import 'package:flutter/material.dart';
import 'package:manager_cart/models/product.dart';
import 'package:manager_cart/repositories/cart.dart';
import 'package:provider/provider.dart';

class AddProductSheet extends StatefulWidget {
  const AddProductSheet({
    super.key,
  });

  @override
  State<AddProductSheet> createState() => _AddProductSheetState();
}

class _AddProductSheetState extends State<AddProductSheet> {
  final _formKey = GlobalKey<FormState>();
  final _productName = TextEditingController();
  final _productPrice = TextEditingController();
  final _productQuantity = TextEditingController();

  saveProduct(repository) {
    if (_formKey.currentState!.validate()) {
      repository.addProduct(
        Product(
          name: _productName.text,
          price: double.parse(_productPrice.text.replaceAll(',', '.')),
          quantity: int.parse(_productQuantity.text),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
          height: 380,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 12,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("Adicionar Produto",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close_rounded))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.5),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Nome do Produto"),
                      ),
                      controller: _productName,
                      validator: (value) {
                        if (value!.isEmpty) return "Insira o nome do produto";
                        return null;
                      }),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Preço"),
                        ),
                        controller: _productPrice,
                        validator: (value) {
                          if (value!.isEmpty) return "Insira o preço";
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Quantidade"),
                          ),
                          controller: _productQuantity,
                          validator: (value) {
                            if (value!.isEmpty) return "Insira a quantidade";
                            return null;
                          }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<Cart>(builder: (context, repository, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.5),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => saveProduct(repository),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 104, 146, 55))),
                        child: const Text("Salvar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white)),
                      ),
                    ),
                  );
                })
              ],
            ),
          )),
    );
  }
}
