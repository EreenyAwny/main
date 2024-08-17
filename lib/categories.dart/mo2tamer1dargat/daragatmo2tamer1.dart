import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/categories.dart/mo2tamer1dargat/cubits/cubit/deg_cubit.dart';
import 'package:mutamaruna/core/constants.dart';

class Daragatmo2tamer1 extends StatefulWidget {
  const Daragatmo2tamer1({super.key});

  @override
  State<Daragatmo2tamer1> createState() => _Daragatmo2tamer1();
}

class _Daragatmo2tamer1 extends State<Daragatmo2tamer1> {
  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    return BlocProvider(
      create: (context) => DegCubit()..init(),
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: Column(
                    children: [
                      const Text("please Enter the password to add a groups"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        controller: password,
                      )
                    ],
                  ),
                );
              },
            );
          },
          iconSize: 30,
          icon: const Icon(Icons.add),
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "درجاتك يا بيه",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: mainColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return null;
          },
        ),
      ),
    );
  }
}

class GroupElement extends StatelessWidget {
  final String day;
  final String imageurl;
  final int deg;
  const GroupElement({
    super.key,
    required this.day,
    required this.imageurl,
    required this.deg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: const Color.fromARGB(255, 183, 110, 1),
      child: Column(
        children: [
          SizedBox(
            height: 310,
            width: 300,
            child: Image.asset(
              imageurl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: Text(
              day,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: Text(
              "$deg",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
