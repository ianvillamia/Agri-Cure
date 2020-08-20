import 'package:flutter/material.dart';

class CustomWidgets {
  static circle({@required Color color, @required size}) {
    return ClipOval(
      child: Container(
        width: size.width * .035,
        height: size.height * .02,
        color: color,
      ),
    );
  }
}
