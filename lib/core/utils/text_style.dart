import 'package:flutter/material.dart';

TextStyle titleStyle(contex,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 20,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? Theme.of(contex).colorScheme.onSurface,
  );
}

TextStyle bodyStyle(contex,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? Theme.of(contex).colorScheme.onSurface,
  );
}

TextStyle smallStyle(context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}
