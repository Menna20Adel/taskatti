import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      required this.hintText,
      this.suffix,
      this.maxLines,
      this.readOnly,
      this.onTap,
      this.controller,
      this.hintColor});
  final String hintText;
  final String title;
  final Icon? suffix;
  final int? maxLines;
  final bool? readOnly;
  final Function()? onTap;
  final TextEditingController? controller;
  final Color? hintColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle(context),
        ),
        TextFormField(
          controller: controller,
          readOnly: readOnly ?? false,
          onTap: onTap,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: smallStyle(context, color: hintColor ?? AppColors.grey),
            suffixIcon: suffix,
            suffixIconColor: AppColors.blue,
          ),
        ),
        const Gap(15),
      ],
    );
  }
}
