import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(1.0),
          child: ListTile(
            minVerticalPadding: 1,
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 104, 146, 55),
              child: Text(product.quantity.toString()),
            ),
            title: Text(product.name),
            subtitle: Text(
                "Preço Unitário: R\$${product.price.toStringAsFixed(2)}"
                    .replaceAll('.', ',')),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'R\$${(product.price * product.quantity).toStringAsFixed(2)}'
                        .replaceAll('.', ',')),
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.delete_rounded, color: Colors.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
