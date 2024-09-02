import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                              onPressed: () async {
                                await AwesomeDialog(
                                  context: context,
                                  animType: AnimType.rightSlide,
                                  desc: "هل تريد حذف المنشور ؟",
                                  btnOkText: "رجوع",
                                  btnCancelText: "حذف",
                                  btnCancelOnPress: () async {
                                    if (posts[index]["imageurl"] != "null") {
                                      FirebaseStorage.instance
                                          .refFromURL(posts[index]["imageurl"])
                                          .delete();
                                    }
                                    await FirebaseFirestore.instance
                                        .collection('motamerat')
                                        .doc(Hive.box(HiveApi.configrationBox)
                                            .get(HiveApi.mNum))
                                        .collection('posts')
                                        .doc(posts[index].id)
                                        .delete();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("تم حذف المنشور"),
                                      ),
                                    );
                                    await BlocProvider.of<PostCubit>(context)
                                        .init();
                                  },
                                  btnOkOnPress: () {},
                                ).show();
                                // show snackbar
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
                  const SizedBox(height: 7),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Text("${posts[index]["likes"]}"),
                                IconButton(
                                  onPressed: () async {
                                    if (Hive.box(HiveApi.postsBox)
                                            .get(posts[index].id) ??
                                        false) {
                                      await FirebaseFirestore.instance
                                          .collection('motamerat')
                                          .doc(Hive.box(HiveApi.configrationBox)
                                              .get(HiveApi.mNum))
                                          .collection('posts')
                                          .doc(posts[index].id)
                                          .update({
                                        "likes": posts[index]["likes"] - 1,
                                      });
                                      Box box = Hive.box(HiveApi.postsBox);
                                      box.put(posts[index].id, false);
                                    } else {
                                      await FirebaseFirestore.instance
                                          .collection('motamerat')
                                          .doc(Hive.box(HiveApi.configrationBox)
                                              .get(HiveApi.mNum))
                                          .collection('posts')
                                          .doc(posts[index].id)
                                          .update({
                                        "likes": posts[index]["likes"] + 1,
                                      });
                                      Box box = Hive.box(HiveApi.postsBox);
                                      box.put(posts[index].id, true);
                                    }
                                    await BlocProvider.of<PostCubit>(context)
                                        .init();
                                  },
                                  icon: Icon(
                                    Hive.box(HiveApi.postsBox)
                                                .get(posts[index].id) ??
                                            false
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Divider(
          endIndent: 20,
          indent: 20,
        )
      ],
    );
  }
}
