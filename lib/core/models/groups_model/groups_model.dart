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

  GroupsData({this.name, this.imageUrl, this.grade});

  GroupsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['image_url'];
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['grade'] = grade;
    return data;
  }
}
