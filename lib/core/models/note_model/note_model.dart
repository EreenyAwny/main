import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 2)
class NoteModel extends HiveObject {
  @HiveField(4)
  String? namee;
  @HiveField(5)
  String? note;

  NoteModel({this.namee, this.note});
}
//flutter packages pub run build_runner build