import 'package:flutter/material.dart';
import 'package:mutamaruna/wedget/User.dart';

class Notedetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your notes",
          style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),
        ),
        backgroundColor: Color.fromARGB(255, 49, 33, 109),
      ),
      body: ListView(
        children: [
          Container(
            child: Text(
              notttte!,
              style: TextStyle(fontSize: 28),
            ),
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerRight,
          ),
          if (ima != "")
            Container(
              child: Image.network(
                ima,
              ),
              padding: EdgeInsets.all(20),
            )
        ],
      ),
    );
  }
}
