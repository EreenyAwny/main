import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/widgets/User.dart';
import 'package:mutamaruna/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:mutamaruna/features/notes/presentation/manager/notes_cubit/notes_states.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isloading = true;
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is loadingstate) {
          isloading = true;
        }
        if (state is successState) {
          isloading = false;
        }
        if (state is deleteSuccess) {
          isloading = false;
          BlocProvider.of<NotesCubit>(context).getnotes();
        }
        if (state is failureState) {
          isloading = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Your notes",
              style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),
            ),
            backgroundColor: const Color.fromARGB(255, 49, 33, 109),
          ),
          body: isloading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        notedetail(
                            nott: "${data[i]['note']}",
                            imag: "${data[i]['image']}");
                        Get.toNamed(GetPages.kNotedetails);
                      },
                      onLongPress: () {
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.rightSlide,
                          desc: "what do you want",
                          btnOkText: "تعديل",
                          btnCancelText: "مسح",
                          btnCancelOnPress: () {
                            print("${data[i]['image']}");
                            BlocProvider.of<NotesCubit>(context)
                                .deletedata(pass: data[i].id);
                          },
                          btnOkOnPress: () {
                            if (data[i]['image'] != "none") {
                              FirebaseStorage.instance
                                  .refFromURL(data[i]['image'])
                                  .delete();
                            }
                            FirebaseFirestore.instance
                                .collection('Notes')
                                .doc(data[i].id)
                                .delete();
                          },
                        ).show();
                      },
                      child: Card(
                        color: (i % 2) == 0 ? Colors.red : Colors.green,
                        child: Column(
                          children: [
                            Text(
                              "${data[i]['note']}",
                              style: const TextStyle(fontSize: 24),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              uri = "";
              Get.toNamed(GetPages.kAddnotes);
            },
            backgroundColor: Colors.blue,
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
