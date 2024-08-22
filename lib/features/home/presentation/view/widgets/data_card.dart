import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/home/presentation/manager/home_cubit/home_cubit.dart';

class DataCard extends StatelessWidget {
  const DataCard({
    super.key,
    required this.name,
    required this.mNum,
  });

  final String name;
  final String mNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: mainColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "أهلاً: $name",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "المؤتمر: $mNum",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeGroupNameFound) {
                return Text.rich(
                  TextSpan(
                    text: "مجموعتك: ",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: state.myGroup,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is HomeGroupNameNotFound) {
                return const Text(
                  "لم تنضم لأي مجموعة بعد",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              } else if (state is HomeLoadingData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
