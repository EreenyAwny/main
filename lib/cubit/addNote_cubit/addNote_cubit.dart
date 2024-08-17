import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mutamaruna/cubit/addNote_cubit/addNote_state.dart';
import 'package:mutamaruna/wedget/User.dart';
import 'package:path/path.dart';

class AddnoteCubit extends Cubit<AddnotesState>{
AddnoteCubit():super(initialState());
File? file;
CollectionReference notes = FirebaseFirestore.instance.collection('Notes');
Future<void>Addnote({required String info})async{
emit(addloading());
   
try{
   DocumentReference response=await notes.add({"note":info ,"image":uri ??"none",'id':FirebaseAuth.instance.currentUser!.uid});
   print("sssssssssssssssssssssssssssssss $uri");
   emit(addSuccess());
      }catch (e){
        print("Error $e");
        emit(addfailure(erorr: "somthing went wrong"));
      }
    
    
  }
  Future<void>putimage()async{
    uri="";
   try{ final ImagePicker picker = ImagePicker();
final XFile? imagecamera= await picker.pickImage(source: ImageSource.gallery);
if(imagecamera!= null){
 file=File(imagecamera.path);}

var imagename=basename(imagecamera!.path);
var imageref=FirebaseStorage.instance.ref("image/$imagename");
emit(addloading());
await imageref.putFile(file!);
uri=await imageref.getDownloadURL();
print("ahoooooooooooooooo $uri");
emit(addimageSuccess());
}catch(ee){
  print("eroooooooooooooooooooooooooooo $ee");
  emit(addfailure(erorr: "somthing went wrong"));
}
  }

}

//,'id':FirebaseAuth.instance.currentUser!.uid