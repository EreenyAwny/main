import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/models/note_model/note_model.dart';
import 'package:mutamaruna/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:mutamaruna/features/notes/presentation/manager/notes_cubit/notes_states.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesView();
}

class _NotesView extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fechAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> note = BlocProvider.of<NotesCubit>(context).notes!;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "ملاحظاتك 📝",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: mainColor,
          ),
          body: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: note.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    note_detail = note[i].note!;
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
                        BlocProvider.of<NotesCubit>(context)
                            .deleteNote(note[i]);
                        BlocProvider.of<NotesCubit>(context).fechAllNotes();
                      },
                      btnOkOnPress: () {
                        note_detail = note[i].note!;
                        note_toChange = note[i];
                        Get.toNamed(GetPages.kEditNoteView);
                      },
                    ).show();
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 234, 225, 225),
                    child: Column(
                      children: [
                        Text(
                          "${note[i].note}",
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
