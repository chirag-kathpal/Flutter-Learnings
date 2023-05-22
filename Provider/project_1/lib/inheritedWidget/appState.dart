// The inherited widget is immutable and allows child widgets to access data(state) above in the
// widget tree
// 1. create a class that extends the InheritedWidget
// 2. add files to contain data
// 3. add the of() method to access the InheritedWidget from child widgets
// 4. add the updateShouldNotify() method to notify widgets to rebuild if data changed

import 'package:flutter/material.dart';

class AppState extends InheritedWidget {
  final bool agreed;

  const AppState({
    Key? key,
    required this.agreed,
    required Widget child,
  }) : super(key: key, child: child);

  static AppState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>();
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return agreed != oldWidget.agreed;
  }
}

// to use this in a widget
// final nose = AppState.of(context);
