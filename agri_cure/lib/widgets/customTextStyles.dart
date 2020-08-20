import 'package:flutter/material.dart';

class CustomTextStyles {
  static boldText({double size}) {
    return TextStyle(fontSize: size ?? 20, fontWeight: FontWeight.bold);
  }

  static whiteText() {
    return TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  }
}
