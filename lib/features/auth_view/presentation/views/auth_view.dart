import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = ['المؤتمر الاول', 'المؤتمر الثاني'];
    // form key
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(
                "assets/lottie/Hello.json",
                height: 450,
              ),
              const Text(
                "يا Welcome بيك",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "اكتب/ي اسمك يا نجم/ه";
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
                ),
              ),
              const SizedBox(height: 20),
              ToggleSwitch(
                animationDuration: Duration.hoursPerDay,
                animate: true,
                activeBgColor: [mainColor, mainColor],
                activeFgColor: Colors.white,
                dividerColor: mainColor,
                fontSize: 22,
                minWidth: 160,
                curve: Curves.bounceInOut,
                cornerRadius: 50,
                centerText: true,
                inactiveBgColor: Colors.grey.shade400,
                inactiveFgColor: Colors.black,
                textDirectionRTL: true,
                initialLabelIndex: 0,
                totalSwitches: labels.length,
                labels: labels,
                onToggle: (index) {
                  if (index == null) {
                    String mNum = "first";
                    if (index == 0) {
                      mNum = "first";
                    } else {
                      mNum = "second";
                    }
                    Box box = Hive.box(HiveApi.configrationBox);
                    box.put(HiveApi.mNum, mNum);
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    mainColor,
                  ),
                ),
                onPressed: () {
                  EasyLoading.show(status: 'loading...');
                  // validate the form
                  if (!formKey.currentState!.validate()) {
                    EasyLoading.dismiss();
                    return;
                  } else {
                    Box box = Hive.box(HiveApi.configrationBox);
                    box.put(HiveApi.userNamekey, controller.text);
                    EasyLoading.dismiss();
                    Get.offNamed(GetPages.kHomeView);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
