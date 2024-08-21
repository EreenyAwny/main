import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/auth_view/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:mutamaruna/features/auth_view/presentation/views/widgets/name_text_box.dart';
import 'package:mutamaruna/features/auth_view/presentation/views/widgets/switchable_for_num_of_motamer.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        NameTextBox(formKey: formKey, controller: controller),
        const SizedBox(height: 20),
        const SwitchableForNumOfMotamer(),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              mainColor,
            ),
          ),
          onPressed: () async {
            EasyLoading.show(status: 'loading...');
            // validate the form
            if (!formKey.currentState!.validate()) {
              EasyLoading.dismiss();
              return;
            } else {
              await BlocProvider.of<AuthCubit>(context).submit(
                name: controller.text,
              );
            }
            EasyLoading.dismiss();
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
    );
  }
}
