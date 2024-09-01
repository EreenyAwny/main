import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/models/note_model/note_model.dart';
import 'package:mutamaruna/core/widgets/app_leading.dart';
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
              leading: const AppLeading(),
            ),
            body: isloading == true
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          Form(
                            key: formState,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      hintText: "العنوان",
                                      hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                      )),
                                  onSaved: (value) {
                                    title = value;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return "please enter your note";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  maxLines: 12,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: "ملاحظاتي",
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
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (formState.currentState!.validate()) {
                                formState.currentState!.save();
                                var notemodel =
                                    NoteModel(namee: title, note: info);
                                BlocProvider.of<AddnoteCubit>(context)
                                    .addnote(notemodel);
                                Get.back(result: true);
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                mainColor,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "حفظ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
