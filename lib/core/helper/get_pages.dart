import 'package:get/get.dart';
import 'package:mutamaruna/features/add_groups/presentation/views/add_groups_view.dart';
import 'package:mutamaruna/features/auth_view/presentation/views/auth_view.dart';
import 'package:mutamaruna/features/deraset_ketab_view/presentation/views/derasetketab.dart';
import 'package:mutamaruna/features/deraset_ketab_view/presentation/views/derasetketab1.dart';
import 'package:mutamaruna/features/deraset_ketab_view/presentation/views/derasetketab2.dart';
import 'package:mutamaruna/features/deraset_ketab_view/presentation/views/derasetketab3.dart';
import 'package:mutamaruna/features/deraset_ketab_view/presentation/views/derasetketan4.dart';
import 'package:mutamaruna/features/el_bernameg_view/presentation/views/elpernameg.dart';
import 'package:mutamaruna/features/home_view/presentation/view/home_view.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/magmo3at.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/widget/add_group_members_view.dart';
import 'package:mutamaruna/features/notes/presentation/views/add_note_view.dart';
import 'package:mutamaruna/features/notes/presentation/views/edit_note_view.dart';
import 'package:mutamaruna/features/notes/presentation/views/notes_view.dart';
import 'package:mutamaruna/features/notes/presentation/views/widgets/notedetails.dart';
import 'package:mutamaruna/features/post_page/views/image_view.dart';
import 'package:mutamaruna/features/post_page/views/post.dart';
import 'package:mutamaruna/features/splash_view/presentation/views/splash_view.dart';

abstract class GetPages {
  static Transition ktransition = Transition.fadeIn;
  static const String kHomeView = "/";
  static const String kElpernameg = "/kElpernameg";
  static const String kMagmo3at = "/kMagmo3at";
  static const String kNotepage = "/kNotepage";
  static const String kAddnotes = "/kAddnotes";
  static const String kNotedetails = "/kNotedetails";
  static const String kDerasetketab = "/kDerasetketab";
  static const String kDerasetketab1 = "/kDerasetketab1";
  static const String kAddGroups = "/kAddGroups";
  static const String kSplashView = "/kSplashView";
  static const String kAuth = "/kAuth";
  static const String kEditNoteView = "/kEditNoteView";
  static const String kDerasetketab2 = "/kDerasetketab2";
  static const String kDerasetketab3 = "/kDerasetketab3";
  static const String kDerasetketab4 = "/kDerasetketab4";
  static String kaddGroupMembers = "/kaddGroupMembers";
  static String kpost = "/kpost";
  static String kImageView = "/kImageView";

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: kHomeView,
      page: () => const MainHomeView(),
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
      name: kNotedetails,
      page: () => const Notedetails(),
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
    GetPage(
      name: kDerasetketab2,
      page: () => const Derasetketab2(),
      transition: ktransition,
    ),
    GetPage(
      name: kDerasetketab3,
      page: () => const Derasetketab3(),
      transition: ktransition,
    ),
    GetPage(
      name: kDerasetketab4,
      page: () => const Derasetketab4(),
      transition: ktransition,
    ),
    GetPage(
      name: kaddGroupMembers,
      page: () => const AddGroupMembersView(),
      transition: ktransition,
    ),
    GetPage(
      name: kpost,
      page: () => const Post(),
      transition: ktransition,
    ),
    GetPage(
      name: kImageView,
      page: () => const ImageView(),
      transition: ktransition,
    ),
  ];
}
