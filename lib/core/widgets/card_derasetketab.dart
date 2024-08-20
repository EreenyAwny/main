import 'package:flutter/material.dart';

class CardDerasetketab extends StatelessWidget {
  final String day_title;
  final String subject1;
  final String subject2;
  const CardDerasetketab({
    super.key,
    required this.day_title,
    required this.subject1,
    required this.subject2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          day_title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject1,
            ),
            Text(
              subject2,
            ),
          ],
        ),
      ),
    );
  }
}
