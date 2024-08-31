import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:mutamaruna/features/home/presentation/view/widgets/data_card.dart';
import 'package:mutamaruna/features/home/presentation/view/widgets/home_bloc_element.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    String name = Hive.box(HiveApi.configrationBox).get(HiveApi.userNamekey);
    String mNum = Hive.box(HiveApi.configrationBox).get(HiveApi.mNum) == "first"
        ? "المؤتمر الاول"
        : "المؤتمر الثاني";
    return BlocProvider(
      create: (context) => HomeCubit()..init(),
      child: Scaffold(
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
            DataCard(name: name, mNum: mNum),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                        child: const HomeBlocElement(title: "البرنامج")),
                    InkWell(
                        onTap: () {
                          Get.toNamed(GetPages.kNotepage);
                        },
                        child: const HomeBlocElement(title: "ملاحظاتي")),
                    InkWell(
                      onTap: () {
                        Get.toNamed(GetPages.kDerasetketab);
                      },
                      child: const HomeBlocElement(title: "🧐فتشوا الكتب"),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(GetPages.kpost);
                      },
                      child: const HomeBlocElement(title: "منشورات"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
