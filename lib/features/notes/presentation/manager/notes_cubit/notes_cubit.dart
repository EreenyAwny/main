import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/features/notes/presentation/manager/notes_cubit/notes_states.dart';
import 'package:mutamaruna/core/widgets/User.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(initialstate());
  Future<void> getnotes() async {
    data = [];
    emit(loadingstate());
    try {
      QuerySnapshot allData = await FirebaseFirestore.instance
          .collection('Notes')
          .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      data.addAll(allData.docs);
      print("llllllllllllllllllllllllllllllll  ${data.length}");

      emit(successState());
    } catch (e) {
      print("erorrrrrrrrrrrr in getting data  $e");
      emit(failureState());
    }
  }

  CollectionReference Category = FirebaseFirestore.instance.collection('Notes');
  Future<void> deletedata({required String pass}) {
    emit(loadingstate());
    return Category.doc(pass).delete().then((value) {
      print("User Deleted");
      emit(deleteSuccess());
    }).catchError((error) {
      print("Failed to delete user: $error");
      emit(failureState());
    });
  }
}
