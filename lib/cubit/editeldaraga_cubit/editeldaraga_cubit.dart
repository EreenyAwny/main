
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/cubit/addNote_cubit/addNote_state.dart';

class AddnoteCubit extends Cubit<AddnotesState>{
AddnoteCubit():super(initialState());
File? file;
CollectionReference daraga = FirebaseFirestore.instance.collection('Daraga');
Future<void>Addnote({required int daragaa})async{
emit(addloading());
   
try{
   DocumentReference response=await daraga.add({"degree":daragaa ,'id':FirebaseAuth.instance.currentUser!.uid});
   emit(addSuccess());
      }catch (e){
        print("Error $e");
        emit(addfailure(erorr: "somthing went wrong"));
      }
    
    
  }}