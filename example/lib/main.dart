import 'package:flutter/material.dart';

import 'this_is_one_menu.dart';

import 'this_is_another_menu.dart';

import 'here_is_another_menu.dart';

import 'build_inherited_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BuildInheritedWidget(child: HomeScreen()),
      );
}

class HomeScreen extends StatefulWidget {
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState() {
    appMenu01 = ThisIsOneMenu();
  }
  AppPopupMenu appMenu01;
  AppPopupMenu appMenu02;
  AppPopupMenu appMenu03;

  @override
  void initState() {
    super.initState();
    appMenu02 = ThisIsAnotherMenu();
    appMenu02.color = Colors.deepOrangeAccent;
    appMenu03 = HereIsAnotherMenu<String>(
      items: ['This', 'That', 'Other'],
      onSelected: (String value) => InheritedData.of(context).data = value,
    );
    appMenu03.offset = Offset(0, 45);
    appMenu03.shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu Examples'),
          actions: [
            appMenu01.popupMenuButton,
            appMenu02.buttonMenu(offset: Offset(0, 100)),
            appMenu03.buttonMenu(
              icon: Icon(Icons.settings),
              onSelected: (dynamic value) {
                InheritedData.of(context).data = value;
              },
            )
          ],
        ),
        body: MenuOption(),
      );

}

class MenuOption extends StatelessWidget {
  MenuOption({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = InheritedData.of(context).data;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$data',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
