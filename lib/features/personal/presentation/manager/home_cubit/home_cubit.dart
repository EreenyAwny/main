import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:mutamaruna/core/functions/check_internet.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> init() async {
    emit(HomeLoadingData());
    Box box = Hive.box(HiveApi.configrationBox);
    String type = box.get(HiveApi.type);
    if (type == "user") {
      String name = Hive.box(HiveApi.configrationBox).get(HiveApi.userNamekey);
      //getting data from firebase
      Box box = Hive.box(HiveApi.configrationBox);
      String mNum = box.get(HiveApi.mNum);
      bool isconnected = await checkInternet();
      List<GroupsData> groups = [];
      if (isconnected) {
        var docments = await FirebaseFirestore.instance
            .collection("motamerat")
            .doc(mNum)
            .collection('groups')
            .get();
        // getting data from firebase and add it to groups list
        for (var element in docments.docs) {
          groups.add(GroupsData.fromJson(element.data()));
        }
      } else {
        // get data from hive
        box.get(HiveApi.groupsKey).forEach((element) {
          groups.add(GroupsData.fromJson(element));
        });
      }

      String myGroup = "";
      for (int i = 0; i < groups.length; i++) {
        List members = groups[i].members ?? [];
        for (int j = 0; j < members.length; j++) {
          if (members[j] == name) {
            myGroup = groups[i].name ?? "";
            break;
          }
        }
      }
      if (myGroup == "") {
        return emit(HomeGroupNameNotFound());
      } else {
        return emit(HomeGroupNameFound(myGroup));
      }
    } else {
      emit(PersonalAdmin());
    }
  }
}
