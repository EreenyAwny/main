import 'package:flutter/cupertino.dart';

class Item extends StatelessWidget {
  const Item({super.key, this.day, this.photo});

  final String? day;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
