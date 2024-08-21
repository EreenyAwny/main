import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/core/models/note_model/note_model.dart';
import 'package:mutamaruna/features/notes/presentation/manager/notes_cubit/notes_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(Initialstate());
  List<NoteModel>? notes;
  fechAllNotes() {
    var notesbox = Hive.box<NoteModel>(HiveApi.knoteBox);
    notes = notesbox.values.toList();
    emit(StateSuccess());
  }

  deleteNote(note) {
    note.delete();
  }
/*  Future<void> getnotes() async {
    
    data = [];
    emit(loadingstate());
    try {
      QuerySnapshot allData = await FirebaseFirestore.instance
          .collection('motamerat')
          .doc(Hive.box(HiveApi.configrationBox).get(HiveApi.mNum))
          .collection("notes")
          .where('name',
              isEqualTo:
                  Hive.box(HiveApi.configrationBox).get(HiveApi.userNamekey))
          .get();
      data.addAll(allData.docs);
      print("llllllllllllllllllllllllllllllll  ${data.length}");

      emit(successState());
    } catch (e) {
      print("erorrrrrrrrrrrr in getting data  $e");
      emit(failureState());
    }
  }

  CollectionReference Category = FirebaseFirestore.instance
      .collection('motamerat')
      .doc(Hive.box(HiveApi.configrationBox).get(HiveApi.mNum))
      .collection("notes");
  Future<void> deletedata({required String pass}) {
    emit(loadingstate());
    return Category.doc(pass).delete().then((value) {
      print("User Deleted");
      emit(deleteSuccess());
    }).catchError((error) {
      print("Failed to delete user: $error");
      emit(failureState());
    });
  }*/
}
