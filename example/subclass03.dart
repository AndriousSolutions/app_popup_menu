// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache License, Version 2.0.
// The main directory contains that LICENSE file.

import 'package:flutter/material.dart' show Key;
import 'package:app_popup_menu/app_popup_menu.dart';

export 'package:app_popup_menu/app_popup_menu.dart';

class SubClass03<T> extends AppPopupMenu<T> {
  SubClass03({
    Key? key,
    List<T>? items,
    List<PopupMenuItem<T>>? menuItems,
    PopupMenuItemBuilder<T>? itemBuilder,
    T? initialValue,
    PopupMenuItemSelected<T>? onSelected,
    PopupMenuCanceled? onCanceled,
    String? tooltip,
    double? elevation,
    EdgeInsetsGeometry? padding,
    Widget? child,
    Widget? icon,
    Offset? offset,
    bool? enabled,
    ShapeBorder? shape,
    Color? color,
  }) : super(
          key: key,
          items: items,
          menuItems: menuItems,
          itemBuilder: itemBuilder,
          initialValue: initialValue,
          onSelected: onSelected,
          onCanceled: onCanceled,
          tooltip: tooltip,
          elevation: elevation,
          padding: padding,
          child: child,
          icon: icon,
          offset: offset,
          enabled: enabled,
          shape: shape,
          color: color,
        );
}
