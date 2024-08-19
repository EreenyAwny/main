import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
              key: formState,
              child: Container(
                width: 350,
                padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: TextFormField(
                  initialValue: note_detail,
                  maxLines: 12,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: const Color.fromARGB(255, 231, 226, 226),
                      filled: true,
                      hintText: "اضف ملاحظتك",
                      hintStyle: const TextStyle(fontWeight: FontWeight.w300)),
                  validator: (value) {
                    note_toChange!.note = value;
                    note_toChange?.save();
                    return null;
                  },
                ),
              )),
          MaterialButton(
            onPressed: () {
              if (formState.currentState!.validate()) {
                formState.currentState!.save();
              }
              BlocProvider.of<NotesCubit>(context).fechAllNotes();
              Get.toNamed(GetPages.kNotepage);
            },
            color: Colors.blue,
            shape: Border.all(),
            child: const Text("حفظ التعديل"),
          )
        ],
      ),
    );
  }
}
