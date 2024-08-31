part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoaded extends PostState {
  final List<QueryDocumentSnapshot> posts;

  PostLoaded(this.posts);
}

final class PostNullData extends PostState {}
