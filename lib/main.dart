import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mutamaruna/HomePage.dart';
import 'package:mutamaruna/categories.dart/daragat2.dart';
import 'package:mutamaruna/categories.dart/derasetketab/derasetketab.dart';
import 'package:mutamaruna/categories.dart/derasetketab/derasetketab1.dart';
import 'package:mutamaruna/categories.dart/elpernameg.dart';
import 'package:mutamaruna/categories.dart/magmo3at.dart';
import 'package:mutamaruna/categories.dart/mo2tamer1dargat/daragatmo2tamer1.dart';
import 'package:mutamaruna/categories.dart/mo2tamer1dargat/editeldaraga1.dart';
import 'package:mutamaruna/categories.dart/mo2tamer1dargat/password1.dart';
import 'package:mutamaruna/categories.dart/mo2tamer2daragat/editeldaraga2.dart';
import 'package:mutamaruna/categories.dart/mo2tamer2daragat/password2.dart';
import 'package:mutamaruna/categories.dart/notes/addnotes.dart';
import 'package:mutamaruna/categories.dart/notes/notedetails.dart';
import 'package:mutamaruna/categories.dart/notes/notepage.dart';
import 'package:mutamaruna/core/hive_api.dart';
import 'package:mutamaruna/cubit/addNote_cubit/addNote_cubit.dart';
import 'package:mutamaruna/cubit/login_cubit/login_cubit.dart';
import 'package:mutamaruna/cubit/notes_cubit/notes_cubit.dart';
import 'package:mutamaruna/cubit/signinn_cubit/signin_cubit.dart';
import 'package:mutamaruna/features/add_groups/presentation/views/add_groups_view.dart';
import 'package:mutamaruna/firebase_options.dart';
import 'package:mutamaruna/sign/loginpage.dart';
import 'package:mutamaruna/sign/signuppage.dart';
import 'package:mutamaruna/welcomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  HiveApi hiveApi = HiveApi();
  hiveApi.openBoxes();
  hiveApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SigninCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => NotesCubit(),
          ),
          BlocProvider(
            create: (context) => AddnoteCubit(),
          ),
        ],
        child: MaterialApp(home: Welcomepage(), routes: {
          "Homepage": (context) => Homepage(),
          "Loginpage": (context) => Loginpage(),
          "Signuppage": (context) => Signuppage(),
          "Elpernameg": (context) => Elpernameg(),
          "Magmo3at": (context) => Magmo3at(),
          "Notepage": (context) => Notepage(),
          "Addnotes": (context) => Addnotes(),
          "Daragatmo2tamer1": (context) => const Daragatmo2tamer1(),
          "Editeldaraga1": (context) => Editeldaraga1(),
          "Password1": (context) => Password1(),
          "Notedetails": (context) => Notedetails(),
          "Daragat2": (context) => const Daragat2(),
          "Editeldaraga2": (context) => Editeldaraga2(),
          "Password2": (context) => Password2(),
          "Derasetketab": (context) => Derasetketab(),
          "Derasetketab1": (context) => Derasetketab1(),
          "add_groups": (context) => const AddGroupds()
        }));
  }
}
