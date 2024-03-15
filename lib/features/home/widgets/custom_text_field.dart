import 'package:flutter/material.dart';
import 'package:taskatti/core/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, this.suffix});
  final String label;
  final IconButton? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: label,
        suffixIcon: suffix,
        suffixIconColor: AppColors.grey,
      ),
    );
  }
}
