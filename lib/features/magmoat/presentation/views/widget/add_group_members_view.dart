import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/core/widgets/app_leading.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/edit_groups_cubit/edit_groups_cubit.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/grade_edit.dart';

class AddGroupMembersView extends StatefulWidget {
  const AddGroupMembersView({super.key});

  @override
  State<AddGroupMembersView> createState() => _AddGroupMembersViewState();
}

class User {
  final String name;
  final int id;

  User({required this.name, required this.id});

  @override
  String toString() {
    return 'User(name: $name, id: $id)';
  }
}

class _AddGroupMembersViewState extends State<AddGroupMembersView> {
  final _formKey = GlobalKey<FormState>();
  final controller = MultiSelectController<User>();

  @override
  Widget build(BuildContext context) {
    List<DropdownItem<User>> items = Get.arguments['items'];
    GroupsData groupData = Get.arguments['groupData'];
    return BlocProvider(
      create: (context) => EditGroupsCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const AppLeading(
            kcolor: Colors.black,
          ),
          centerTitle: true,
          title: const Text(
            'التعديل',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "تــعـديل الاعضـاء",
                        style: TextStyle(
                          fontSize: 30,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      MultiDropdown<User>(
                        items: items,
                        controller: controller,
                        enabled: true,
                        searchEnabled: true,
                        chipDecoration: const ChipDecoration(
                          backgroundColor: Colors.yellow,
                          wrap: true,
                          runSpacing: 2,
                          spacing: 10,
                        ),
                        fieldDecoration: FieldDecoration(
                          hintText: 'Members',
                          hintStyle: const TextStyle(color: Colors.black87),
                          prefixIcon: const Icon(CupertinoIcons.person_2_fill),
                          showClearIcon: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        dropdownDecoration: const DropdownDecoration(
                          marginTop: 2,
                          maxHeight: 500,
                          header: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Select members from the list',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        dropdownItemDecoration: DropdownItemDecoration(
                          selectedIcon:
                              const Icon(Icons.check_box, color: Colors.green),
                          disabledIcon:
                              Icon(Icons.lock, color: Colors.grey.shade300),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a members';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                EasyLoading.show(status: 'Adding...');
                                final selectedItems = controller.selectedItems;
                                // add items to the group
                                List<String> names = List.generate(
                                    selectedItems.length, (index) {
                                  return selectedItems[index].value.name;
                                });
                                Box box = Hive.box(HiveApi.configrationBox);
                                String? mNum = box.get(HiveApi.mNum);

                                FirebaseFirestore.instance
                                    .collection("motamerat")
                                    .doc(mNum)
                                    .collection('groups')
                                    .doc(groupData.id)
                                    .update({
                                  "members": names,
                                });
                                EasyLoading.dismiss();
                                EasyLoading.showSuccess('Added successfully');
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(mainColor),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(mainColor),
                            ),
                            onPressed: () {
                              controller.clearAll();
                            },
                            child: const Text(
                              'Unselect All',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      EditGroupsSection(
                        groupData: groupData,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
