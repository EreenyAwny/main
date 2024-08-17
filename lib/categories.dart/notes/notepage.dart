import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/cubit/notes_cubit/notes_cubit.dart';
import 'package:mutamaruna/cubit/notes_cubit/notes_states.dart';
import 'package:mutamaruna/wedget/User.dart';

class Notepage extends StatelessWidget {
  @override
  bool isloading = true;

  Notepage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(listener: (context, state) {
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
    }, builder: (context, state) {
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
                      Navigator.of(context).pushNamed("Notedetails");
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
                          }).show();
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
            print(data.length);
            uri = "";
            print(uri);

            Navigator.of(context).popAndPushNamed("Addnotes");
          },
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
