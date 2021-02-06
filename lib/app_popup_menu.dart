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
        Material,
        Offset,
        PopupMenuButton,
        PopupMenuCanceled,
        PopupMenuEntry,
        PopupMenuItem,
        PopupMenuItemBuilder,
        PopupMenuItemSelected,
        Scaffold,
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
class AppPopupMenu<T> extends StatefulWidget {
  //
  AppPopupMenu({
    Key key,
    this.items,
    this.menuItems,
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
  })  : _state = _AppPopupMenuState<T>(),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _state;

  /// Get State object's BuildContext
  BuildContext get context => _state.context;

  /// Can override in subclass
  List<PopupMenuEntry<T>> onItemBuilder(BuildContext context) =>
      itemBuilder(context);

  /// Can override in subclass
  List<T> onItems() => [];

  /// Can override in subclass
  T onInitialValue() => null;

  /// Can override in subclass
  List<PopupMenuItem<T>> onMenuItems() => null;

  /// Can override in subclass
  void onSelection(T value) => onSelected(value);

  /// Can override in subclass
  void onCancellation() => onCanceled();

  /// Can override in subclass
  String onTooltip() => null;

  /// Can override in subclass
  double onElevation() => null;

  /// Can override in subclass
  EdgeInsetsGeometry onPadding() => const EdgeInsets.all(8);

  /// Can override in subclass
  Widget onChild() => null;

  /// Can override in subclass
  Widget onIcon() => null;

  /// Can override in subclass
  Offset onOffset() => offset;

  /// Can override in subclass
  bool onEnabled() => true;

  /// Can override in subclass
  ShapeBorder onShape() => null;

  /// Can override in subclass
  Color onColor() => null;

  /// Can override in subclass
  bool onCaptureInheritedThemes() => true;

  /// Can override in subclass
  void onError() {
    var state = Scaffold.of(_state.context);
    state?.showSnackBar(
      SnackBar(
        content: Text('Error. No menu options defined.'),
      ),
    );
  }

  AppPopupMenu set<T>({
    Key key,
    List<T> items,
    List<PopupMenuItem<T>> menuItems,
    PopupMenuItemBuilder<T> itemBuilder,
    T initialValue,
//    PopupMenuItemSelected<T> onSelected,
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
    _state.set(
        items: items,
        menuItems: menuItems,
        itemBuilder: itemBuilder,
        initialValue: initialValue,
//        onSelected: onSelected,
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
        captureInheritedThemes: captureInheritedThemes);
    return this;
  }

  final _AppPopupMenuState _state;

  final List<T> items;
  final List<PopupMenuItem<T>> menuItems;
  final PopupMenuItemBuilder<T> itemBuilder;
  final T initialValue;
  final PopupMenuItemSelected<T> onSelected;
  final PopupMenuCanceled onCanceled;
  final String tooltip;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final Widget icon;
  final Offset offset;
  final bool enabled;
  final ShapeBorder shape;
  final Color color;
  final bool captureInheritedThemes;
}

class _AppPopupMenuState<T> extends State<AppPopupMenu>
    with _PopupMenuParameters<T> {
  //
  BuildContext _context;

  BuildContext get context => _context;

  set context(BuildContext context) {
    if (context != null) {
      // Don't assign again. Too dangerous.
      _context ??= context;
    }
  }

  ///
  // Returning a widget allows for the Builder() widget below.
  @override
  Widget build(BuildContext context) =>
      // So to retrieve the Scaffold object if any.
      Builder(builder: (context) {
        this.context ??= context;
        Widget popupMenu = PopupMenuButton<T>(
          itemBuilder: _onItems() ?? itemBuilder ?? widget.onItemBuilder,
          initialValue:
              initialValue ?? widget.initialValue ?? widget.onInitialValue(),
          onSelected: onSelected ?? widget.onSelection,
          onCanceled: onCanceled ?? widget.onCancellation,
          tooltip: tooltip ?? widget.tooltip ?? widget.onTooltip(),
          elevation: elevation ?? widget.elevation ?? widget.onElevation(),
          padding: padding ??
              widget.padding ??
              widget.onPadding() ??
              const EdgeInsets.all(8),
          icon: icon ?? widget.icon ?? widget.onIcon(),
          offset: offset ?? widget.onOffset() ?? Offset.zero,
          enabled: enabled ?? widget.enabled ?? widget.onEnabled() ?? true,
          shape: shape ?? widget.shape ?? widget.onShape(),
          color: color ?? widget.color ?? widget.onColor(),
          captureInheritedThemes: captureInheritedThemes ??
              widget.captureInheritedThemes ??
              widget.onCaptureInheritedThemes() ??
              true,
          child: child ?? widget.child ?? widget.onChild(),
        );
        // If not running under the MaterialApp widget.
        if (context.widget is! Material &&
            context.findAncestorWidgetOfExactType<Material>() == null) {
          popupMenu = Material(child: popupMenu);
        }
        return popupMenu;
      });

  PopupMenuItemBuilder<T> _onItems() {
    //
    /// 'items' parameters takes precedence over 'menuItems'
    List<T> popupItems;
    for (List<T> itemList in [items, widget.items, widget.onItems()]) {
      if (itemList == null || itemList.isEmpty) {
        continue;
      }
      popupItems = itemList;
      break;
    }
    if (popupItems != null) {
      List<PopupMenuEntry<T>> popupMenuItems = popupItems
          .map((Object item) =>
              PopupMenuItem<T>(value: item, child: Text(item.toString())))
          .toList();
      return (BuildContext context) => <PopupMenuEntry<T>>[
            ...popupMenuItems,
          ];
    }

    /// 'menuItems'
    for (List<PopupMenuItem<T>> itemsMenu in [
      menuItems,
      widget.menuItems,
      widget.onMenuItems()
    ]) {
      if (itemsMenu == null || itemsMenu.isEmpty) {
        continue;
      }
      return (BuildContext context) => <PopupMenuEntry<T>>[
        ...itemsMenu,
      ];
    }
    return null;
  }
}

mixin _PopupMenuParameters<T> {
  void set({
    List<T> items,
    List<PopupMenuItem<T>> menuItems,
    PopupMenuItemBuilder<T> itemBuilder,
    T initialValue,
 //   PopupMenuItemSelected<T> onSelected,  // For now, this will be disabled.
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
    if (captureInheritedThemes != null) {
      this.captureInheritedThemes = captureInheritedThemes;
    }
  }

  List<T> items;
  List<PopupMenuItem<T>> menuItems;
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
//     captureInheritedThemes: captureInheritedThemes,
//   );
// }