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
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: posts[index]["imageurl"] == "null"
            ? Container(
                height: 10,
                width: 10,
                color: Colors.red,
              )
            : Image(
                image: NetworkImage(posts[index]["imageurl"]),
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
