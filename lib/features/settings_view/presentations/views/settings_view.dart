import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/core/widgets/app_leading.dart';
import 'package:mutamaruna/features/auth_view/presentation/manager/auth_cubit/auth_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box(HiveApi.configrationBox);
    String mNum = box.get(HiveApi.mNum);
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        leading: const AppLeading(),
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text("دوس علي الاسم علشان تحذفه",
                style: TextStyle(fontSize: 18, color: Colors.red)),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                  stream: streamAllUsersNames(mNum: mNum),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    } else if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("No Data"),
                      );
                    } else if (snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  title: Text(snapshot.data![index]),
                                  leading: Icon(Icons.person, color: mainColor),
                                  onTap: () {
                                    // show dialog to confirm delete
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Delete User"),
                                          content: const Text(
                                              "هل انت متأكد انك تريد حذف هذا المستخدم؟"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancel"),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                //delete from firebase
                                                await deleteMethod(
                                                  mNum,
                                                  snapshot,
                                                  index,
                                                  box,
                                                  context,
                                                );
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Delete"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteMethod(String mNum, AsyncSnapshot<List<String>> snapshot,
      int index, Box<dynamic> box, BuildContext context) async {
    EasyLoading.show(status: 'جاري الحذف...');
    List<dynamic> users = [];
    await FirebaseFirestore.instance
        .collection("users")
        .doc(mNum)
        .get()
        .then((value) async {
      users = value.data()!["users"];
      users.remove(snapshot.data![index]);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(mNum)
          .update({"users": users});
    });
    // delete from hive
    box.put(HiveApi.allUserskey, users);
    // show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("User Deleted"),
      ),
    );
    EasyLoading.dismiss();
  }
}
