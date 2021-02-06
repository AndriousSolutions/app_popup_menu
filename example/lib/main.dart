import 'package:flutter/material.dart';

import 'subclass01.dart';

import 'subclass03.dart';

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
  //
  AppPopupMenu appMenu01;
  AppPopupMenu appMenu02;
  AppPopupMenu appMenu03;

  @override
  void initState() {
    super.initState();

    appMenu01 = SubClass01();

    appMenu02 = AppPopupMenu<int>(
      menuItems: [
        PopupMenuItem(
          value: 1,
          child: Text("First"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Second"),
        ),
      ],
      initialValue: 2,
      onSelected: (int value) {
        InheritedData.of(appMenu02.context).data = value;
        Scaffold.of(appMenu02.context).showSnackBar(
          SnackBar(
            content: Text('appMenu02 option: $value'),
          ),
        );
      },
      onCanceled: () {
        Scaffold.of(appMenu02.context).showSnackBar(
          SnackBar(
            content: Text('appMenu02: Nothing selected.'),
          ),
        );
      },
      tooltip: "Here's a tip for you.",
      elevation: 12,
      icon: Icon(Icons.tablet),
      offset: Offset(0, 65),
      padding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.deepOrangeAccent,
      captureInheritedThemes: false,
    );

    appMenu03 = SubClass03<String>(onSelected: (String value) {
      InheritedData.of(appMenu03.context).data = value;
      Scaffold.of(appMenu03.context).showSnackBar(
        SnackBar(
          content: Text('appMenu03 option: $value'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu Examples'),
          actions: [
            appMenu01,
            appMenu02,
            appMenu03.set<String>(
              initialValue: '3',
              items: ['One', 'Two', 'Three'],
              menuItems: [
                PopupMenuItem(
                  value: '1',
                  child: Text('This'),
                ),
                PopupMenuItem(
                  value: '2',
                  child: Text('That'),
                ),
                PopupMenuItem(
                  value: '3',
                  child: Text('Other'),
                ),
              ],
              onCanceled: () {
                Scaffold.of(appMenu03.context).showSnackBar(
                  SnackBar(
                    content: Text('appMenu03: Nothing selected.'),
                  ),
                );
              },
              tooltip: "Here's a tip for you.",
              elevation: 8,
              icon: Icon(Icons.settings),
              offset: Offset(0, 45),
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
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
