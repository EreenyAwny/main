import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/cubit/addNote_cubit/addNote_cubit.dart';
import 'package:mutamaruna/cubit/addNote_cubit/addNote_state.dart';
import 'package:mutamaruna/cubit/notes_cubit/notes_cubit.dart';
import 'package:mutamaruna/cubit/notes_cubit/notes_states.dart';

class Addnotes extends StatelessWidget {
  String? info;
  bool isloading = false;
  bool isadded = false;
  GlobalKey<FormState> formState = GlobalKey();

  Addnotes({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddnoteCubit, AddnotesState>(
        listener: (context, state) {
      if (state is loadingstate) {
        isloading = true;
      }
      if (state is addSuccess) {
        isloading = false;
      }
      if (state is addimageSuccess) {
        isloading = false;
        isadded = true;
      }
      if (state is addfailure) {
        isloading = false;
        alert(
          context,
          title: Text(state.err!),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Add your note",
              style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),
            ),
            backgroundColor: const Color.fromARGB(255, 49, 33, 109),
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
                            padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
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
                                          hintText: "Enter your note",
                                          hintStyle: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                          )),
                                      validator: (value) {
                                        info = value;
                                        return null;
                                      },
                                    ),
                                  ),
                                ])),
                      ),
                      MaterialButton(
                        onPressed: () {
                          isloading = true;
                          BlocProvider.of<AddnoteCubit>(context).putimage();
                        },
                        color: isadded == false ? Colors.red : Colors.green,
                        child: const Text("add photo"),
                      ),
                      MaterialButton(
                        color: Colors.green,
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            formState.currentState!.save();
                            BlocProvider.of<AddnoteCubit>(context)
                                .Addnote(info: info!);
                            Navigator.of(context)
                                .pushReplacementNamed("Notepage");
                            BlocProvider.of<NotesCubit>(context).getnotes();
                          }
                        },
                        shape: Border.all(),
                        child: const Text("save"),
                      ),
                    ],
                  ),
                ));
    });
  }
}
