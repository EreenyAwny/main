import 'package:hive/hive.dart';
import 'package:mutamaruna/core/models/groups_model.dart';

class HiveApi {
  final String grades = "grades";
  final String configration = "configration";
  final String mNum = "kMNum";

  void openBoxes() {
    Hive.openBox(grades);
    Hive.openBox(configration);
  }

  void init() {
    Hive.registerAdapter(GroupsDataAdapter());
  }
}
