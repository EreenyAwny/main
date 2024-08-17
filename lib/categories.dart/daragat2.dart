import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/hive_api.dart';

class Daragat2 extends StatelessWidget {
  const Daragat2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "درجاتك يا بيه",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 174, 75)),
        ),
        backgroundColor: const Color.fromARGB(255, 49, 33, 109),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 27, 90, 142),
          ),
          Column(
            children: [
              Container(
                height: 100,
                width: 500,
                padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
                alignment: Alignment.center,
                child: const Text(
                  "😏😏حب مجموعتك عشان نحبك",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              Center(
                  child: InkWell(
                onTap: () {
                  HiveApi hiveApi = HiveApi();
                  Box box = Hive.box(hiveApi.configration);
                  box.put(hiveApi.mNum, "first");
                  Navigator.of(context).pushNamed("Daragatmo2tamer1");
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.asset(
                        "images/Screenshot (172).png",
                        fit: BoxFit.cover,
                      ),
                    )),
              )),
              Center(
                  child: InkWell(
                onTap: () {
                  HiveApi hiveApi = HiveApi();
                  Box box = Hive.box(hiveApi.configration);
                  box.put(hiveApi.mNum, "second");
                  Navigator.of(context).pushNamed("Daragatmo2tamer2");
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.asset(
                        "images/Screenshot (177).png",
                        fit: BoxFit.cover,
                      ),
                    )),
              )),
            ],
          )
        ],
      ),
    );
  }
}
