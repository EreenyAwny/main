import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';

part 'edit_groups_state.dart';

class EditGroupsCubit extends Cubit<EditGroupsState> {
  EditGroupsCubit() : super(EditGroupsInitial());
  int grade = 0;

  void addGrade(GroupsData group) {
    grade = group.grade ?? 0;
    grade++;
    group.grade = grade;
    emit(GradeAdded(grade));
  }

  void removeGrade(GroupsData group) {
    grade = group.grade ?? 0;
    grade--;
    group.grade = grade;
    emit(GradeRemoved(grade));
  }

  Future<void> editGrade(GroupsData group) async {
    EasyLoading.show(status: 'Editing...');

    // add items to the group
    Box box = Hive.box(HiveApi.configrationBox);
    String? mNum = box.get(HiveApi.mNum);

    FirebaseFirestore.instance
        .collection("motamerat")
        .doc(mNum)
        .collection('groups')
        .doc(group.id)
        .update({
      "grade": grade,
    });

    // update group data in hive
    group.grade = grade;
    List<GroupsData> groups =
        Hive.box(HiveApi.configrationBox).get(HiveApi.groupsKey);
    groups[groups.indexWhere((element) => element.id == group.id)] = group;
    Hive.box(HiveApi.configrationBox).put(HiveApi.groupsKey, groups);

    EasyLoading.dismiss();
    EasyLoading.showSuccess('Grade Edited successfully\nGrade: $grade');
  }
}
