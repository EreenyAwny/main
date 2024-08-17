import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/features/notes/presentation/manager/add_note_cubit/add_note_state.dart';

class AddnoteCubit extends Cubit<AddnotesState> {
  AddnoteCubit() : super(InitialState());
  File? file;
  CollectionReference daraga = FirebaseFirestore.instance.collection('Daraga');
  Future<void> addnote({required int daragaa}) async {
    emit(Addloading());

    try {
      await daraga.add(
          {"degree": daragaa, 'id': FirebaseAuth.instance.currentUser!.uid});
      emit(AddSuccess());
    } catch (e) {
      print("Error $e");
      emit(Addfailure(erorr: "somthing went wrong"));
    }
  }
}
