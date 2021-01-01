///
///
///
///
///
import 'package:flutter/material.dart'
    show PopupMenuItem, Scaffold, SnackBar, Text;

import 'package:app_popup_menu/app_popup_menu.dart';

import 'build_inherited_widget.dart';

class ThisIsOneMenu extends AppPopupMenu<String> {
  //

  @override
  String get initialValue => 'Option 3';

  /// items takes precedence over menuItems
  /// comment this out and see 5 to 8 options.
  @override
  List<String> get items => [
        'Option 1',
        'Option 2',
        'Option 3',
        'Option 4',
      ];

  @override
  List<PopupMenuItem<String>> get menuItems => [
        PopupMenuItem(child: Text('Option 5'), value: '1'),
        PopupMenuItem(child: Text('Option 6'), value: '2'),
        PopupMenuItem(child: Text('Option 7'), value: '3'),
        PopupMenuItem(child: Text('Option 8'), value: '4'),
      ];

  @override
  void onSelection(String value) {
    InheritedData.of(context).data = value;
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('ThisIsOneMenu selected value: $value'),
      ),
    );
  }
}
