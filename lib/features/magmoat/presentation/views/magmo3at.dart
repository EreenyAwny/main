import 'package:flutter/material.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/widgets/app_leading.dart';

class Magmo3at extends StatefulWidget {
  const Magmo3at({super.key});

  @override
  State<Magmo3at> createState() => _Magmo3at();
}

class _Magmo3at extends State<Magmo3at> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "المجموعات",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: mainColor,
        leading: const AppLeading(),
      ),
      body: const Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  "اتعلم تشتغل مع عيلتك كفريق",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "حبوا بعض , مش عايزين مشاكل هنا 😏😏",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
