//
// Original source provided by Andrious Solutions Ltd.  October 2022.
// Distributed "AS IS" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either expressed or implied. Use, copy, and modify at your own risk.
//

import 'package:app_popup_menu/app_popup_menu.dart';

export 'package:app_popup_menu/app_popup_menu.dart';

class SubClass03<T> extends AppPopupMenu<T> {
  SubClass03({
    Key? key,
    PopupMenuItemSelected<T>? onSelected,
  }) : super(
          key: key,
          onSelected: onSelected,
        );
}
