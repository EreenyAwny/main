import 'package:flutter/material.dart';

class NameAndGrade extends StatelessWidget {
  const NameAndGrade({
    super.key,
    required this.groups,
    required this.index,
  });

  final List groups;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "الاسم: ${groups[index].name!}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "الدرجة: ${groups[index].grade ?? 0}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
