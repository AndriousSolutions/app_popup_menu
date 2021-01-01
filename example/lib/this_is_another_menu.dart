///
///
///
///
///
import 'package:flutter/material.dart'
    show BuildContext, Key, PopupMenuItem, Scaffold, SnackBar, Text;

import 'package:app_popup_menu/app_popup_menu.dart';

import 'build_inherited_widget.dart';

class ThisIsAnotherMenu extends AppPopupMenu<int> {
  //
  ThisIsAnotherMenu({Key key, BuildContext context})
      : super(
          key: key,
        );

  @override
  List<PopupMenuItem<int>> get menuItems => [
        PopupMenuItem(
          value: 1,
          child: Text("First"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Second"),
        ),
      ];

  @override
  void onSelection(int value) {
    InheritedData.of(context).data = value;
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('ThisIsAnotherMenu option: $value'),
      ),
    );
  }
}
