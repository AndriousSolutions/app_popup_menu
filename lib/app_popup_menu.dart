// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache License, Version 2.0.
// The main directory contains that LICENSE file.

import 'package:flutter/material.dart';

/// Exports that will be likely required by the subclass.
export 'package:flutter/material.dart'
    show
        BuildContext,
        BorderRadius,
        BoxConstraints,
        Color,
        Colors,
        EdgeInsets,
        EdgeInsetsGeometry,
        Key,
        Offset,
        PopupMenuButton,
        PopupMenuCanceled,
        PopupMenuDivider,
        PopupMenuEntry,
        PopupMenuItem,
        PopupMenuItemBuilder,
        PopupMenuItemSelected,
        PopupMenuPosition,
        RoundedRectangleBorder,
        Scaffold,
        ShapeBorder,
        SnackBar,
        Text,
        Widget;

/// Create a customized [PopupMenuButton].
class AppPopupMenu<T> with PopupMenuButtonFunctions<T> {
  /// Supply all the properties to instantiate a custom [PopupMenuButton].
  AppPopupMenu({
    this.key,
    this.items,
    this.menuEntries,
    this.itemBuilder,
    this.initialValue,
    this.onSelected,
    this.onCanceled,
    this.tooltip,
    this.elevation,
    this.padding,
    this.child,
    this.splashRadius,
    this.icon,
    this.iconSize,
    this.offset,
    this.enabled,
    this.shape,
    this.color,
    this.enableFeedback,
    this.constraints,
    this.position, // Either PopupMenuPosition.over or PopupMenuPosition.under
  });

  /// Key to the PopupMenuButton
  Key? key;

  /// Optional list of menu items to appear in the popup menu.
  List<T>? items;

  /// Optional list of PopupMenuEntries to appear in the popup menu.
  List<PopupMenuEntry<T>>? menuEntries;

  /// override in subclass
  List<PopupMenuEntry<T>> get menuItems => [];

  /// The item builder if no List is available.
  PopupMenuItemBuilder<T>? itemBuilder;

  /// The value of the menu item, if any, that should be highlighted when the menu opens.
  T? initialValue;

  /// Called when a menu item is selected.
  PopupMenuItemSelected<T>? onSelected;

  /// Called when the user dismisses the popup menu without selecting an item.
  PopupMenuCanceled? onCanceled;

  /// Text that describes the action that will occur when the button is pressed.
  String? tooltip;

  /// The z-coordinate at which to place the menu when open. This controls the
  /// size of the shadow below the menu.
  double? elevation;

  /// Matches IconButton's 8 dps padding by default. In some cases, notably where
  /// this button appears as the trailing element of a list item, it's useful to be able
  /// to set the padding to zero.
  EdgeInsetsGeometry? padding;

  /// The splash radius.If null, default splash radius of [InkWell] or [IconButton] is used.
  double? splashRadius;

  /// If provided, [child] is the widget used for this button
  Widget? child;

  /// If provided, the [icon] is used for this button
  Widget? icon;

  /// The offset applied to the Popup Menu Button.
  ///
  /// When not set, the Popup Menu Button will be positioned directly next to
  /// the button that was used to create it.
  Offset? offset;

  /// Whether this popup menu button is interactive.
  bool? enabled;

  /// If provided, the shape used for the menu.
  ShapeBorder? shape;

  /// If provided, the background color used for the menu.
  Color? color;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  bool? enableFeedback;

  /// If provided, the size of the [Icon].
  double? iconSize;

  /// Optional size constraints for the menu.
  BoxConstraints? constraints;

  /// Whether the popup menu is positioned over or under the popup menu button.
  /// Either PopupMenuPosition.over or PopupMenuPosition.under
  PopupMenuPosition? position;

  /// Return the state object with the name, button.
  Widget get popupMenuButton => _popupMenuButton<T>(this);

  /// [BuildContext] objects are actually [Element] objects. The [BuildContext]
  /// interface is used to discourage direct manipulation of [Element] objects.
  BuildContext? get context => _context;
  BuildContext? _context;
}

