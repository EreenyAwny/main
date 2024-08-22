import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/magmo3at_cubit/magmo3at_cubit.dart';

class AddPasswordToGo extends StatelessWidget {
  const AddPasswordToGo({
    super.key,
    required this.groups,
    required this.index,
    required this.formKey,
    required this.passwordcontroller,
  });

  final List<GroupsData> groups;
  final int index;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                "ادخل كلمة المرور",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: TextFormField(
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "اكتب/ي الباسورد من فضلك";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    hintText: "الباسورد",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (passwordcontroller.text == password) {
                      passwordcontroller.clear();
                      BlocProvider.of<Magmo3atCubit>(context)
                          .goToEditPage(groups: groups, index: index);
                    } else {
                      EasyLoading.showError("كلمة المرور غير صحيحة");
                      Get.back();
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(mainColor),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "صفحة التعديل",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
