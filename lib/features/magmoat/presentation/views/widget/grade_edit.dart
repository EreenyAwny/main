import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/edit_groups_cubit/edit_groups_cubit.dart';

class EditGroupsSection extends StatelessWidget {
  const EditGroupsSection({
    super.key,
    required this.groupData,
  });

  final GroupsData groupData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 5),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 1,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "تــعـديـل الـدرجة",
          style: TextStyle(
            fontSize: 30,
            color: mainColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // add 1 grade
                BlocProvider.of<EditGroupsCubit>(context).addGrade(groupData);
              },
              icon: Icon(
                Icons.add_circle,
                size: 35,
                color: mainColor,
              ),
            ),
            BlocBuilder<EditGroupsCubit, EditGroupsState>(
              builder: (context, state) {
                if (state is GradeAdded) {
                  return Text.rich(
                    TextSpan(
                      text: 'الدرجة: ',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: state.groupdegree.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is GradeRemoved) {
                  return Text.rich(
                    TextSpan(
                      text: 'الدرجة: ',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: state.groupdegree.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Text.rich(
                    TextSpan(
                      text: 'الدرجة: ',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: groupData.grade == null
                              ? '0'
                              : groupData.grade.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            IconButton(
              onPressed: () async {
                BlocProvider.of<EditGroupsCubit>(context)
                    .removeGrade(groupData);
              },
              icon: Icon(
                Icons.remove_circle,
                size: 35,
                color: mainColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: ElevatedButton(
            onPressed: () async {
              await BlocProvider.of<EditGroupsCubit>(context)
                  .editGrade(groupData);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(mainColor),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