///
Widget _popupMenuButton<T>(AppPopupMenu<T> app) => Builder(builder: (context) {
      app._context = context;
      Widget button = PopupMenu<T>(
        key: app.key,
        items: app.items ?? app.onItems(),
        menuEntries: app.menuEntries ?? app.menuItems,
        itemBuilder: app.itemBuilder,
        initialValue: app.initialValue ?? app.onInitialValue(),
        onSelected: app.onSelected ?? app.selected,
        onCanceled: app.onCanceled ?? app.canceled,
        tooltip: app.tooltip ?? app.onTooltip(),
        elevation: app.elevation ?? app.onElevation(),
        padding: app.padding ?? app.onPadding() ?? const EdgeInsets.all(8),
        splashRadius: app.splashRadius ?? app.onSplashRadius(),
        icon: app.icon ?? app.onIcon(),
        iconSize: app.iconSize ?? app.onIconSize(),
        offset: app.offset ?? app.onOffset() ?? Offset.zero,
        enabled: app.enabled ?? app.onEnabled() ?? true,
        shape: app.shape ?? app.onShape(),
        color: app.color ?? app.onColor(),
        enableFeedback: app.enableFeedback ?? app.onEnableFeedback(),
        constraints: app.constraints ?? app.onConstraints(),
        position: app.position ?? app.onPosition() ?? PopupMenuPosition.over,
        child: app.child ?? app.onChild(),
      );
      // If not running under the MaterialApp widget.
      if (context.widget is! Material &&
          context.findAncestorWidgetOfExactType<Material>() == null) {
        button = Material(child: button);
      }
      return button;
    });

/// Create a customized [PopupMenuButton].
class PopupMenu<T> extends StatelessWidget {
  /// Supply all the properties to instantiate a custom [PopupMenuButton].
  const PopupMenu({
    super.key,
    this.items,
    this.menuEntries,
    this.itemBuilder,
    this.initialValue,
    this.onSelected,
    this.onCanceled,
    this.tooltip,
    this.elevation,
    this.padding,
    this.splashRadius,
    this.child,
    this.icon,
    this.iconSize,
    this.offset,
    this.enabled,
    this.shape,
    this.color,
    this.enableFeedback,
    this.constraints,
    this.position,
    this.inTooltip,
    this.inElevation,
    this.inPadding,
    this.inSplashRadius,
    this.inChild,
    this.inIcon,
    this.inIconSize,
    this.inOffset,
    this.inEnabled,
    this.inShape,
    this.inColor,
    this.inEnableFeedback,
    this.inConstraints,
    this.inPosition,
  });

  /// List of menu items to appear in the popup menu.
  final List<T>? items;

  /// Optional list of PopupMenuEntries to appear in the popup menu.
  final List<PopupMenuEntry<T>>? menuEntries;

  /// Optional list of PopupMenuEntries to appear in the popup menu.
  /// Initialized only when the getter is accessed!
  List<PopupMenuEntry<T>> get menuItems => [];

  /// The item builder if no List is available.
  final PopupMenuItemBuilder<T>? itemBuilder;

  /// The value of the menu item, if any, that should be highlighted when the menu opens.
  final T? initialValue;

  /// Called when a menu item is selected.
  final PopupMenuItemSelected<T>? onSelected;

  /// Called when the user dismisses the popup menu without selecting an item.
  final PopupMenuCanceled? onCanceled;

  /// Text that describes the action that will occur when the button is pressed.
  final String? tooltip;

  /// The z-coordinate at which to place the menu when open. This controls the
  /// size of the shadow below the menu.
  final double? elevation;

  /// Matches IconButton's 8 dps padding by default. In some cases, notably where
  /// this button appears as the trailing element of a list item, it's useful to be able
  /// to set the padding to zero.
  final EdgeInsetsGeometry? padding;

