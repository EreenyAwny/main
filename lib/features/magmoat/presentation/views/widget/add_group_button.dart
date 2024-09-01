import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/magmo3at_cubit/magmo3at_cubit.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/bottom_sheet_body.dart';

class AddGroupButton extends StatelessWidget {
  const AddGroupButton({
    super.key,
    required this.formKey,
    required this.groupNameController,
    required this.passController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController groupNameController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // show modal bottom sheet
        showModalBottomSheet(
          elevation: 2,
          isScrollControlled: true,
          enableDrag: true,
          showDragHandle: true,
          useSafeArea: true,
          isDismissible: true,
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => Magmo3atCubit(),
              child: ModelBottomSheetBody(
                formKey: formKey,
                groupNameController: groupNameController,
              ),
            );
          },
        );
      },
      backgroundColor: mainColor,
      child: const Icon(Icons.add),
    );
  }
}
