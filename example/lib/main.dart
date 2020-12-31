import 'package:flutter/material.dart';

import 'this_is_one_menu.dart';

import 'this_is_another_menu.dart';

import 'here_is_another_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );
}

class HomeScreen extends StatefulWidget {
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState() {
    appMenu = ThisIsOneMenu();
  }
  AppPopupMenu appMenu;
  AppPopupMenu appMenu01;
  AppPopupMenu appMenu02;
  AppPopupMenu appMenu03;

  @override
  void initState() {
    super.initState();
    appMenu01 = ThisIsOneMenu();
    appMenu02 = ThisIsAnotherMenu();
    appMenu03 = HereIsAnotherMenu(context, onSelected: (int value) {
      switch (value) {
        case 1:
          print('value: $value');
          break;
        case 2:
          print('value: $value');
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Popup Menu Examples"),
          actions: [
            appMenu.popupMenuButton,
            appMenu01.buttonMenu(),
            appMenu02.buttonMenu(),
            appMenu03.popupMenuButton,

            // HereIsAnotherMenu(context, onSelected: (int value) {
            //   switch (value) {
            //     case 1:
            //       print('value: $value');
            //       break;
            //     case 2:
            //       print('value: $value');
            //       break;
            //     default:
            //   }
            // }).popupMenuButton,
          ],
        ),
        body: Center(),
      );
}
