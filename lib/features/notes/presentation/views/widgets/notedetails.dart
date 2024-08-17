import 'package:flutter/material.dart';
import 'package:mutamaruna/core/widgets/User.dart';

class Notedetails extends StatelessWidget {
  const Notedetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your notes",
          style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),
        ),
        backgroundColor: const Color.fromARGB(255, 49, 33, 109),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            child: Text(
              notttte!,
              style: const TextStyle(fontSize: 28),
            ),
          ),
          if (ima != "")
            Container(
              padding: const EdgeInsets.all(20),
              child: Image.network(
                ima,
              ),
            )
        ],
      ),
    );
  }
}
