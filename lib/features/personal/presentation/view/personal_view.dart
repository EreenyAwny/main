import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/personal/presentation/manager/home_cubit/home_cubit.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({super.key});

  @override
  Widget build(BuildContext context) {
    String name = Hive.box(HiveApi.configrationBox).get(HiveApi.userNamekey);
    String mNum = Hive.box(HiveApi.configrationBox).get(HiveApi.mNum) == "first"
        ? "المؤتمر الاول"
        : "المؤتمر الثاني";
    return BlocProvider(
      create: (context) => HomeCubit()..init(),
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          actions: [
            Hive.box(HiveApi.configrationBox).get(HiveApi.type) == "admin"
                ? Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_active,
                          color: Colors.white),
                      iconSize: 30,
                      onPressed: () {
                        Get.toNamed(GetPages.kSendNotificationView);
                      },
                    ),
                  )
                : const SizedBox(),
            Hive.box(HiveApi.configrationBox).get(HiveApi.type) == "admin"
                ? IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    iconSize: 30,
                    onPressed: () {
                      Get.toNamed(GetPages.ksettingsView);
                    },
                  )
                : const SizedBox(),
          ],
          centerTitle: true,
          title: const Text(
            "بياناتي",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "أهلاً: $name",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      mNum,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is HomeGroupNameFound) {
                          return Text(
                            state.myGroup,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          );
                        } else if (state is HomeGroupNameNotFound) {
                          return Text(
                            "لم تنضم لأي مجموعة بعد",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          );
                        } else if (state is HomeLoadingData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const Divider(
                      endIndent: 70,
                      indent: 70,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "الشعار",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(endIndent: 120, indent: 120),
                    // الشعار
                    Image.asset(
                      "images/slo.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