  /// The splash radius.If null, default splash radius of [InkWell] or [IconButton] is used.
  final double? splashRadius;

  /// If provided, [child] is the widget used for this button
  final Widget? child;

  /// If provided, the [icon] is used for this button
  final Widget? icon;

  /// The size of the [icon].
  final double? iconSize;

  /// The offset applied to the Popup Menu Button.
  /// When not set, the Popup Menu Button will be positioned directly next to
  /// the button that was used to create it.
  final Offset? offset;

  /// Whether this popup menu button is interactive.
  final bool? enabled;

  /// If provided, the shape used for the menu.
  final ShapeBorder? shape;

  /// If provided, the background color used for the menu.
  final Color? color;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  final bool? enableFeedback;

  /// Optional size constraints for the menu.
  final BoxConstraints? constraints;

  /// Whether the popup menu is positioned over or under the popup menu button.
  final PopupMenuPosition? position;

  /// Produce the menu items for a List of items of type T.
  PopupMenuItemBuilder<T> _onItems(List<T>? menuItems) {
    menuItems ??= items;
    final popupMenuItems = menuItems!
        .map((T? item) =>
            PopupMenuItem<T>(value: item, child: Text(item.toString())))
        .toList();
    return (BuildContext context) => <PopupMenuEntry<T>>[
          ...popupMenuItems,
        ];
  }

  ///
  List<PopupMenuEntry<T>> onItemBuilder(BuildContext context) {
    List<PopupMenuEntry<T>>? menuOptions;
    // items or onItems()
    final List<T>? options = items ?? onItems();
    if (options != null && options.isNotEmpty) {
      menuOptions = _onItems(options).call(context);
    }
    // menuEntries
    if (menuOptions == null) {
      final entries = menuEntries;
      if (entries != null && entries.isNotEmpty) {
        menuOptions = entries;
      }
    }
    // the getter, menuItems
    if (menuOptions == null && menuItems.isNotEmpty) {
      menuOptions = menuItems;
    }
    // itemBuilder()
    menuOptions ??= itemBuilder == null ? null : itemBuilder!(context);
    return menuOptions ??= <PopupMenuEntry<T>>[];
  }

  /// List of menu items to appear in the popup menu.
  List<T>? onItems() => [];

  /// The value of the menu item, if any, that should be highlighted when the menu opens.
  T? onInitialValue() => null;

  /// Called when the user selects a value from the popup menu created by this button.
  void selected(T value) {}

  /// Called when the user dismisses the popup menu without selecting an item.
  void canceled() {}

  /// Text that describes the action that will occur when the button is pressed.
  String? onTooltip() => inTooltip == null ? null : inTooltip!();

  /// 'in Parameters' function
  final String? Function()? inTooltip;

  /// This controls the size of the shadow below the menu.
  double? onElevation() => inElevation == null ? null : inElevation!();

  /// 'in Parameters' function
  final double? Function()? inElevation;

  /// In some cases, it's useful to be able to set the padding to zero.
  EdgeInsetsGeometry? onPadding() => inPadding == null ? null : inPadding!();

  /// 'in Parameters' function
  final EdgeInsetsGeometry? Function()? inPadding;

  /// The splash radius. If null, default splash radius of [InkWell] or [IconButton] is used.
  double? onSplashRadius() => inSplashRadius == null ? null : inSplashRadius!();

  /// 'in Parameters' function
  final double? Function()? inSplashRadius;

  /// The widget used for this button
  Widget? onChild() => inChild == null ? null : inChild!();

  /// 'in Parameters' function
  final Widget? Function()? inChild;

  /// The icon is used for this button
  Widget? onIcon() => inIcon == null ? null : inIcon!();

  /// 'in Parameters' function
  final Widget? Function()? inIcon;

  /// the size of the [Icon].
  double? onIconSize() => inIconSize == null ? null : inIconSize!();

  /// 'in Parameters' function
  final double? Function()? inIconSize;

  /// The offset is applied relative to the initial position
  Offset? onOffset() => inOffset == null ? null : inOffset!();

