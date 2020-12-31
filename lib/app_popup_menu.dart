///
///
///
///
///
///

import 'package:flutter/material.dart'
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
        ShapeBorder,
        required,
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
        ShapeBorder,
        Text,
        Widget;

class AppPopupMenu<T> {
  //
  AppPopupMenu({
    this.key,
    BuildContext context,
    this.itemBuilder,
    this.initialValue,
    this.onSelected,
    this.onCanceled,
    this.tooltip,
    this.elevation,
    this.padding = const EdgeInsets.all(8),
    this.child,
    this.icon,
    this.offset = Offset.zero,
    this.enabled = true,
    this.shape,
    this.color,
    this.captureInheritedThemes = true,
  }) {
    /// Use the context to 'pass in' other information for your Popup menu.
    _context = context;
  }

  ///
  final Key key;
  PopupMenuItemBuilder<T> itemBuilder;
  T initialValue;
  PopupMenuItemSelected<T> onSelected;
  PopupMenuCanceled onCanceled;
  String tooltip;
  double elevation;
  EdgeInsetsGeometry padding;
  Widget child;
  Widget icon;
  Offset offset;
  bool enabled;
  ShapeBorder shape;
  Color color;
  bool captureInheritedThemes;

  /// Supply a context any time and anywhere you want.
  BuildContext get context => _context;

  set context(BuildContext context) {
    if (context != null) {
      _context = context;
    }
  }

  BuildContext _context;

  List<T> get items => [];

  PopupMenuItemBuilder<T> _onItems(BuildContext context) {
    var menuItems = items
        .map((Object item) =>
            PopupMenuItem<T>(value: item, child: Text(item.toString())))
        .toList();
    return (BuildContext context) => <PopupMenuEntry<T>>[
      ...menuItems,
    ];
  }

  ///
  List<PopupMenuItem<T>> get menuItems => [];

  ///
  List<PopupMenuEntry<T>> onItemBuilder(BuildContext context) =>
      <PopupMenuEntry<T>>[
        ...menuItems,
      ];

  ///
  T onInitialValue() => null;

  ///
  void onSelection(T value) {}

  ///
  void onCancellation() {}

  ///
  String onTooltip() => null;

  ///
  double onElevation() => null;

  ///
  EdgeInsetsGeometry onPadding() => const EdgeInsets.all(8);

  ///
  Widget onChild() => null;

  ///
  Widget onIcon() => null;

  ///
  Offset onOffset() => Offset.zero;

  ///
  bool onEnabled() => true;

  ///
  ShapeBorder onShape() => null;

  ///
  Color onColor() => null;

  ///
  bool onCaptureInheritedThemes() => true;

  ///
  PopupMenuButton<T> get popupMenuButton => buttonMenu();

  ///
  PopupMenuButton<T> buttonMenu({
    Key key,
    BuildContext context,
    PopupMenuItemBuilder<String> itemBuilder,
    String initialValue,
    PopupMenuItemSelected<String> onSelected,
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
  }) {
    // The context passed here takes precedence.
    this.context = context;
    //
    return PopupMenuButton(
      itemBuilder: itemBuilder ?? items.isNotEmpty
          ? _onItems(this.context)
          : this.itemBuilder ?? onItemBuilder,
      initialValue: initialValue ?? this.initialValue ?? onInitialValue(),
      onSelected: onSelected ?? this.onSelected ?? onSelection,
      onCanceled: onCanceled ?? this.onCanceled ?? onCancellation,
      tooltip: tooltip ?? this.tooltip ?? onTooltip(),
      elevation: elevation ?? this.elevation ?? onElevation(),
      padding: padding ?? this.padding ?? onPadding(),
      icon: icon ?? this.icon ?? onIcon(),
      offset: offset ?? this.offset ?? onOffset(),
      enabled: enabled ?? this.enabled ?? onEnabled(),
      shape: shape ?? this.shape ?? onShape(),
      color: color ?? this.color ?? onColor(),
      captureInheritedThemes: captureInheritedThemes ??
          this.captureInheritedThemes ??
          onCaptureInheritedThemes(),
      child: child ?? this.child ?? onChild(),
    );
  }
}

///
/// Copy this to supply all the parameters if you want.
///
// class SubclassMenu extends AppPopupMenuButton<String> {
// SubclassMenu(
//     BuildContext context, {
//     Key key,
//     PopupMenuItemBuilder<String> itemBuilder,
//     String initialValue,
//     PopupMenuItemSelected<String> onSelected,
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
//           context: context,
//           key: key,
//           itemBuilder: itemBuilder,
//           initialValue: initialValue,
//           onSelected: onSelected,
//           onCanceled: onCanceled,
//           tooltip: tooltip,
//           elevation: elevation,
//           padding: padding,
//           child: child,
//           icon: icon,
//           offset: offset,
//           enabled: enabled,
//           shape: shape,
//           color: color,
//           captureInheritedThemes: captureInheritedThemes,
//         ) {
