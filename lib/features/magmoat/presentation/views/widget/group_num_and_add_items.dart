import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/magmo3at_cubit/magmo3at_cubit.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/pass_bottom_sheet.dart';

class NumAndAddItems extends StatelessWidget {
  const NumAndAddItems({super.key, required this.groups, required this.index});

  final List<GroupsData> groups;
  final int index;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "الاعضاء: ${groups[index].members!.length}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(mainColor)),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    elevation: 2,
                    isDismissible: true,
                    showDragHandle: true,
                    backgroundColor: Colors.grey[200],
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => Magmo3atCubit(),
                        child: AddPasswordToGo(
                          formKey: formKey,
                          groups: groups,
                          index: index,
                          passwordcontroller: controller,
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "تعديل",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