  /// 'in Parameters' function
  final Offset? Function()? inOffset;

  /// Whether this popup menu button is interactive
  bool? onEnabled() => inEnabled == null ? true : inEnabled!();

  /// 'in Parameters' function
  final bool? Function()? inEnabled;

  /// The shape used for the menu
  ShapeBorder? onShape() => inShape == null ? null : inShape!();

  /// 'in Parameters' function
  final ShapeBorder? Function()? inShape;

  /// The background color used for the menu
  Color? onColor() => inColor == null ? null : inColor!();

  /// 'in Parameters' function
  final Color? Function()? inColor;

  /// Whether detected gestures should provide acoustic and/or haptic feedback
  bool? onEnableFeedback() =>
      inEnableFeedback == null ? null : inEnableFeedback!();

  /// 'in Parameters' function
  final bool? Function()? inEnableFeedback;

  /// Make the menu wider than the default maximum width
  BoxConstraints? onConstraints() =>
      inConstraints == null ? null : inConstraints!();

  /// 'in Parameters' function
  final BoxConstraints? Function()? inConstraints;

  /// Whether the menu is positioned over or under the popup menu button
  /// PopupMenuPosition.over or PopupMenuPosition.under
  PopupMenuPosition? onPosition() => inPosition == null ? null : inPosition!();

  /// 'in Parameters' function
  final PopupMenuPosition? Function()? inPosition;

  @override
  Widget build(BuildContext context) {
    Widget popupMenu = PopupMenuButton<T>(
      itemBuilder: onItemBuilder,
      initialValue: initialValue ?? onInitialValue(),
      onSelected: (T value) {
        if (onSelected == null) {
          selected(value);
        } else {
          onSelected!(value);
        }
      },
      onCanceled: () {
        if (onCanceled == null) {
          canceled();
        } else {
          onCanceled!();
        }
      },
      tooltip: tooltip ?? onTooltip(),
      elevation: elevation ?? onElevation(),
      padding: padding ?? onPadding() ?? const EdgeInsets.all(8),
      splashRadius: splashRadius ?? onSplashRadius(),
      icon: icon ?? onIcon(),
      iconSize: iconSize ?? onIconSize(),
      offset: offset ?? onOffset() ?? Offset.zero,
      enabled: enabled ?? onEnabled() ?? true,
      shape: shape ?? onShape(),
      color: color ?? onColor(),
      enableFeedback: enableFeedback ?? onEnableFeedback(),
      constraints: constraints ?? onConstraints(),
      position: position ?? onPosition() ?? PopupMenuPosition.over,
      child: child ?? onChild(),
    );
    // If not running under the MaterialApp widget.
    if (context.widget is! Material &&
        context.findAncestorWidgetOfExactType<Material>() == null) {
      popupMenu = Material(child: popupMenu);
    }
    return popupMenu;
  }
}

///
mixin PopupMenuButtonFunctions<T> {
  /// List of menu items to appear in the popup menu.
  List<T>? onItems() => [];

  /// The value of the menu item, if any, that should be highlighted when the menu opens.
  T? onInitialValue() => null;

  /// Called when the user selects a value from the popup menu created by this button.
  void selected(T value) {}

  /// Called when the user dismisses the popup menu without selecting an item.
  void canceled() {}

  /// Text that describes the action that will occur when the button is pressed.
  String? onTooltip() => null;

  /// This controls the size of the shadow below the menu.
  double? onElevation() => null;

  /// In some cases, it's useful to be able to set the padding to zero.
  EdgeInsetsGeometry? onPadding() => null;

  /// The splash radius. If null, default splash radius of [InkWell] or [IconButton] is used.
  double? onSplashRadius() => null;

  /// The widget used for this button
  Widget? onChild() => null;

  /// The icon is used for this button
  Widget? onIcon() => null;

  /// the size of the [Icon].
  double? onIconSize() => null;

  /// The offset is applied relative to the initial position
  Offset? onOffset() => null;

  /// Whether this popup menu button is interactive
  bool? onEnabled() => true;

  /// The shape used for the menu
  ShapeBorder? onShape() => null;

  /// The background color used for the menu
  Color? onColor() => null;

  /// Whether detected gestures should provide acoustic and/or haptic feedback
  bool? onEnableFeedback() => null;

  /// Make the menu wider than the default maximum width
  BoxConstraints? onConstraints() => null;

  /// Whether the menu is positioned over or under the popup menu button
  PopupMenuPosition? onPosition() => null;
}

