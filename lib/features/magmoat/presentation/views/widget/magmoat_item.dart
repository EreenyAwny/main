import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/magmo3at_cubit/magmo3at_cubit.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/group_image.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/group_num_and_add_items.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/name_and_grade.dart';

class MagmoatItem extends StatelessWidget {
  const MagmoatItem({
    super.key,
    required this.groups,
    required this.index,
  });

  final List<GroupsData> groups;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // go to group page
        showModalBottomSheet(
          context: context,
          enableDrag: true,
          elevation: 2,
          isDismissible: true,
          showDragHandle: true,
          backgroundColor: Colors.grey[200],
          builder: (context) {
            if (groups[index].members!.isEmpty) {
              return const Center(
                child: Text(
                  "لا يوجد اعضاء",
                  style: TextStyle(fontSize: 20),
                ),
              );
            } else {
              return Column(
                children: [
                  const Text(
                    "الاعضاء",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: groups[index].members!.length,
                      itemBuilder: (context, index1) {
                        return ListTile(
                          title: Text(
                            '${index1 + 1} - ${groups[index].members![index1]}',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
      onLongPress: () {
        if (Hive.box(HiveApi.configrationBox).get(HiveApi.type) == "admin") {
          // delete group
          showDialog(
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) => Magmo3atCubit(),
                child: AlertDialog(
                  title: const Text("هل تريد حذف المجموعة"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text("لا"),
                    ),
                    TextButton(
                      onPressed: () async {
                        EasyLoading.show(status: "جاري الحذف");
                        await FirebaseFirestore.instance
                            .collection("motamerat")
                            .doc(Hive.box(HiveApi.configrationBox)
                                .get(HiveApi.mNum))
                            .collection("groups")
                            .doc(groups[index].id)
                            .delete();
                        EasyLoading.dismiss();
                        EasyLoading.showSuccess("تم حذف المجموعة");
                        Navigator.pop(context, true);
                      },
                      child: const Text("نعم"),
                    ),
                  ],
                ),
              );
            },
          ).then((value) {
            if (value == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("تم حذف المجموعة"),
                ),
              );
              BlocProvider.of<Magmo3atCubit>(context).init();
            }
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocBuilder<Magmo3atCubit, Magmo3atState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GroupImage(groups: groups, index: index),
                const SizedBox(height: 10),
                NameAndGrade(groups: groups, index: index),
                NumAndAddItems(
                  groups: groups,
                  index: index,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
