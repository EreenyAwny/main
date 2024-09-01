import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/post_page/presentation/manager/post_cubit/post_cubit.dart';
import 'package:mutamaruna/features/post_page/views/widget/postbottom_sheet_body.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({
    super.key,
    required this.formKey,
    required this.postNameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController postNameController;

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
              create: (context) => PostCubit(),
              child: ModelBottomSheetBody2(
                formKey: formKey,
                postNameController: postNameController,
              ),
            );
          },
        ).then((value) async {
          if (value != null && value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("تم اضافة المنشور بنجاح"),
              ),
            );
            await BlocProvider.of<PostCubit>(context).init();
          }
        });
      },
      backgroundColor: mainColor,
      child: const Icon(Icons.add),
    );
  }
}
