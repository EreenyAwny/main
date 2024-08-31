import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, this.day, this.photo});

  final String? day;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
          child: Text(
            day!,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: AspectRatio(
              aspectRatio: 1 / 1.25,
              child: Image.asset(
                photo!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          endIndent: 50,
          indent: 50,
        ),
      ],
    );
  }
}
