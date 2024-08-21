import 'package:hive/hive.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';

class HiveApi {
  static String grades = "grades";
  static String configrationBox = "configration";
  static String mNum = "kMNum";
  static String groupsKey = 'groupsKey';
  static String allUserskey = 'allUsers';
  static String kGroupsItemsKey = 'kGroupsItemsKey';
  static String userNamekey = 'userName';
  static String membersKey = 'membersKey';

  void openBoxes() {
    Hive.openBox(grades);
    Hive.openBox(configrationBox);
  }

  void init() {
    Hive.registerAdapter(GroupsDataAdapter());
  }
}
