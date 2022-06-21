import 'package:flutter/material.dart';

class MyConstant {
  // Field
  static Color primary = Color.fromARGB(255, 65, 163, 255);
  static Color dark = Color.fromARGB(255, 199, 179, 0);

  // Method
  TextStyle h1Style() {
    return TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      fontSize: 18,
      color: dark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.normal,
    );
  }

}
