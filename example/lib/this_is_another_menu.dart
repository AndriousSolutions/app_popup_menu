///
///
///
///
///

import 'package:app_popup_menu/app_popup_menu.dart';

class ThisIsAnotherMenu extends AppPopupMenu<int> {
  //

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
    print(value);
  }
}