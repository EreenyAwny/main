part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingData extends HomeState {}

final class HomeGroupNameNotFound extends HomeState {}

final class HomeGroupNameFound extends HomeState {
  final String myGroup;

  HomeGroupNameFound(this.myGroup);
}

final class PersonalAdmin extends HomeState {}
