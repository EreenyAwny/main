import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/auth_view/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:mutamaruna/features/auth_view/presentation/views/widgets/name_text_box.dart';
import 'package:mutamaruna/features/auth_view/presentation/views/widgets/switchable_for_num_of_motamer.dart';
import 'package:mutamaruna/features/auth_view/presentation/views/widgets/switchable_for_num_of_type.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> passFormKey = GlobalKey<FormState>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        const SwitchableForNumOfMotamer(),
        const SizedBox(height: 10),
        NameTextBox(formKey: formKey, controller: controller),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthShowPassword) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Form(
                      key: passFormKey,
                      child: TextFormField(
                        obscureText: true,
                        controller:
                            BlocProvider.of<AuthCubit>(context).passController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          hintText: "الباسورد",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "لازم تكتب الباسورد";
                          } else if (value.length < 6) {
                            return "الباسورد لازم يكون اكتر من 6 حروف";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        const SizedBox(height: 10),
        const SwitchableForNumOfType(),
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
              if (passFormKey.currentState == null ||
                  !passFormKey.currentState!.validate() &&
                      BlocProvider.of<AuthCubit>(context).state
                          is AuthShowPassword) {
                EasyLoading.dismiss();
              }
              return;
            } else {
              if (!passFormKey.currentState!.validate() &&
                  BlocProvider.of<AuthCubit>(context).state
                      is AuthShowPassword) {
                EasyLoading.dismiss();
                return;
              }
            }

            await BlocProvider.of<AuthCubit>(context).submit(
              name: controller.text,
            );

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
