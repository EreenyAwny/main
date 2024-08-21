import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/core/models/note_model/note_model.dart';
import 'package:mutamaruna/features/notes/presentation/manager/add_note_cubit/add_note_state.dart';

class AddnoteCubit extends Cubit<AddnotesState> {
  AddnoteCubit() : super(InitialState());
  addnote(NoteModel note) async {
    emit(Addloading());
    try {
      var notesbox = Hive.box<NoteModel>(HiveApi.knoteBox);
      await notesbox.add(note);
      emit(AddSuccess());
    } catch (e) {
      emit(Addfailure(erorr: e.toString()));
    }
  }

  /* CollectionReference notes = FirebaseFirestore.instance
      .collection('motamerat')
      .doc(Hive.box(HiveApi.configrationBox).get(HiveApi.mNum))
      .collection("notes");
  Future<void> addnote({required String info}) async {
    emit(Addloading());

    try {
      await notes.add({
        "name": Hive.box(HiveApi.configrationBox).get(HiveApi.userNamekey),
        "note": info
      });
      emit(AddSuccess());
    } catch (e) {
      emit(Addfailure(erorr: "somthing went wrong"));
    }
  }*/
}

//,'id':FirebaseAuth.instance.currentUser!.uid

/*Future<void> putimage() async {
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
  }*/