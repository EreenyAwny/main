import 'package:get/get.dart';
import 'package:mutamaruna/categories.dart/daragat2.dart';
import 'package:mutamaruna/categories.dart/derasetketab/derasetketab.dart';
import 'package:mutamaruna/categories.dart/derasetketab/derasetketab1.dart';
import 'package:mutamaruna/categories.dart/elpernameg.dart';
import 'package:mutamaruna/categories.dart/mo2tamer1dargat/daragatmo2tamer1.dart';
import 'package:mutamaruna/categories.dart/mo2tamer1dargat/editeldaraga1.dart';
import 'package:mutamaruna/features/add_groups/presentation/views/add_groups_view.dart';
import 'package:mutamaruna/features/auth_view/presentation/views/auth_view.dart';
import 'package:mutamaruna/features/home/presentation/view/home_view.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/magmo3at.dart';
import 'package:mutamaruna/features/notes/presentation/views/add_note_view.dart';
import 'package:mutamaruna/features/notes/presentation/views/edit_note_view.dart';
import 'package:mutamaruna/features/notes/presentation/views/notes_view.dart';
import 'package:mutamaruna/features/notes/presentation/views/widgets/notedetails.dart';
import 'package:mutamaruna/features/splash_view/presentation/views/splash_view.dart';

abstract class GetPages {
  static Transition ktransition = Transition.leftToRight;
  static const String kHomeView = "/kHomeView";
  static const String kElpernameg = "/kElpernameg";
  static const String kMagmo3at = "/kMagmo3at";
  static const String kNotepage = "/kNotepage";
  static const String kAddnotes = "/kAddnotes";
  static const String kDaragatmo2tamer1 = "/kDaragatmo2tamer1";
  static const String kEditeldaraga1 = "/kEditeldaraga1";
  static const String kNotedetails = "/kNotedetails";
  static const String kDaragat2 = "/kDaragat2";
  static const String kDerasetketab = "/kDerasetketab";
  static const String kDerasetketab1 = "/kDerasetketab1";
  static const String kAddGroups = "/kAddGroups";
  static const String kSplashView = "/kSplashView";
  static const String kAuth = "/kAuth";
  static const String kEditNoteView = "/kEditNoteView";

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: kHomeView,
      page: () => const HomeView(),
      transition: ktransition,
    ),
    GetPage(
      name: kElpernameg,
      page: () => const Elpernameg(),
      transition: ktransition,
    ),
    GetPage(
      name: kMagmo3at,
      page: () => const Magmo3at(),
      transition: ktransition,
    ),
    GetPage(
      name: kNotepage,
      page: () => const NotesView(),
      transition: ktransition,
    ),
    GetPage(
      name: kAddnotes,
      page: () => const AddNoteView(),
      transition: ktransition,
    ),
    GetPage(
      name: kDaragatmo2tamer1,
      page: () => const Daragatmo2tamer1(),
      transition: ktransition,
    ),
    GetPage(
      name: kEditeldaraga1,
      page: () => const Editeldaraga1(),
      transition: ktransition,
    ),
    GetPage(
      name: kNotedetails,
      page: () => const Notedetails(),
      transition: ktransition,
    ),
    GetPage(
      name: kDaragat2,
      page: () => const Daragat2(),
      transition: ktransition,
    ),
    GetPage(
      name: kDerasetketab,
      page: () => const Derasetketab(),
      transition: ktransition,
    ),
    GetPage(
      name: kDerasetketab1,
      page: () => const Derasetketab1(),
      transition: ktransition,
    ),
    GetPage(
      name: kAddGroups,
      page: () => const AddGroupds(),
      transition: ktransition,
    ),
    GetPage(
      name: kSplashView,
      page: () => const SplashView(),
      transition: ktransition,
    ),
    GetPage(
      name: kAuth,
      page: () => const AuthView(),
      transition: ktransition,
    ),
    GetPage(
      name: kEditNoteView,
      page: () => const EditNoteView(),
      transition: ktransition,
    ),
  ];
}
