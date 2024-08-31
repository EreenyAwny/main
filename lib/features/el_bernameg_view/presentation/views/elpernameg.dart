import 'package:flutter/material.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/el_bernameg_view/presentation/views/widgets/bernameg_item.dart';

class Elpernameg extends StatefulWidget {
  const Elpernameg({super.key});

  @override
  State<Elpernameg> createState() => _Elpernameg();
}

class _Elpernameg extends State<Elpernameg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: const Text(
          "البرنامج",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: mainColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: const [
            Item(
              day: "اليوم الاول",
              photo: "images/Screenshot (172).png",
            ),
            Item(
              day: "اليوم الثانى",
              photo: "images/Screenshot (177).png",
            ),
            Item(
              day: "اليوم الثالث",
              photo: "images/Screenshot (172).png",
            ),
            Item(
              day: "اليوم الرابع",
              photo: "images/Screenshot (177).png",
            ),
          ],
        ),
      ),
    );
  }
}
