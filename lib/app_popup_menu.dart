///
///
///
///
///
///

import 'package:flutter/material.dart'
    show
        BuildContext,
        Builder,
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
        Scaffold,
        ShapeBorder,
        SnackBar,
        Text,
        Widget;

class AppPopupMenu<T> {
  //
  AppPopupMenu({
    this.key,
    this.items,
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
  });

  ///
  final Key key;
  List<T> items;
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
      // Don't assign again. Too dangerous.
      _context ??= context;
    }
  }

  BuildContext _context;

  PopupMenuItemBuilder<T> _onItems(List<T> menuItems) {
    menuItems ??= items;
    var popupMenuItems = menuItems
        .map((Object item) =>
            PopupMenuItem<T>(value: item, child: Text(item.toString())))
        .toList();
    return (BuildContext context) => <PopupMenuEntry<T>>[
          ...popupMenuItems,
        ];
  }

  /// override in subclass
  List<PopupMenuItem<T>> get menuItems => [];

  /// override in subclass
  List<PopupMenuEntry<T>> onItemBuilder(BuildContext context) {
    if (menuItems.isEmpty) {
      errorSnackBar();
    }
    return <PopupMenuEntry<T>>[
      ...menuItems,
    ];
  }

  /// override in subclass
  List<T> onItems() => [];

  /// override in subclass
  T onInitialValue() => null;

  /// override in subclass
  void onSelection(T value) {}

  /// override in subclass
  void onCancellation() {}

  /// override in subclass
  String onTooltip() => null;

  /// override in subclass
  double onElevation() => null;

  /// override in subclass
  EdgeInsetsGeometry onPadding() => const EdgeInsets.all(8);

  /// override in subclass
  Widget onChild() => null;

  /// override in subclass
  Widget onIcon() => null;

  /// override in subclass
  Offset onOffset() => Offset.zero;

  /// override in subclass
  bool onEnabled() => true;

  /// override in subclass
  ShapeBorder onShape() => null;

  /// override in subclass
  Color onColor() => null;

  /// override in subclass
  bool onCaptureInheritedThemes() => true;

  void errorSnackBar() {
    var state = Scaffold.of(context);
    state?.showSnackBar(
      SnackBar(
        content: Text('Error. No menu options defined.'),
      ),
    );
  }

  ///
  // Returning a widget allows for the Builder() widget below.
  Widget get popupMenuButton => buttonMenu();

  ///
  // Returning a widget allows for the Builder() widget below.
  Widget buttonMenu({
    Key key,
    List<T> items,
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
  }) {
    // So to retrieve the Scaffold object if any.
    return Builder(builder: (context) {
      this.context ??= context;
      items ??= this.items;
      return PopupMenuButton<T>(
        itemBuilder: itemBuilder ?? items != null && items.isNotEmpty
            ? _onItems(items)
            : this.itemBuilder ?? onItemBuilder ?? _onItems(onItems()),
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
    });
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
