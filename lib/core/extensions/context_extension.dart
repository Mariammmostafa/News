import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // theme
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  // routes
  void back({Object? arguments}) => Navigator.of(this).pop(arguments);

  Future<void> goToNamed(String route, {Object? arguments}) async =>
      await Navigator.of(this).pushNamed(
        route,
        arguments: arguments,
      );

  Future<void> goToNamedReplace(String route, {Object? arguments}) async =>
      await Navigator.of(this).pushReplacementNamed(
        route,
        arguments: arguments,
      );

  Future<void> goBackUntil(String backRouteName) async => Navigator.of(
        this,
      ).popUntil(
        (route) => route.settings.name == backRouteName,
      );

  void goBackUntilAndPush({
    Object? arguments,
    required String newRouteName,
    required String backRouteName,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        newRouteName,
        (route) => route.settings.name == backRouteName,
        arguments: arguments,
      );

  void removeAllAndPush(
    String pushRoute, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        pushRoute,
        (route) => false,
        arguments: arguments,
      );

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
