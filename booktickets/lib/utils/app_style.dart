import 'package:flutter/material.dart';

Color primary = const Color(0xFF687DAF);

class Style {
  static Color primaryColor = primary;
  static Color textColor = const Color(0xFF3B3B3B);
  static Color bgColor = const Color(0xFFEEEDF2);
  static Color orangeColor = const Color(0xFFf37b67);
  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: textColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headlineStyle1 = TextStyle(
    fontSize: 26,
    color: textColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineStyle2 = TextStyle(
    fontSize: 17,
    color: textColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headlineStyle3 = const TextStyle(
    fontSize: 21,
    // color: Colors.grey.shade500,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineStyle4 = TextStyle(
    fontSize: 14,
    color: Colors.grey.shade500,
    fontWeight: FontWeight.w500,
  );
}
