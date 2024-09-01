import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:googleapis/appengine/v1.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/functions/send_notification.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/core/widgets/app_leading.dart';

class SendNotificationView extends StatelessWidget {
  const SendNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    XFile? image;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: const AppLeading(),
        title: const Text('Send Notification',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  "رجاء العلم بان الاشعارات سترسل للجميع",
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'العنوان',
                    hintText: 'ادخل العنوان',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    labelText: 'المحتوي',
                    hintText: 'ادخل محتوي الاشعار',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    // select image from gallery
                    final ImagePicker picker = ImagePicker();
                    image = await picker.pickImage(source: ImageSource.gallery);
                  },
                  child: const Card(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('الصورة', style: TextStyle(fontSize: 20)),
                          Icon(Icons.image, size: 30),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      EasyLoading.show(status: 'جاري الارسال');
                      String imageurl = "";
                      String mNum =
                          Hive.box(HiveApi.configrationBox).get(HiveApi.mNum);
                      String id =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      // upload image
                      if (image != null) {
                        EasyLoading.dismiss();
                        EasyLoading.show(status: 'جاري رفع الصورة');

                        // sign in anonymously
                        await signInAnonymously();

                        // upload image at this path "motamerat/$mNum/groups/${groupNameController.text}" and getting url
                        FirebaseStorage storage = FirebaseStorage.instance;
                        Reference ref = storage
                            .ref()
                            .child("motamerat/$mNum/notification/$id");
                        UploadTask uploadTask = ref.putFile(File(image!.path));
                        await uploadTask.whenComplete(() async {
                          imageurl = await ref.getDownloadURL();
                        });
                        EasyLoading.dismiss();

                        // delete user
                        await FirebaseAuth.instance.currentUser!.delete();
                        await FirebaseAuth.instance.signOut();
                      }

                      await Notifications().sendNotification(
                        title: titleController.text,
                        body: contentController.text,
                        imageLink: imageurl,
                      );
                      EasyLoading.showSuccess('تم الارسال بنجاح');
                    } on Exception catch (e) {
                      ErrorHandler(errorCode: e.toString());
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(mainColor),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'إرسال',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<UserCredential> signInAnonymously() async {
  UserCredential userCredential =
      await FirebaseAuth.instance.signInAnonymously();
  return userCredential;
}
