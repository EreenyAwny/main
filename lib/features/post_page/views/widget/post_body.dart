import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/features/post_page/presentation/manager/post_cubit/post_cubit.dart';
import 'package:mutamaruna/features/post_page/views/widget/post_items.dart';

class PostBody extends StatelessWidget {
  const PostBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is PostNullData) {
          return const Center(
            child: Text("يجب عليك الاتصال بالانترنت "),
          );
        } else if (state is PostLoaded) {
          if (state.posts.isEmpty) {
            return const Center(
              child: Text("لا يوجد منشورات", style: TextStyle(fontSize: 25)),
            );
          } else {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return PostItem(
                  posts: state.posts,
                  index: state.posts.length - 1 - index,
                );
              },
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
