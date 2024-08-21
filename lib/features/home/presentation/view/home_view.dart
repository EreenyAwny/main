import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/home/presentation/view/widgets/home_bloc_element.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    String name = Hive.box(HiveApi.configrationBox).get(HiveApi.userNamekey);
    String mNum = Hive.box(HiveApi.configrationBox).get(HiveApi.mNum) == "first"
        ? "المؤتمر الاول"
        : "المؤتمر الثاني";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "موتمرنا",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: mainColor,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: mainColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "أهلاً: $name",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "المؤتمر: $mNum",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "المجموعة: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(GetPages.kMagmo3at);
                    },
                    child: const HomeBlocElement(title: "المجموعات"),
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed(GetPages.kElpernameg);
                      },
                      child: const HomeBlocElement(
                          title: " Now What? (البرنامج)")),
                  InkWell(
                      onTap: () {
                        Get.toNamed(GetPages.kNotepage);
                      },
                      child: const HomeBlocElement(title: "📝اكتب ملاحظاتك")),
                  InkWell(
                    onTap: () {
                      Get.toNamed(GetPages.kDerasetketab);
                    },
                    child: const HomeBlocElement(title: "🧐فتشوا الكتب"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
