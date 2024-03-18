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
      this.controller});
  final String hintText;
  final String title;
  final Icon? suffix;
  final int? maxLines;
  final bool? readOnly;
  final Function()? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle(),
        ),
        TextFormField(
          controller: controller,
          readOnly: readOnly ?? false,
          onTap: onTap,
          maxLines: maxLines,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            suffixIcon: suffix,
            suffixIconColor: AppColors.grey,
          ),
        ),
        const Gap(15),
      ],
    );
  }
}
