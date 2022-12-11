import 'package:cart_manager/widgets/menu_choice.dart';
import 'package:flutter/material.dart';

class FloatButtom extends StatelessWidget {
  const FloatButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      isExtended: true,
      onPressed: () => {
        showModalBottomSheet(
          context: context,
          builder: (_) => const MenuChoiceSheetBar(),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        )
      },
      elevation: 2.0,
      backgroundColor: const Color.fromARGB(255, 104, 146, 55),
      child: const Icon(Icons.add_shopping_cart, color: Colors.white),
    );
  }
}
