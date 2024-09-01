import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    required this.posts,
    required this.index,
  });

  final List posts;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (posts[index]["imageurl"] == "null") {
      return Container(
        height: 10,
        width: 10,
        color: Colors.red,
      );
    } else {
      return ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 300,
          minWidth: double.infinity,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: NetworkImage(posts[index]["imageurl"]),
            fit: BoxFit.contain,
          ),
        ),
      );
    }
  }
}
