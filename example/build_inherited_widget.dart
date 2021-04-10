// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a Apache License, Version 2.0.
// The main directory contains that LICENSE file.

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
  final _BuildInheritedWidgetState object;

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
  static final _BuildInheritedWidgetState state = _BuildInheritedWidgetState();
  @override
  // ignore: no_logic_in_create_state
  State createState() => state;
}

class _BuildInheritedWidgetState extends State<BuildInheritedWidget> {
  bool notify = false;
  dynamic data;
  @override
  Widget build(BuildContext context) =>
      InheritedData(this, child: widget.child);

  /// Override again merely to prevent the warning message.
  @override
  void setState(VoidCallback fn) => super.setState(fn);
}
