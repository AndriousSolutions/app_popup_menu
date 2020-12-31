import 'package:app_popup_menu/app_popup_menu.dart';

export 'package:app_popup_menu/app_popup_menu.dart';

class HereIsAnotherMenu extends AppPopupMenu<int> {
  HereIsAnotherMenu(
    BuildContext context, {
    Key key,
    PopupMenuItemBuilder<int> itemBuilder,
    int initialValue,
    PopupMenuItemSelected<int> onSelected,
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
          context: context,
          key: key,
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

  @override
  void onSelection(int value) {
    switch (value) {
      case 1:
        print('value: $value');
        break;
      case 2:
        print('value: $value');
        break;
      default:
    }
  }
}
