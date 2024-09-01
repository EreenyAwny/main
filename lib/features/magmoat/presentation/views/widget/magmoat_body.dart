import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/features/magmoat/presentation/manager/magmo3at_cubit/magmo3at_cubit.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/magmoat_item.dart';

class MagmoatBody extends StatelessWidget {
  const MagmoatBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Magmo3atCubit, Magmo3atState>(
      builder: (context, state) {
        if (state is Magmo3atNullData) {
          return const Center(
            child: Text("يجب عليك الاتصال بالانترنت لاول مره علي الاقل"),
          );
        } else if (state is Magmo3atLoaded) {
          if (state.groups.isEmpty) {
            return const Center(
              child: Text("لا يوجد مجموعات", style: TextStyle(fontSize: 25)),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<Magmo3atCubit>().init();
              },
              child: ListView.builder(
                itemCount: state.groups.length,
                itemBuilder: (context, index) {
                  return MagmoatItem(
                    groups: state.groups,
                    index: index,
                  );
                },
              ),
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
