import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/add_group_members_view.dart';

class NumAndAddItems extends StatelessWidget {
  const NumAndAddItems({
    super.key,
    required this.groups,
    required this.index,
  });

  final List groups;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "عدد الاعضاء: ${groups[index].members!.length}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            iconSize: 35,
            color: mainColor,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                elevation: 2,
                isDismissible: true,
                showDragHandle: true,
                backgroundColor: Colors.grey[200],
                builder: (context) {
                  return AddPasswordToGo(
                    groups: groups,
                    index: index,
                  );
                },
              );
            },
            icon: const Icon(
              Icons.add_circle,
            ),
          )
        ],
      ),
    );
  }
}

class AddPasswordToGo extends StatelessWidget {
  const AddPasswordToGo({super.key, required this.groups, required this.index});

  final List groups;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          const Text("Enter the password", style: TextStyle(fontSize: 20)),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Box box = Hive.box(HiveApi.configrationBox);
              List<String>? allnames =
                  box.get(HiveApi.allUserskey) as List<String>?;
              allnames ??= [];

              // getting stored members names from hive
              List<String> members = groups[index].members!;

              List<DropdownItem<User>> items =
                  List<DropdownItem<User>>.generate(
                allnames.length,
                (index) {
                  return DropdownItem(
                    label: allnames![index],
                    value: User(name: allnames[index], id: index + 1),
                    selected: members.contains(allnames[index]),
                  );
                },
              );
              Get.toNamed(GetPages.kaddGroupMembers, arguments: {
                "items": items,
                'id': groups[index].id,
              });
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(mainColor),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Go',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
