library app_popup_menu;
// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache License, Version 2.0.
// The main directory contains that LICENSE file.

import 'package:flutter/material.dart'
    show
        BuildContext,
        Builder,
        Color,
        EdgeInsets,
        EdgeInsetsGeometry,
        Key,
        Material,
        Offset,
        PopupMenuButton,
        PopupMenuCanceled,
        PopupMenuEntry,
        PopupMenuItem,
        PopupMenuItemBuilder,
        PopupMenuItemSelected,
        ScaffoldMessenger,
        ShapeBorder,
        SnackBar,
        StatefulWidget,
        State,
        Text,
        Widget;

/// Exports that will be likely required by the subclass.
export 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
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
        Scaffold,
        ShapeBorder,
        SnackBar,
        Text,
        Widget;

/// Abstract so to force to extend a subclass
/// and allow for overriding fields.
class AppPopupMenu<T> extends StatefulWidget with _StateSetWidget {
  //
  AppPopupMenu({
    Key? key,
    this.items,
    this.menuItems,
    this.itemBuilder,
    this.initialValue,
    this.onSelected,
    this.onCanceled,
    this.tooltip,
    this.elevation,
    this.padding,
    this.child,
    this.icon,
    this.offset,
    this.enabled,
    this.shape,
    this.color,
  })  : _setParams = _AppPopupMenuParameters(),
        super(key: key) {
    set(
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
  final _AppPopupMenuParameters<T> _setParams;

  // ignore: avoid_returning_this
  AppPopupMenu<T> set({
    List<T>? items,
    List<PopupMenuItem<T>>? menuItems,
    PopupMenuItemBuilder<T>? itemBuilder,
    T? initialValue,
    PopupMenuItemSelected<T>? onSelected, // For now, this will be disabled.
    PopupMenuCanceled? onCanceled,
    String? tooltip,
    double? elevation,
    EdgeInsetsGeometry? padding = const EdgeInsets.all(8),
    Widget? child,
    Widget? icon,
    Offset? offset = Offset.zero,
    bool? enabled = true,
    ShapeBorder? shape,
    Color? color,
  }) {
    _setParams.set(
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
    return this;
  }

  final List<T>? items;
  final List<PopupMenuItem<T>>? menuItems;
  final PopupMenuItemBuilder<T>? itemBuilder;
  final T? initialValue;
  final PopupMenuItemSelected<T>? onSelected;
  final PopupMenuCanceled? onCanceled;
  final String? tooltip;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Widget? icon;
  final Offset? offset;
  final bool? enabled;
  final ShapeBorder? shape;
  final Color? color;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _AppPopupMenuState<T>();

  /// Get State object's BuildContext
  BuildContext? get context => state?.context;

  _AppPopupMenuState<T>? get state => stateOf<_AppPopupMenuState<T>>();

  /// Can override in subclass
  List<PopupMenuEntry<T>> onItemBuilder(BuildContext context) => [];

  /// Can override in subclass
  List<T>? onItems() => [];

  /// Can override in subclass
  T? onInitialValue() => null;

  /// Can override in subclass
  List<PopupMenuItem<T>>? onMenuItems() => null;

  /// Can override in subclass
  void onSelection(T value) =>
      null; // onSelected == null ? null : onSelected!(value);

  /// Can override in subclass
  void onCancellation() => onCanceled == null ? null : onCanceled!();

  /// Can override in subclass
  String? onTooltip() => null;

  /// Can override in subclass
  double? onElevation() => null;

  /// Can override in subclass
  EdgeInsetsGeometry? onPadding() => const EdgeInsets.all(8);

  /// Can override in subclass
  Widget? onChild() => null;

  /// Can override in subclass
  Widget? onIcon() => null;

  /// Can override in subclass
  Offset? onOffset() => offset;

  /// Can override in subclass
  bool? onEnabled() => true;

  /// Can override in subclass
  ShapeBorder? onShape() => null;

  /// Can override in subclass
  Color? onColor() => null;

  /// Can override in subclass
  void onError() {
    final state = ScaffoldMessenger.of(context!);
    state.showSnackBar(
      const SnackBar(
        content: Text('Error. No menu options defined.'),
      ),
    );
  }
}

class _AppPopupMenuState<T> extends State<AppPopupMenu<T>> {
//    with _PopupMenuParameters<T> {
  //

  @override
  void initState() {
    super.initState();
    widget.withState(this);
  }

  ///
  // Returning a widget allows for the Builder() widget below.
  @override
  Widget build(BuildContext context) {
    final widget = this.widget;
    final setParams = widget._setParams;

    // So to retrieve the Scaffold object if any.
    return Builder(builder: (context) {
      Widget popupMenu = PopupMenuButton<T>(
        itemBuilder: setParams.itemBuilder ?? _onItems(widget.onItemBuilder),
        initialValue: setParams.initialValue ??
            widget.initialValue ??
            widget.onInitialValue(),
        onSelected: setParams.onSelected ?? widget.onSelection,
        onCanceled: setParams.onCanceled ?? widget.onCancellation,
        tooltip: setParams.tooltip ?? widget.tooltip ?? widget.onTooltip(),
        elevation:
            setParams.elevation ?? widget.elevation ?? widget.onElevation(),
        padding: setParams.padding ??
            widget.padding ??
            widget.onPadding() ??
            const EdgeInsets.all(8),
        icon: setParams.icon ?? widget.icon ?? widget.onIcon(),
        offset: setParams.offset ?? widget.onOffset() ?? Offset.zero,
        enabled:
            setParams.enabled ?? widget.enabled ?? widget.onEnabled() ?? true,
        shape: setParams.shape ?? widget.shape ?? widget.onShape(),
        color: setParams.color ?? widget.color ?? widget.onColor(),
        child: setParams.child ?? widget.child ?? widget.onChild(),
      );
      // If not running under the MaterialApp widget.
      if (context.widget is! Material &&
          context.findAncestorWidgetOfExactType<Material>() == null) {
        popupMenu = Material(child: popupMenu);
      }
      return popupMenu;
    });
  }

  PopupMenuItemBuilder<T> _onItems(PopupMenuItemBuilder<T>? menuList) {
    //
    /// 'items' parameters takes precedence over 'menuItems'
    List<T>? popupItems;
    for (final List<T>? itemList in [
      widget._setParams.items,
      widget.items,
      widget.onItems()
    ]) {
      if (itemList == null || itemList.isEmpty) {
        continue;
      }
      popupItems = itemList;
      break;
    }
    PopupMenuItemBuilder<T>? itemBuilder;

    if (popupItems != null) {
      final List<PopupMenuEntry<T>> popupMenuItems = popupItems
          .map((Object? item) =>
              PopupMenuItem<T>(value: item as T?, child: Text(item.toString())))
          .toList();
      itemBuilder = (BuildContext context) => <PopupMenuEntry<T>>[
            ...popupMenuItems,
          ];
    }

    if (itemBuilder == null) {
      final List<PopupMenuItem<T>>? onMenuItems = widget.onMenuItems();

      /// 'menuItems'
      for (final List<PopupMenuItem<T>>? itemsMenu in [
        widget._setParams.menuItems,
        widget.menuItems,
        onMenuItems, //as List<PopupMenuItem<T>>
      ]) {
        if (itemsMenu == null || itemsMenu.isEmpty) {
          continue;
        }
        itemBuilder = (BuildContext context) => <PopupMenuEntry<T>>[
              ...itemsMenu,
            ];
      }
    }
    return itemBuilder ??
        menuList ??
        (BuildContext context) => <PopupMenuEntry<T>>[];
  }
}

class _AppPopupMenuParameters<T> with _PopupMenuParameters<T> {}

mixin _PopupMenuParameters<T> {
  //
  void set({
    List<T>? items,
    List<PopupMenuItem<T>>? menuItems,
    PopupMenuItemBuilder<T>? itemBuilder,
    T? initialValue,
    PopupMenuItemSelected<T>? onSelected, // For now, this will be disabled.
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
  }) {
    if (items != null) {
      this.items = items;
    }
    if (menuItems != null) {
      this.menuItems = menuItems;
    }
    if (itemBuilder != null) {
      this.itemBuilder = itemBuilder;
    }
    if (initialValue != null) {
      this.initialValue = initialValue;
    }
    if (onSelected != null) {
      this.onSelected = onSelected;
    }
    if (onCanceled != null) {
      this.onCanceled = onCanceled;
    }
    if (tooltip != null) {
      this.tooltip = tooltip;
    }
    if (elevation != null) {
      this.elevation = elevation;
    }
    if (padding != null) {
      this.padding = padding;
    }
    if (child != null) {
      this.child = child;
    }
    if (icon != null) {
      this.icon = icon;
    }
    if (offset != null) {
      this.offset = offset;
    }
    if (enabled != null) {
      this.enabled = enabled;
    }
    if (shape != null) {
      this.shape = shape;
    }
    if (color != null) {
      this.color = color;
    }
  }

  List<T>? items;
  List<PopupMenuItem<T>>? menuItems;
  PopupMenuItemBuilder<T>? itemBuilder;
  T? initialValue;
  PopupMenuItemSelected<T>? onSelected;
  PopupMenuCanceled? onCanceled;
  String? tooltip;
  double? elevation;
  EdgeInsetsGeometry? padding;
  Widget? child;
  Widget? icon;
  Offset? offset;
  bool? enabled;
  ShapeBorder? shape;
  Color? color;
}

mixin _StateSetWidget on StatefulWidget {
  //
  final List<State?> _stateSet = [];

  T? stateOf<T extends State>() =>
      // ignore: avoid_as
      _stateSet.isEmpty ? null : _stateSet[0] as T?;

  /// Calls this in the State object's initState() function.
  void initState() {}

  /// Call this in the State object's dispose() function, widget.dispose();
  void dispose() {
    removeState();
  }

  /// Record the State object to its StatefulWidget using widget.withState(this);
  void withState(State state) {
    // Don't add more than one.
    if (_stateSet.isEmpty) {
      _stateSet.add(state);
    }
  }

  /// Call dispose() instead but use in extraordinary situations.
  void removeState() {
    if (_stateSet.isNotEmpty) {
      _stateSet.removeLast();
    }
  }
}

/// A template you can use to copy & paste a subclass.
// class SubClass<T> extends AppPopupMenu<T> {
//   SubClass({
//     Key key,
//     List<T> items,
//     List<PopupMenuItem<T>> menuItems,
//     PopupMenuItemBuilder<T> itemBuilder,
//     T initialValue,
//     PopupMenuItemSelected<T> onSelected,
//     PopupMenuCanceled onCanceled,
//     String tooltip,
//     double elevation,
//     EdgeInsetsGeometry padding,
//     Widget child,
//     Widget icon,
//     Offset offset,
//     bool enabled,
//     ShapeBorder shape,
//     Color color,
//     bool captureInheritedThemes,
//   }) : super(
//     key: key,
//     items: items,
//     menuItems: menuItems,
//     itemBuilder: itemBuilder,
//     initialValue: initialValue,
//     onSelected: onSelected,
//     onCanceled: onCanceled,
//     tooltip: tooltip,
//     elevation: elevation,
//     padding: padding,
//     child: child,
//     icon: icon,
//     offset: offset,
//     enabled: enabled,
//     shape: shape,
//     color: color,
//   );
// }
