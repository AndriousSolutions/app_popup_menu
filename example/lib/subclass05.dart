// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache License, Version 2.0.
// The main directory contains that LICENSE file.

import 'package:app_popup_menu/app_popup_menu.dart';

class SubClass05 extends PopupMenu<String> {
  const SubClass05({
    Key? key,
    this.onSelect,
    this.onCancel,
  }) : super(key: key ?? const Key('SubClass05'));

  /// When a menu option is selected
  final void Function(String value)? onSelect;

  /// When the menu is closed with nothing selected
  final void Function()? onCancel;

  /// List of menu items to appear in the popup menu.
  @override
  List<String>? onItems() => const ['Within', 'its', 'own', 'class'];

  /// Comment out the onItems line above to get these entries instead.
  @override
  List<PopupMenuEntry<String>> get menuItems => const [
        PopupMenuItem(
          child: Text('This'),
        ),
        PopupMenuItem(
          child: Text('is'),
        ),
        PopupMenuItem(
          child: Text('another'),
        ),
        PopupMenuItem(
          child: Text('way'),
        ),
      ];

  /// Comment out the items above to get this itemBuilder to return menu options.
  @override
  List<PopupMenuEntry<String>> Function(BuildContext context)?
      get itemBuilder => (context) => const [
            PopupMenuItem(
              child: Text('This'),
            ),
            PopupMenuItem(
              child: Text('is'),
            ),
            PopupMenuItem(
              child: Text('yet'),
            ),
            PopupMenuItem(
              child: Text('another'),
            ),
          ];

  /// The value of the menu item, if any, that should be highlighted when the menu opens.
  @override
  String? onInitialValue() => null;

  /// Called when the user selects a value from the popup menu created by this button.
  @override
  void selected(String value) {
    onSelect?.call(value);
  }

  /// Called when the user dismisses the popup menu without selecting an item.
  @override
  void canceled() {
    onCancel?.call();
  }

  /// Text that describes the action that will occur when the button is pressed.
  @override
  String? onTooltip() => "The 'on' functions are implemented in this class.";

  /// This controls the size of the shadow below the menu.
  @override
  double? onElevation() => 12;

  /// In some cases, it's useful to be able to set the padding to zero.
  @override
  EdgeInsetsGeometry? onPadding() => const EdgeInsets.all(16);

  /// The splash radius. If null, default splash radius of [InkWell] or [IconButton] is used.
  @override
  double? onSplashRadius() => null;

  /// The widget used for this button
  @override
  Widget? onChild() => null;

  /// The icon is used for this button
  @override
  Widget? onIcon() => null;

  /// the size of the [Icon].
  @override
  double? onIconSize() => null;

  /// The offset is applied relative to the initial position
  @override
  Offset? onOffset() => const Offset(0, 85);

  /// Whether this popup menu button is interactive
  @override
  bool? onEnabled() => true;

  /// The shape used for the menu
  @override
  ShapeBorder? onShape() => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      );

  /// The background color used for the menu
  @override
  Color? onColor() => Colors.yellow;

  /// Whether detected gestures should provide acoustic and/or haptic feedback
  @override
  bool? onEnableFeedback() => null;

  /// Make the menu wider than the default maximum width
  @override
  BoxConstraints? onConstraints() => null;

  /// Whether the menu is positioned over or under the popup menu button
  @override
  PopupMenuPosition? onPosition() => null;
}
