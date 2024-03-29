//
// Original source provided by Andrious Solutions Ltd.  October 2022.
// Distributed "AS IS" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either expressed or implied. Use, copy, and modify at your own risk.
//

import 'package:flutter/material.dart'
    show PopupMenuItem, ScaffoldMessenger, SnackBar, Text;

import 'package:app_popup_menu/app_popup_menu.dart';

import 'build_inherited_widget.dart';

class SubClass01 extends AppPopupMenu<String> {
  SubClass01({super.key});

  /// items takes precedence over menuItems
  /// comment this out and see 5 to 8 options.
  @override
  List<String> onItems() => [
        'Option 1',
        'Option 2',
        'Option 3',
        'Option 4',
      ];

  @override
  List<PopupMenuEntry<String>> get menuItems => const [
        PopupMenuItem(value: '1', child: Text('Option 5')),
        PopupMenuItem(value: '2', child: Text('Option 6')),
        PopupMenuItem(value: '3', child: Text('Option 7')),
        PopupMenuItem(value: '4', child: Text('Option 8')),
      ];

  @override
  void selected(String value) {
    InheritedData.of(context!)?.data = value;
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        content: Text('SubClass01 selected value: $value'),
      ),
    );
  }

  @override
  void canceled() => ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text('SubClass01: Nothing selected.'),
        ),
      );
}
