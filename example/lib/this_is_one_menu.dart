///
///
///
///
///

import 'package:app_popup_menu/app_popup_menu.dart';

class ThisIsOneMenu extends AppPopupMenu<String> {
  //

  @override
  List<String> get items => [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  List<PopupMenuItem<String>> get menuItems => [
    PopupMenuItem(child: Text('Option 1'), value: '1'),
    PopupMenuItem(child: Text('Option 2'), value: '2'),
    PopupMenuItem(child: Text('Option 3'), value: '3'),
    PopupMenuItem(child: Text('Option 4'), value: '4'),
  ];

  @override
  void onSelection(String value) {
    print(value);
  }
}