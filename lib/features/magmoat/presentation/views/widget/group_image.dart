import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/magmo3at_cubit/magmo3at_cubit.dart';

class GroupImage extends StatelessWidget {
  const GroupImage({
    super.key,
    required this.groups,
    required this.index,
  });

  final List groups;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: groups[index].imageUrl == null
            ? const Image(image: AssetImage("images/1.jpg"), fit: BoxFit.cover)
            : !BlocProvider.of<Magmo3atCubit>(context).kIsconected
                ? const Image(
                    image: AssetImage("images/1.jpg"), fit: BoxFit.cover)
                : Image(
                    image: NetworkImage(groups[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
      ),
    );
  }
}
