import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/magmo3at_cubit/magmo3at_cubit.dart';

class ModelBottomSheetBody extends StatelessWidget {
  const ModelBottomSheetBody({
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
    XFile? image;
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const Text(
              "اضافة مجموعة جديدة",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: TextFormField(
                controller: groupNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "اكتب/ي اسم المجموعة";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  hintText: "اسم المجموعة",
                  prefixIcon: const Icon(Icons.group),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: TextFormField(
                controller: passController,
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
            // select image from gallery
            ElevatedButton(
              onPressed: () async {
                // select image from gallery
                final ImagePicker picker = ImagePicker();
                image = await picker.pickImage(source: ImageSource.gallery);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(mainColor),
              ),
              child: const Text(
                "اختر صورة",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<Magmo3atCubit>(context).addGroup(
                    groupNameController: groupNameController,
                    image: image,
                    passController: passController,
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(mainColor),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "اضافة",
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
    );
  }
}
