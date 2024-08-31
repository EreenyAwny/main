import 'package:flutter/material.dart';
import 'package:mutamaruna/core/models/note_model/note_model.dart';
import 'package:mutamaruna/features/deraset_ketab_view/presentation/views/derasetketab.dart';
import 'package:mutamaruna/features/el_bernameg_view/presentation/views/elpernameg.dart';
import 'package:mutamaruna/features/personal/presentation/view/personal_view.dart';
import 'package:mutamaruna/features/magmoat/presentation/views/magmo3at.dart';
import 'package:mutamaruna/features/notes/presentation/views/notes_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

Color mainColor = Colors.blue;
const String slogan = "حوش اللي وقع منك";
String note_detail = "";
NoteModel? note_toChange;
String note_title = "";
const String password = "01126198158";

const String kNotificationPublicTopic = "public";

List<Widget> buildScreens() {
  return [
    const Magmo3at(),
    const PersonalView(),
    const NotesView(),
    const Derasetketab()
  ];
}

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.group_work_rounded),
      title: ("المجموعات"),
      activeColorPrimary: mainColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: ("بياناتي"),
      activeColorPrimary: mainColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.note_alt_rounded),
      title: ("ملاحظاتي"),
      activeColorPrimary: mainColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.book),
      title: ("دعوتك باسمك"),
      activeColorPrimary: mainColor,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}

RouteAndNavigatorSettings routes() {
  return RouteAndNavigatorSettings(
    initialRoute: "/",
    routes: {
      "/kMagmo3at": (final context) => const Magmo3at(),
      "/kElpernameg": (final context) => const Elpernameg(),
      "/kNotepage": (final context) => const NotesView(),
      "/kDerasetketab": (final context) => const Derasetketab(),
      "/": (final context) => const PersonalView(),
    },
  );
}
