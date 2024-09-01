import 'package:flutter/material.dart';

class NameTextBox extends StatelessWidget {
  const NameTextBox({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (value) {
          // text should contain three words
          if (value == null || value.isEmpty) {
            return "اكتب/ي اسمك يا نجم/ه";
          }
          if (value.split(" ").length < 3) {
            return "الاسم لازم يكون ثلاثي علشان تشابه الاسماء";
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          hintStyle: const TextStyle(
            fontSize: 20,
          ),
          hintText: "اكتب اسمك",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
