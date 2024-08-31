import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/helper/get_pages.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/features/post_page/presentation/manager/post_cubit/post_cubit.dart';
import 'package:mutamaruna/features/post_page/views/widget/post_image.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.posts,
    required this.index,
  });

  final List<QueryDocumentSnapshot> posts;
  final int index;

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box(HiveApi.configrationBox);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "${posts[index]["name"]}",
                        style: const TextStyle(fontSize: 21),
                      ),
                      subtitle: Text("${posts[index]["time"]}"),
                      titleTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  box.get(HiveApi.userNamekey) == posts[index]["name"] ||
                          box.get(HiveApi.type) == "admin"
                      ? IconButton(
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.rightSlide,
                              desc: "هل تريد حذف المنشور ؟",
                              btnOkText: "رجوع",
                              btnCancelText: "حذف",
                              btnCancelOnPress: () {
                                FirebaseFirestore.instance
                                    .collection('motamerat')
                                    .doc(Hive.box(HiveApi.configrationBox)
                                        .get(HiveApi.mNum))
                                    .collection('posts')
                                    .doc(posts[index].id)
                                    .delete();
                              },
                              btnOkOnPress: () {},
                            ).show();
                          },
                          icon: const Icon(Icons.delete),
                        )
                      : const SizedBox(),
                ],
              ),
              Text(
                "${posts[index]["text"]}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              if (posts[index]["imageurl"] != "null")
                InkWell(
                  onTap: () {
                    post_image = posts[index]["imageurl"];
                    Get.toNamed(GetPages.kImageView);
                  },
                  child: PostImage(posts: posts, index: index),
                ),
            ],
          );
        },
      ),
    );
  }
}
