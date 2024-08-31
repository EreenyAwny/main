import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/widgets/card_derasetketab.dart';

class Derasetketab extends StatelessWidget {
  const Derasetketab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: const Text(
          "🧐فتشوا الكتب",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: mainColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "فَاذْكُرْ مِنْ أَيْنَ سَقَطْتَ وَتُبْ، وَاعْمَلِ الأَعْمَالَ الأُولَى، وَإِّلاَّ فَإِنِّي آتِيكَ عَنْ قَرِيبٍ وَأُزَحْزِحُ مَنَارَتَكَ مِنْ مَكَانِهَا، إِنْ لَمْ تَتُبْ. (رؤ 2: 5)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(GetPages.kDerasetketab1);
                  },
                  child: const CardDerasetketab(
                    day_title: "اليوم الاول : حوش اللى وقع منك روحيا ",
                    subject1:
                        "بطرس و يوحنا أنا أذهب لأتصيد ( انجيل يوحنا  21 : 1 - 7) ",
                    subject2: "",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(GetPages.kDerasetketab2);
                  },
                  child: const CardDerasetketab(
                    day_title: "اليوم الثانى : حوش اللى وقع منك اجتماعيا ",
                    subject1: "١ - راحيل و ليئه ( تكوين 30 : 1 - 24 )",
                    subject2: "٢ ـ راعوث و نعمه (راعوث 1 : 1- 18)",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(GetPages.kDerasetketab3);
                  },
                  child: const CardDerasetketab(
                    day_title: "اليوم الثالث حوش اللى وقع منك اخلاقيا ",
                    subject1:
                        "١ - خطيئة داود مع بثشبع و قتل اوريا الحثى (2صم  11 : 1 - 18 )",
                    subject2:
                        "٢ ـ  سليمان ( انحرافه نحو الوثنيَّة) ( 1مل 11 : 1 - 12 )",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(GetPages.kDerasetketab4);
                  },
                  child: const CardDerasetketab(
                    day_title: "اليوم الرابع حوش اللى وقع منك ذاتيا ",
                    subject1:
                        "١ - يوسف يصبح الرجل الثانى فى مصر ( تك 41 : 25 - 46 )",
                    subject2: "٢ - يهوديت تخلص شعب اسرائيل (يهو 13 : 1 - 22 )",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
