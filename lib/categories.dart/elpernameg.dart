import 'package:flutter/material.dart';

class Elpernameg extends StatefulWidget {
  const Elpernameg({super.key});

  @override
  State<Elpernameg> createState() => _Elpernameg();
}

class _Elpernameg extends State<Elpernameg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Now What? (البرنامج)",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 174, 75)),
        ),
        backgroundColor: const Color.fromARGB(255, 49, 33, 109),
      ),
      body: ListView(
        children: const [
          Item(
              day: "اليوم الاول",
              photo: "images/Screenshot (172).png",
              color: Colors.white),
          Item(
              day: "اليوم الثانى",
              photo: "images/Screenshot (177).png",
              color: Colors.blue),
          Item(
              day: "اليوم الثالث",
              photo: "images/Screenshot (172).png",
              color: Colors.white),
          Item(
              day: "اليوم الرابع",
              photo: "images/Screenshot (177).png",
              color: Colors.blue),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key, this.day, this.photo, this.color});

  final String? day;
  final String? photo;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 400,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: Text(
              day!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 455,
            width: 500,
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              photo!,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
