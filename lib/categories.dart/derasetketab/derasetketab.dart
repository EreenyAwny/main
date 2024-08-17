import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';

class Derasetketab extends StatelessWidget {
  const Derasetketab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "🧐فتشوا الكتب",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 174, 75)),
        ),
        backgroundColor: const Color.fromARGB(255, 49, 33, 109),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 800,
            width: 500,
            child: Image.asset(
              "images/Screenshot (177).png",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: const Text(
                  "فَاذْكُرْ مِنْ أَيْنَ سَقَطْتَ وَتُبْ، وَاعْمَلِ الأَعْمَالَ الأُولَى، وَإِّلاَّ فَإِنِّي آتِيكَ عَنْ قَرِيبٍ وَأُزَحْزِحُ مَنَارَتَكَ مِنْ مَكَانِهَا، إِنْ لَمْ تَتُبْ. (رؤ 2: 5)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              InkWell(
                  onTap: () {
                    Get.toNamed(GetPages.kDerasetketab1);
                  },
                  child: const Card(
                    child: ListTile(
                      title: Text(
                        "اليوم الاول : حوش اللى وقع منك روحيا ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "بطرس و يوحنا أنا أذهب لأتصيد ( انجيل يوحنا  21 : 1 - 7) ",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  )),
              const InkWell(
                  child: Card(
                child: ListTile(
                  title: Text(
                    "اليوم الثانى : حوش اللى وقع منك اجتماعيا ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "١ - راحيل و ليئه ( تكوين 30 : 1 - 24 )",
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "٢ ـ راعوث و نعمه (راعوث 1 : 1- 18)",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              )),
              const InkWell(
                  child: Card(
                child: ListTile(
                  title: Text(
                    "اليوم الثالث حوش اللى وقع منك اخلاقيا ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "١ - خطيئة داود مع بثشبع و قتل اوريا الحثى (2صم  11 : 1 - 18 )",
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "٢ ـ  سليمان ( انحرافه نحو الوثنيَّة) ( 1مل 11 : 1 - 12 )",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              )),
              const InkWell(
                  child: Card(
                child: ListTile(
                  title: Text(
                    "اليوم الرابع حوش اللى وقع منك ذاتيا ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "١ - يوسف يصبح الرجل الثانى فى مصر ( تك 41 : 25 - 46 )",
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "٢ - يهوديت تخلص شعب اسرائيل (يهو 13 : 1 - 22 )",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
