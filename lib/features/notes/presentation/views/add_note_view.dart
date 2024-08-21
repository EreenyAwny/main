import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/models/note_model/note_model.dart';
import 'package:mutamaruna/features/notes/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:mutamaruna/features/notes/presentation/manager/add_note_cubit/add_note_state.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});
  @override
  State<AddNoteView> createState() => _AddNoteView();
}

class _AddNoteView extends State<AddNoteView> {
  @override
  Widget build(BuildContext context) {
    String? info;
    String? title;
    bool isloading = false;
    GlobalKey<FormState> formState = GlobalKey();

    return BlocProvider(
      create: (context) => AddnoteCubit(),
      child: BlocConsumer<AddnoteCubit, AddnotesState>(
        listener: (context, state) {
          if (state is Addloading) {
            isloading = true;
          }
          if (state is AddSuccess) {
            isloading = false;
          }

          if (state is Addfailure) {
            isloading = false;
            alert(
              context,
              title: Text(state.erorr),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "اضف ملاحظاتك",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: mainColor,
            ),
            body: isloading == true
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                          key: formState,
                          child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 10, 10),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: const EdgeInsets.all(0),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            fillColor: const Color.fromARGB(
                                                255, 231, 226, 226),
                                            filled: true,
                                            hintText: "اكتب العنوان",
                                            hintStyle: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                            )),
                                        onSaved: (Value) {
                                          title = Value;
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return "please enter your note";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(0),
                                      child: TextFormField(
                                        maxLines: 12,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            fillColor: const Color.fromARGB(
                                                255, 231, 226, 226),
                                            filled: true,
                                            hintText: "اكتب ملاحظاتك",
                                            hintStyle: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                            )),
                                        onSaved: (newValue) {
                                          info = newValue;
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return "please enter your note";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ])),
                        ),
                        MaterialButton(
                          color: mainColor,
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              formState.currentState!.save();
                              var notemodel =
                                  NoteModel(namee: title, note: info);
                              BlocProvider.of<AddnoteCubit>(context)
                                  .addnote(notemodel);
                              Get.toNamed(GetPages.kNotepage);
                            }
                          },
                          shape: Border.all(),
                          child: const Text("حفظ"),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
