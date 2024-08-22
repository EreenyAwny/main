part of 'edit_groups_cubit.dart';

@immutable
sealed class EditGroupsState {}

final class EditGroupsInitial extends EditGroupsState {}

final class GradeAdded extends EditGroupsState {
  final int groupdegree;

  GradeAdded(this.groupdegree);
}

final class GradeRemoved extends EditGroupsState {
  final int groupdegree;

  GradeRemoved(this.groupdegree);
}
