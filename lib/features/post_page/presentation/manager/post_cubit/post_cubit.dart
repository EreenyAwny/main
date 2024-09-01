import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mutamaruna/core/functions/check_internet.dart';
import 'package:mutamaruna/core/hive_api.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  bool editMode = false;
  bool kIsconected = false;

  PostCubit() : super(PostInitial());

  Future<void> init() async {
    // check internet
    bool isconected = await checkInternet();
    kIsconected = isconected;
    if (isconected) {
      //getting data from firebase
      Box box = Hive.box(HiveApi.configrationBox);
      String mNum = box.get(HiveApi.mNum);
      var docments = await FirebaseFirestore.instance
          .collection("motamerat")
          .doc(mNum)
          .collection("posts")
          .get();
      List<QueryDocumentSnapshot> posts = [];
      posts.addAll(docments.docs);
      emit(PostLoaded(posts));
    } else {
      emit(PostNullData());
    }
  }

  Future<FirebaseAuth.UserCredential> signInAnonymously() async {
    FirebaseAuth.UserCredential userCredential =
        await FirebaseAuth.FirebaseAuth.instance.signInAnonymously();
    return userCredential;
  }

  Future<void> addpost({
    required TextEditingController postNameController,
    required XFile? image,
  }) async {
    EasyLoading.show(status: 'loading...');
    String imageurl = "null";
    String mNum = Hive.box(HiveApi.configrationBox).get(HiveApi.mNum);
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    // upload image
    if (image != null) {
      EasyLoading.dismiss();
      EasyLoading.show(status: 'uploading image');

      // sign in anonymously
      await signInAnonymously();

      // upload image at this path "motamerat/$mNum/posts/${groupNameController.text}" and getting url
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("motamerat/$mNum/posts/$id");
      UploadTask uploadTask = ref.putFile(File(image.path));
      await uploadTask.whenComplete(() async {
        imageurl = await ref.getDownloadURL();
      });
      EasyLoading.dismiss();

      // delete user
      await FirebaseAuth.FirebaseAuth.instance.currentUser!.delete();
      await FirebaseAuth.FirebaseAuth.instance.signOut();
    }
    String dateOBDCommand = DateTime.now().toString();
    DateTime date = DateTime.parse(dateOBDCommand);
    String result = DateFormat('yyyy-MM-dd | HH:mm').format(date);
    // add post
    EasyLoading.show(status: 'loading...');
    await FirebaseFirestore.instance
        .collection("motamerat")
        .doc(mNum)
        .collection("posts")
        .doc(id)
        .set({
      "name": Hive.box(HiveApi.configrationBox).get(HiveApi.userNamekey),
      "text": postNameController.text,
      "imageurl": imageurl,
      "id": id,
      "time": result,
      "likes": 0,
    });
    EasyLoading.dismiss();
  }
}
