//
// Original source provided by Andrious Solutions Ltd. October 2022.
// Distributed "AS IS" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either expressed or implied. Use, copy, and modify at your own risk.
//

import 'package:flutter/material.dart'
    show
        BuildContext,
        InheritedWidget,
        Key,
        State,
        StatefulWidget,
        VoidCallback,
        Widget;

class InheritedData extends InheritedWidget {
  ///
  const InheritedData(this.object, {Key? key, required Widget child})
      : super(key: key, child: child);

  ///
  final BuildInheritedWidgetState object;

  dynamic get data => object.data ?? '';
  set data(dynamic data) {
    if (data != null && data != object.data) {
      object.data = data;
      object.notify = true;
      object.setState(() {});
    }
  }

  ///
  @override
  bool updateShouldNotify(InheritedData oldWidget) {
    final notify = object.notify;
    object.notify = false;
    return notify;
  }

  ///
  static InheritedData? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedData>();
}

/// Builds a [InheritedWidget].
///
/// It's instantiated in a standalone widget
/// so its setState() call will **only** rebuild
/// [InheritedWidget] and consequently any of its dependents,
/// instead of rebuilding the app's entire widget tree.
class BuildInheritedWidget extends StatefulWidget {
  const BuildInheritedWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;
  static final BuildInheritedWidgetState state = BuildInheritedWidgetState();
  @override
  // ignore: no_logic_in_create_state
  State createState() => state;
}

class BuildInheritedWidgetState extends State<BuildInheritedWidget> {
  bool notify = false;
  dynamic data;
  @override
  Widget build(BuildContext context) =>
      InheritedData(this, child: widget.child);

  /// Override again merely to prevent the warning message.
  @override
  void setState(VoidCallback fn) => super.setState(fn);
}
