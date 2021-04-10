// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache License, Version 2.0.
// The main directory contains that LICENSE file.

import 'package:flutter/material.dart';

import 'build_inherited_widget.dart';
import 'subclass01.dart';
import 'subclass03.dart';

void main() => runApp(const MyApp(key: Key('MyApp')));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BuildInheritedWidget(child: HomeScreen(key: Key('HomeScreen'))),
      );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  late AppPopupMenu<String> appMenu01;
  late AppPopupMenu<int> appMenu02;
  late AppPopupMenu<String> appMenu03;

  @override
  void initState() {
    super.initState();

    appMenu01 = SubClass01(key: const Key('SubClass01'));

    appMenu02 = AppPopupMenu<int>(
      menuItems: const [
        PopupMenuItem(
          value: 1,
          child: Text('First'),
        ),
        PopupMenuItem(
          value: 2,
          child: Text('Second'),
        ),
      ],
      initialValue: 2,
      onSelected: (int value) {
        InheritedData.of(appMenu02.context!)?.data = value;
        ScaffoldMessenger.of(appMenu02.context!).showSnackBar(
          SnackBar(
            content: Text('appMenu02 option: $value'),
          ),
        );
      },
      onCanceled: () {
        ScaffoldMessenger.of(appMenu02.context!).showSnackBar(
          const SnackBar(
            content: Text('appMenu02: Nothing selected.'),
          ),
        );
      },
      tooltip: "Here's a tip for you.",
      elevation: 12,
      icon: const Icon(Icons.tablet),
      offset: const Offset(0, 65),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.deepOrangeAccent,
    );

    appMenu03 = SubClass03<String>(
        key: const Key('SubClass03'),
        onSelected: (String value) {
          InheritedData.of(appMenu03.context!)?.data = value;
          ScaffoldMessenger.of(appMenu03.context!).showSnackBar(
            SnackBar(
              content: Text('appMenu03 option: $value'),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Popup Menu Examples'),
          actions: [
            appMenu01,
            appMenu02,
            appMenu03.set(
              initialValue: '3',
//              items: ['One', 'Two', 'Three'],
              menuItems: const [
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
                ScaffoldMessenger.of(appMenu03.context!).showSnackBar(
                  const SnackBar(
                    content: Text('appMenu03: Nothing selected.'),
                  ),
                );
              },
              tooltip: "Here's a tip for you.",
              elevation: 8,
              icon: const Icon(Icons.settings),
              offset: const Offset(0, 45),
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            )
          ],
        ),
        body: const MenuOption(),
      );
}

class MenuOption extends StatelessWidget {
  const MenuOption({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = InheritedData.of(context)?.data;
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
