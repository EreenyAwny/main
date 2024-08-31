import 'package:flutter/material.dart';
import 'package:mutamaruna/core/constants.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(post_image);
  }
}
