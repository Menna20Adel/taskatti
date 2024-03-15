import 'package:flutter/material.dart';
import 'package:taskatti/core/utils/colors.dart';

TextStyle titleStyle({double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 20,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? AppColors.black,
  );
}

TextStyle bodyStyle({double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.black,
  );
}

TextStyle smallStyle({double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.grey,
  );
}
