import 'package:flutter/material.dart';

class SaveCartButtom extends StatefulWidget {
  const SaveCartButtom({super.key});

  @override
  State<SaveCartButtom> createState() => _SaveCartButtomState();
}

class _SaveCartButtomState extends State<SaveCartButtom> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 40,
        child: ElevatedButton(
          onPressed: () => {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 104, 146, 55))),
          child: const Text("Finalizar",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
