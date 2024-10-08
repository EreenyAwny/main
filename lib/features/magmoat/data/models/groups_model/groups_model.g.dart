// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupsDataAdapter extends TypeAdapter<GroupsData> {
  @override
  final int typeId = 1;

  @override
  GroupsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupsData(
      name: fields[0] as String?,
      imageUrl: fields[1] as String?,
      grade: fields[2] as int?,
      members: (fields[3] as List?)?.cast<String>(),
      id: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GroupsData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.grade)
      ..writeByte(3)
      ..write(obj.members)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
