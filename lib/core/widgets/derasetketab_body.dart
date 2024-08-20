import 'package:flutter/material.dart';

class Derasetketabbody extends StatelessWidget {
  final String title;
  final String body_details;

  const Derasetketabbody({
    super.key,
    required this.title,
    required this.body_details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            body_details,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 22),
          ),
        )
      ],
    );
  }
}
