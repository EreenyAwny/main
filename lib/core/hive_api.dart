import 'package:hive/hive.dart';
import 'package:mutamaruna/core/models/note_model/note_model.dart';
import 'package:mutamaruna/features/magmoat/data/models/groups_model/groups_model.dart';

class HiveApi {
  static String grades = "grades";
  static String configrationBox = "configration";
  static String mNum = "kMNum";
  static String knoteBox = "notes_box";
  static String groupsKey = 'groupsKey';
  static String allUserskey = 'allUsers';
  static String kGroupsItemsKey = 'kGroupsItemsKey';
  static String userNamekey = 'userName';
  static String membersKey = 'membersKey';
  static String type = 'type';
  static String postsBox = 'posts';

  void openBoxes() {
    Hive.openBox(grades);
    Hive.openBox(configrationBox);
    Hive.openBox<NoteModel>(knoteBox);
    Hive.openBox(postsBox);
  }

  void init() {
    Hive.registerAdapter(GroupsDataAdapter());
    Hive.registerAdapter(NoteModelAdapter());
  }
}
