import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/functions/check_internet.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';

part 'magmo3at_state.dart';

class Magmo3atCubit extends Cubit<Magmo3atState> {
  Magmo3atCubit() : super(Magmo3atInitial());
  bool kIsconected = false;

  init() async {
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
          .collection('groups')
          .get();
      List<GroupsData> groups = [];
      // getting data from firebase and add it to groups list
      for (var element in docments.docs) {
        groups.add(GroupsData.fromJson(element.data()));
      }

      // store data in hive
      Hive.box(HiveApi.configrationBox).put(HiveApi.groupsKey, groups);
      emit(Magmo3atLoaded(groups));
    } else {
      // getting data from hive
      if (Hive.box(HiveApi.configrationBox).get(HiveApi.groupsKey) != null) {
        List<GroupsData> groups =
            Hive.box(HiveApi.configrationBox).get(HiveApi.groupsKey);
        emit(Magmo3atLoaded(groups));
      } else {
        emit(Magmo3atNullData());
      }
    }
  }

  Future<UserCredential> signInAnonymously() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    return userCredential;
  }

  Future<void> addGroup({
    required TextEditingController groupNameController,
    required XFile? image,
    required TextEditingController passController,
  }) async {
    String imageurl = "";
    String mNum = Hive.box(HiveApi.configrationBox).get(HiveApi.mNum);
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    // upload image
    if (image != null) {
      EasyLoading.show(status: 'uploading image');

      // sign in anonymously
      await signInAnonymously();

      // upload image at this path "motamerat/$mNum/groups/${groupNameController.text}" and getting url
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("motamerat/$mNum/groups/$id");
      UploadTask uploadTask = ref.putFile(File(image.path));
      await uploadTask.whenComplete(() async {
        imageurl = await ref.getDownloadURL();
      });
      EasyLoading.dismiss();

      // delete user
      await FirebaseAuth.instance.currentUser!.delete();
      await FirebaseAuth.instance.signOut();
    }

    // add group
    if (passController.text == password) {
      EasyLoading.show(status: 'loading...');
      FirebaseFirestore.instance
          .collection("motamerat")
          .doc(mNum)
          .collection("groups")
          .doc(id)
          .set({
        "name": groupNameController.text,
        "members": [],
        "imageurl": imageurl,
        "id": id,
      });

      EasyLoading.dismiss();
      Get.back();
    } else {
      EasyLoading.showError("الباسورد خطأ");
    }
  }
}
