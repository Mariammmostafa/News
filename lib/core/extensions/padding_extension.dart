import 'package:flutter/material.dart';

extension PaddingToWidget on Widget {
  Widget setHorizontalPadding({double padding = 16}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget setVerticalPadding({double padding = 16}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }
}
