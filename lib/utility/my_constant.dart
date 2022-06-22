import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstant {
  // Field
  static Color primary = Color.fromARGB(255, 65, 163, 255);
  static Color dark = Color.fromARGB(255, 199, 179, 0);
  static Color active = Color.fromARGB(255, 3, 221, 17);
  static Color grey = Color.fromARGB(255, 128, 128, 128);

  // Method

  BoxDecoration bgBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        radius: 1.5,
        center: Alignment(-0.3, -0.3),
        colors: [Colors.white, primary],
      ),
    );
  }

  TextStyle h1Style() {
    return GoogleFonts.mali(
        textStyle: TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    ));
  }

  TextStyle h2Style() {
    return GoogleFonts.mali(
      textStyle: TextStyle(
      fontSize: 18,
      color: dark,
      fontWeight: FontWeight.w700,
    ));
  }

  TextStyle h3Style() {
    return GoogleFonts.mali(
      textStyle: TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.normal,
    ));
  }

  TextStyle h4Style() {
    return GoogleFonts.mali(
      textStyle: TextStyle(
      fontSize: 14,
      color: grey,
      fontWeight: FontWeight.normal,
    ));
  }

  TextStyle h3ActiveStyle() {
    return GoogleFonts.mali(
      textStyle: TextStyle(
      fontSize: 14,
      color: active,
      fontWeight: FontWeight.normal,
    ));
  }
}