// /// A generic class to provide the App's popup menu.
// class AppMenu {
//   /// The App's popup is instantiated only once.
//   factory AppMenu() => _this ??= AppMenu._();
//   AppMenu._();
//   static AppMenu? _this;
//
//   static StateX? _state;
//
//   Menu? _menu;
//   String? _applicationName;
//   String? _applicationVersion;
//   Widget? _applicationIcon;
//   String? _applicationLegalese;
//   List<Widget>? _children;
//
//   /// Display the popup menu.
//   PopupMenuButton<dynamic> show(
//     StateX state, {
//     String? applicationName,
//     Widget? applicationIcon,
//     String? applicationLegalese,
//     List<Widget>? children,
//     bool useRootNavigator = true,
//     Menu? menu,
//   }) {
//     _state = state;
//     _menu = menu;
//     _applicationName = applicationName;
//     _applicationVersion = 'version: ${App.version} build: ${App.buildNumber}';
//     _applicationIcon = applicationIcon;
//     _applicationLegalese = applicationLegalese;
//     _children = children;
//
//     var menuItems = <PopupMenuEntry<dynamic>>[
// //      PopupMenuItem<dynamic>(value: 'Color', child: I10n.t('Colour Theme')),
//       PopupMenuItem<dynamic>(value: 'About', child: L10n.t('About'))
//     ];
//
//     if (_menu != null) {
//       final temp = <PopupMenuEntry<dynamic>>[
//         ..._menu!.menuItems(),
//         const PopupMenuDivider(),
//         ...menuItems
//       ];
//       menuItems = temp;
//
//       if (_menu!.tailItems.isNotEmpty) {
//         menuItems.add(const PopupMenuDivider());
//         menuItems.addAll(_menu!.tailItems);
//       }
//     }
//
//     return PopupMenuButton<dynamic>(
//       onSelected: _showMenuSelection,
//       itemBuilder: (BuildContext context) => menuItems,
//     );
//   }
//
//   void _showMenuSelection(dynamic value) {
//     if (_menu != null) {
//       _menu!.onSelected(value);
//     }
//     if (value is! String) {
//       return;
//     }
//     switch (value) {
//       case 'About':
//         showAboutDialog(
//             context: _state!.context,
//             applicationName: L10n.s(_applicationName ?? App.state?.title ?? ''),
//             applicationVersion: _applicationVersion,
//             applicationIcon: _applicationIcon,
//             applicationLegalese: _applicationLegalese,
//             children: _children);
//         break;
//       default:
//     }
//   }
// }
//
// /// Abstract class to implement the App's popup menu.
// abstract class Menu {
//   /// Called to instantiate an App popup menu object.
//   Menu() : _appMenu = AppMenu();
//   final AppMenu _appMenu;
//
//   /// The List of defined Popup Menu Items at the tail end of the menu.
//   List<PopupMenuItem<dynamic>> tailItems = [];
//
//   /// The List of defined Popup Menu Items.
//   List<PopupMenuItem<dynamic>> menuItems();
//
//   /// Called when a menu item is selected.
//   void onSelected(dynamic menuItem);
//
//   /// Display the popup menu.
//   /// Passed in a 'State' object and the Application's very name.
//   PopupMenuButton<dynamic> show(StateX state, {String? applicationName}) =>
//       _appMenu.show(
//         state,
//         applicationName: applicationName,
//         menu: this,
//       );
// }
