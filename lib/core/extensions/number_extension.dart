import 'package:flutter/material.dart';

extension NumberExtension on double {
  Widget get spaceVertical => SizedBox(height: toDouble());
  Widget get spaceHorizontal => SizedBox(width: toDouble());
}

extension NumberExtensionWithInt on int {
  Widget get spaceVertical => SizedBox(height: toDouble());
  Widget get spaceHorizontal => SizedBox(width: toDouble());
}
