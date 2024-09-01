import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/widgets/app_leading.dart';
import 'package:mutamaruna/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تعديل ملاحظتك",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: mainColor,
        leading: const AppLeading(),
      ),
      body: Form(
        key: formState,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: note_title,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "اضف العنوان",
                    hintStyle: const TextStyle(fontWeight: FontWeight.w300)),
                validator: (newvalue) {
                  note_toChange!.namee = newvalue;
                  note_toChange?.save();
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: note_detail,
                maxLines: 20,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "اضف ملاحظتك",
                    hintStyle: const TextStyle(fontWeight: FontWeight.w300)),
                validator: (value) {
                  note_toChange!.note = value;
                  note_toChange?.save();
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formState.currentState!.validate()) {
                    formState.currentState!.save();
                  }
                  BlocProvider.of<NotesCubit>(context).fechAllNotes();
                  Get.back(result: true);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    mainColor,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "حفظ التعديل",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
