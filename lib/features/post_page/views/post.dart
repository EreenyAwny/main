import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/widgets/app_leading.dart';
import 'package:mutamaruna/features/post_page/presentation/manager/post_cubit/post_cubit.dart';
import 'package:mutamaruna/features/post_page/views/widget/add_post_button.dart';
import 'package:mutamaruna/features/post_page/views/widget/post_body.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _Post();
}

class _Post extends State<Post> {
  @override
  Widget build(BuildContext context) {
    TextEditingController postNameController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => PostCubit()..init(),
      child: Scaffold(
        floatingActionButton: AddPostButton(
          formKey: formKey,
          postNameController: postNameController,
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "منشورات",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: mainColor,
          leading: const AppLeading(),
        ),
        body: const PostBody(),
      ),
    );
  }
}
