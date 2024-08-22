import 'package:flutter/material.dart';

class AppLeading extends StatelessWidget {
  const AppLeading({
    super.key,
    this.kcolor,
  });

  final Color? kcolor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: kcolor ?? Colors.white,
      ),
    );
  }
}
