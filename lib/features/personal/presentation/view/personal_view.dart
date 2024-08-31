import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:mutamaruna/features/personal/presentation/view/widgets/data_card.dart';

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
          centerTitle: true,
          title: const Text(
            "بياناتي",
            style: TextStyle(color: Colors.white),
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
                child: DataCard(name: name, mNum: mNum),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
