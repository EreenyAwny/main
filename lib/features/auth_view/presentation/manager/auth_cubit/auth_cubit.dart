import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/hive_api.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String type = "user";
  List<String> labels = ['المؤتمر الاول', 'المؤتمر الثاني'];
  List<String> types = ['User', 'Admin'];
  String mNum = "first";
  TextEditingController passController = TextEditingController();

  submit({required String name}) {
    EasyLoading.show(status: 'loading...');
    // save data to hive
    Box box = Hive.box(HiveApi.configrationBox);
    box.put(HiveApi.userNamekey, name);
    Box box2 = Hive.box(HiveApi.configrationBox);
    box2.put(HiveApi.mNum, mNum);
    if (type == "admin" && passController.text == password) {
      box2.put(HiveApi.type, type);
      Get.offNamed(GetPages.kHomeView);
    } else if (type == "admin" && passController.text != password) {
      EasyLoading.showError("كلمة المرور غير صحيحة");
      box2.put(HiveApi.type, type);
    } else {
      box2.put(HiveApi.type, type);
      // save data to firebase firestore
      _saveDataToFirestore(name: name, mNum: mNum);
      Get.offNamed(GetPages.kHomeView);
    }
    EasyLoading.dismiss();
  }

  showpassword(bool value) {
    if (value) {
      type = "admin";
      emit(AuthShowPassword());
    } else {
      type = "user";
      print("object");
      emit(AuthInitial());
    }
  }

  Future<void> _saveDataToFirestore(
      {required String name, required String mNum}) async {
    // getting old list of users
    List<String> users = await gettingAllUsersNames(mNum: mNum);
    users.add(name);
    DocumentSnapshot path =
        await FirebaseFirestore.instance.collection("users").doc(mNum).get();
    if (path.exists) {
      await FirebaseFirestore.instance.collection("users").doc(mNum).update({
        "users": users,
      });
    } else {
      await FirebaseFirestore.instance.collection("users").doc(mNum).set({
        "users": users,
      });
    }
  }
}

Future<List<String>> gettingAllUsersNames({required String mNum}) async {
  List<String> users = [];
  await FirebaseFirestore.instance
      .collection("users")
      .doc(mNum)
      .get()
      .then((value) {
    if (value.exists) {
      users = List<String>.from(value.data()!["users"]);
    }
  });
  Box box = Hive.box(HiveApi.configrationBox);
  box.put(HiveApi.allUserskey, users);

  return users;
}
