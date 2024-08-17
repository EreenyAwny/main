import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:mutamaruna/core/functions/check_internet.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/core/models/groups_model/groups_model.dart';

part 'deg_state.dart';

class DegCubit extends Cubit<DegState> {
  DegCubit() : super(DegInitial());

  init() async {
    // check internet
    bool isconected = await checkInternet();
    if (isconected) {
      //getting data from firebase
      Box box = Hive.box(HiveApi.configrationBox);
      String mNum = box.get(HiveApi.mNum);
      var docments =
          FirebaseFirestore.instance.collection("motamerat").doc(mNum);
      List<GroupsData> groups = [];
    } else {
      // getting data from hive
    }
  }
}
