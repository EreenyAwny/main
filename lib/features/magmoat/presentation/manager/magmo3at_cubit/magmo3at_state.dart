part of 'magmo3at_cubit.dart';

@immutable
sealed class Magmo3atState {}

final class Magmo3atInitial extends Magmo3atState {}

final class Magmo3atLoaded extends Magmo3atState {
  final List<GroupsData> groups;

  Magmo3atLoaded(this.groups);
}

final class Magmo3atNullData extends Magmo3atState {}

final class EditModeState extends Magmo3atState {}

final class Magmo3atStateAdmin extends Magmo3atState {}
