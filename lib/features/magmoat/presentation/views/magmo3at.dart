import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/magmo3at_cubit/magmo3at_cubit.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/add_group_button.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/magmoat_body.dart';

class Magmo3at extends StatefulWidget {
  const Magmo3at({super.key});

  @override
  State<Magmo3at> createState() => _Magmo3at();
}

class _Magmo3at extends State<Magmo3at> {
  @override
  Widget build(BuildContext context) {
    TextEditingController groupNameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => Magmo3atCubit()..init(),
      child: Scaffold(
        backgroundColor: mainColor,
        floatingActionButton: BlocBuilder<Magmo3atCubit, Magmo3atState>(
          builder: (context, state) {
            if (BlocProvider.of<Magmo3atCubit>(context).admin) {
              return AddGroupButton(
                formKey: formKey,
                groupNameController: groupNameController,
                passController: passController,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "المجموعات",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: mainColor,
          leading: null,
        ),
        body: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white,
            ),
            child: const MagmoatBody()),
      ),
    );
  }
}
