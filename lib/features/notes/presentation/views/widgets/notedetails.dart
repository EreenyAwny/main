import 'package:flutter/material.dart';
import 'package:mutamaruna/core/constants.dart';

class Notedetails extends StatelessWidget {
  const Notedetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your notes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: mainColor,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            child: Text(
              note_detail,
              style: const TextStyle(fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }
}
