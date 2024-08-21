import 'package:flutter/material.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/group_image.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/group_num_and_add_items.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/name_and_grade.dart';

class MagmoatItem extends StatelessWidget {
  const MagmoatItem({
    super.key,
    required this.groups,
    required this.index,
  });

  final List groups;
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
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            '${index + 1} - ${groups[index].members![index]}',
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
        child: Column(
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
        ),
      ),
    );
  }
}
