import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/magmo3at_cubit/magmo3at_cubit.dart';

class NumAndAddItems extends StatelessWidget {
  const NumAndAddItems({super.key, required this.groups, required this.index});

  final List<GroupsData> groups;
  final int index;

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<Magmo3atCubit, Magmo3atState>(
            builder: (context, state) {
              if (BlocProvider.of<Magmo3atCubit>(context).admin) {
                return Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(mainColor)),
                      onPressed: () {
                        BlocProvider.of<Magmo3atCubit>(context)
                            .goToEditPage(groups: groups, index: index);
                      },
                      child: const Text(
                        "تعديل",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
