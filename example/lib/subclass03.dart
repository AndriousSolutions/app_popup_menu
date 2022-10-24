// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache License, Version 2.0.
// The main directory contains that LICENSE file.

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
