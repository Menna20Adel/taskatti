import 'package:flutter/material.dart';
import 'package:taskatti/core/utils/colors.dart';

showErrorDialog(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: AppColors.red, content: Text(text)));
}
