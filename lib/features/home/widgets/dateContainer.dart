import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';

class Date extends StatelessWidget {
  const Date(
      {super.key,
      this.color,
      required this.num,
      required this.day,
      this.fontColor});
  final Color? color;
  final Color? fontColor;
  final String num;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color ?? AppColors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Mar',
            style: smallStyle(color: fontColor ?? AppColors.black),
          ),
          const Gap(5),
          Text(
            num,
            style:
                titleStyle(fontSize: 26, color: fontColor ?? AppColors.black),
          ),
          const Gap(5),
          Text(
            day,
            style: smallStyle(color: fontColor ?? AppColors.black),
          ),
        ],
      ),
    );
  }
}
