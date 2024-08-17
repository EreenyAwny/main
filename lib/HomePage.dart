import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/cubit/notes_cubit/notes_cubit.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "mutamaruna",
          style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),
        ),
        backgroundColor: Color.fromARGB(255, 49, 33, 109),
        actions: [
          IconButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.rightSlide,
                  desc: "Are you sure you want to logout ?",
                  btnOkText: "Yes",
                  btnCancelText: "Cancel",
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    isloading = true;
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "Welcomepage", (route) => false);
                    isloading = false;
                  },
                ).show();
              },
              icon: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 255, 174, 75),
                size: 27,
              )),
        ],
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Expanded(
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    height: 750,
                    width: 400,
                  ),
                  Positioned(
                    bottom: 15,
                    top: 80,
                    left: 10,
                    right: 10,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.8,
                          mainAxisSpacing: 40,
                          crossAxisSpacing: 20),
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("Magmo3at");
                          },
                          child: container1(name: "المجموعات"),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("Daragat2");
                            },
                            child: container1(name: "درجاتك يا بيه")),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("Elpernameg");
                            },
                            child: container1(name: " Now What? (البرنامج)")),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("Notepage");
                              BlocProvider.of<NotesCubit>(context).getnotes();
                            },
                            child: container1(name: "📝اكتب ملاحظاتك")),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("Derasetketab");
                          },
                          child: container1(name: "🧐فتشوا الكتب"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class container1 extends StatelessWidget {
  String? name;
  container1({required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        height: 100,
        width: 100,
        color: Color.fromARGB(255, 49, 33, 109),
        child: Center(
            child: Text(
          "$name",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )));
  }
}
  


/*,actions: [IconButton(onPressed: ()async{
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushNamedAndRemoveUntil("Welcomepage",(route)=>false);
      }, icon: const Icon(Icons.abc_outlined)),],),*/