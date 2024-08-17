import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mutamaruna/features/notes/presentation/manager/add_note_cubit/add_note_state.dart';
import 'package:mutamaruna/core/widgets/User.dart';
import 'package:path/path.dart';

class AddnoteCubit extends Cubit<AddnotesState> {
  AddnoteCubit() : super(InitialState());
  File? file;
  CollectionReference notes = FirebaseFirestore.instance.collection('Notes');
  Future<void> addnote({required String info}) async {
    emit(Addloading());

    try {
      await notes.add({
        "note": info,
        "image": uri ?? "none",
        'id': FirebaseAuth.instance.currentUser!.uid
      });
      emit(AddSuccess());
    } catch (e) {
      emit(Addfailure(erorr: "somthing went wrong"));
    }
  }

  Future<void> putimage() async {
    uri = "";
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imagecamera =
          await picker.pickImage(source: ImageSource.gallery);
      if (imagecamera != null) {
        file = File(imagecamera.path);
      }

      var imagename = basename(imagecamera!.path);
      var imageref = FirebaseStorage.instance.ref("image/$imagename");
      emit(Addloading());
      await imageref.putFile(file!);
      uri = await imageref.getDownloadURL();
      emit(AddimageSuccess());
    } catch (ee) {
      emit(Addfailure(erorr: "somthing went wrong"));
    }
  }
}

//,'id':FirebaseAuth.instance.currentUser!.uid