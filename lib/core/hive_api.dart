import 'package:hive/hive.dart';
import 'package:mutamaruna/core/models/groups_model/groups_model.dart';

class HiveApi {
  static String grades = "grades";
  static String configrationBox = "configration";
  static String mNum = "kMNum";

  static String userNamekey = 'userName';

  void openBoxes() {
    Hive.openBox(grades);
    Hive.openBox(configrationBox);
  }

  void init() {
    Hive.registerAdapter(GroupsDataAdapter());
  }
}
