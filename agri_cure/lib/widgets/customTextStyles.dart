import 'package:flutter/material.dart';

class CustomTextStyles {
  static boldText({double size}) {
    return TextStyle(fontSize: size ?? 20, fontWeight: FontWeight.bold);
  }

  static whiteText() {
    return TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static coloredText({@required Color color, double size}) {
    return TextStyle(
        fontSize: size ?? 20, fontWeight: FontWeight.bold, color: color);
  }
}
