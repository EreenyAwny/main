import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/widgets/User.dart';

class Editeldaraga1 extends StatelessWidget {
  const Editeldaraga1({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "mutamaruna",
            style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),
          ),
          backgroundColor: const Color.fromARGB(255, 49, 33, 109),
        ),
        body: Form(
          key: formState,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: const Text(
                  "مجموعه البابا كيرلس",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: const Color.fromARGB(255, 231, 226, 226),
                      filled: true,
                      hintText: "Enter your note",
                      hintStyle: const TextStyle(fontWeight: FontWeight.w300)),
                  validator: (value) {
                    degree1 += int.parse(value!);
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: const Text(
                  "مجموعه الملاك ميخائيل",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: const Color.fromARGB(255, 231, 226, 226),
                      filled: true,
                      hintText: "Enter your note",
                      hintStyle: const TextStyle(fontWeight: FontWeight.w300)),
                  validator: (value) {
                    degree2 += int.parse(value!);
                    return null;
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        formState.currentState!.save();
                        // Navigator.of(context).pushReplacementNamed("Daragat");
                        Get.toNamed(GetPages.kDaragat2);
                      }
                    },
                    color: Colors.blue,
                    child: const Text("save"),
                  ))
            ],
          ),
        ));
  }
}
