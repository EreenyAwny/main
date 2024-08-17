import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/hive_api.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(160),
                    border: Border.all(
                      color: mainColor,
                      width: 8,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: const AssetImage("images/1.jpg"),
                      backgroundColor: mainColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    '''وَالآنَ هكَذَا يَقُولُ الرَّبُّ، خَالِقُكَ يَا يَعْقُوبُ وَجَابِلُكَ يَا إِسْرَائِيلُ: «لاَ تَخَفْ لأَنِّي فَدَيْتُكَ. دَعَوْتُكَ بِاسْمِكَ. أَنْتَ لِي. (إش 43: 1)''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(mainColor),
                ),
                onPressed: () {
                  EasyLoading.show(status: 'loading...');
                  Box box = Hive.box(HiveApi.configrationBox);
                  box.get(HiveApi.userNamekey) == null
                      ? Get.offNamed(GetPages.kAuth)
                      : Get.offNamed(GetPages.kHomeView);
                  EasyLoading.dismiss();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.white,
                        size: 25,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "حوش اللي وقع منك",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
