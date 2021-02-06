import 'package:app_popup_menu/app_popup_menu.dart';

export 'package:app_popup_menu/app_popup_menu.dart';

import 'package:flutter/material.dart' show Key;

class SubClass03<T> extends AppPopupMenu<T> {
  SubClass03({
    Key key,
    List<T> items,
    List<PopupMenuItem<T>> menuItems,
    PopupMenuItemBuilder<T> itemBuilder,
    T initialValue,
    PopupMenuItemSelected<T> onSelected,
    PopupMenuCanceled onCanceled,
    String tooltip,
    double elevation,
    EdgeInsetsGeometry padding,
    Widget child,
    Widget icon,
    Offset offset,
    bool enabled,
    ShapeBorder shape,
    Color color,
    bool captureInheritedThemes,
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
          captureInheritedThemes: captureInheritedThemes,
        );
}
