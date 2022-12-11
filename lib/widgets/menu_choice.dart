import 'package:cart_manager/widgets/camera.dart';
import 'package:cart_manager/widgets/cart/add_product_sheet.dart';
import 'package:flutter/material.dart';

class MenuChoiceSheetBar extends StatefulWidget {
  const MenuChoiceSheetBar({super.key});

  @override
  State<MenuChoiceSheetBar> createState() => _MenuChoiceSheetBarState();
}

class _MenuChoiceSheetBarState extends State<MenuChoiceSheetBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Escolha uma opção",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent)),
                const Divider(
                  thickness: 1,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        IconButton(
                          icon: const Icon(
                            Icons.camera,
                            color: Color.fromARGB(255, 104, 146, 55),
                          ),
                          onPressed: () {
                            Navigator.pop(context);

                            showModalBottomSheet(
                              context: context,
                              builder: (_) => const CameraTextRecognition(),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                            );
                          },
                          iconSize: 60,
                        ),
                        const Text("Abrir Câmera",
                            style: TextStyle(
                                color: Color.fromARGB(255, 104, 146, 55),
                                fontWeight: FontWeight.bold))
                      ]),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.text_fields,
                              color: Color.fromARGB(255, 104, 146, 55),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                context: context,
                                builder: (_) => const AddProductSheet(),
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                              );
                            },
                            iconSize: 60,
                          ),
                          const Text("Manual",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 104, 146, 55),
                                  fontWeight: FontWeight.bold))
                        ],
                      )
                    ]),
              ],
            )));
  }
}
