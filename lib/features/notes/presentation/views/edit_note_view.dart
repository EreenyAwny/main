import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/features/notes/presentation/manager/edit_note_cubit/editnote_cubit.dart';
import 'package:mutamaruna/features/notes/presentation/manager/edit_note_cubit/editnote_state.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    return BlocConsumer<EditnoteCubit, EditnoteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Edit note",
              style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),
            ),
            backgroundColor: const Color.fromARGB(255, 49, 33, 109),
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
                      // initialValue: oldnote,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          fillColor: const Color.fromARGB(255, 231, 226, 226),
                          filled: true,
                          hintText: "Enter note",
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w300)),
                      validator: (value) {
                        return null;

                        // newnamee=value;
                      },
                    ),
                  )),
              MaterialButton(
                onPressed: () async {},
                color: Colors.red,
                child: const Text("new photo"),
              ),
              MaterialButton(
                onPressed: () {
                  if (formState.currentState!.validate()) {
                    formState.currentState!.save();
                  }

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("Notes", (route) => false);
                },
                color: Colors.blue,
                shape: Border.all(),
                child: const Text("Save"),
              )
            ],
          ),
        );
      },
    );
  }
}
