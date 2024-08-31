import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/functions/check_internet.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/auth_view/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/add_group_members_view.dart';

part 'magmo3at_state.dart';

class Magmo3atCubit extends Cubit<Magmo3atState> {
  bool editMode = false;
  bool kIsconected = false;
  bool admin = false;

  Magmo3atCubit() : super(Magmo3atInitial());

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
      String type = box.get(HiveApi.type);
      if (type == "admin") {
        admin = true;
      }
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

  goToEditPage({required List<GroupsData> groups, required int index}) async {
    EasyLoading.show(status: "جاري التحميل");
    // check internet
    bool isconected = await checkInternet();
    if (isconected) {
      Box box = Hive.box(HiveApi.configrationBox);
      List<String> allnames =
          await gettingAllUsersNames(mNum: box.get(HiveApi.mNum));

      // getting stored members names from hive
      List<String> members = groups[index].members!;

      List<DropdownItem<User>> items = List<DropdownItem<User>>.generate(
        allnames.length,
        (index) {
          return DropdownItem(
            label: allnames[index],
            value: User(name: allnames[index], id: index + 1),
            selected: members.contains(allnames[index]),
          );
        },
      );
      EasyLoading.dismiss();
      Get.toNamed(GetPages.kaddGroupMembers, arguments: {
        "items": items,
        'groupData': groups[index],
      });
    } else {
      EasyLoading.showError("يجب الاتصال بالانترنت");
    }
  }

  Future<FirebaseAuth.UserCredential> signInAnonymously() async {
    FirebaseAuth.UserCredential userCredential =
        await FirebaseAuth.FirebaseAuth.instance.signInAnonymously();
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
      await FirebaseAuth.FirebaseAuth.instance.currentUser!.delete();
      await FirebaseAuth.FirebaseAuth.instance.signOut();
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
