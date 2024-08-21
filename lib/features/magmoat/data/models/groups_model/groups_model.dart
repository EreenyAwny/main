import 'package:hive/hive.dart';

part 'groups_model.g.dart';

@HiveType(typeId: 1)
class GroupsData extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? imageUrl;
  @HiveField(2)
  int? grade;
  @HiveField(3)
  List<String>? members;
  @HiveField(4)
  String? id;

  GroupsData({this.name, this.imageUrl, this.grade, this.members, this.id});

  GroupsData.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    imageUrl = json['imageurl'] as String?;
    grade = json['grade'] as int?;
    members = json['members'].cast<String>();
    id = json['id'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageurl'] = imageUrl;
    data['grade'] = grade;
    data['members'] = members;
    data['id'] = id;
    return data;
  }
}
