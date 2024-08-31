import 'package:flutter/material.dart';

class CardDerasetketab extends StatelessWidget {
  final String day_title;
  final String subject1;
  final String? subject2;
  const CardDerasetketab({
    super.key,
    required this.day_title,
    required this.subject1,
    this.subject2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          isThreeLine: true,
          title: Text(
            day_title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject1,
              ),
              subject2 != null
                  ? Text(
                      subject2 ?? '',
                    )
                  : Container(),
            ],
          ),
        ),
        const Divider(
          endIndent: 30,
          indent: 30,
        )
      ],
    );
  }
}
