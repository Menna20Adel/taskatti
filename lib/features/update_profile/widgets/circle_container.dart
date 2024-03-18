import 'package:flutter/material.dart';
import 'package:taskatti/core/utils/colors.dart';

class Circle extends StatelessWidget {
  const Circle(
      {super.key,
      required this.raduis,
      this.backgroundColor,
      this.child,
      this.image});
  final double raduis;
  final Color? backgroundColor;
  final Widget? child;
  final DecorationImage? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: raduis,
      height: raduis,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.blue,
        border: Border.all(
          width: 4,
          color: AppColors.white,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 10,
            color: AppColors.black.withOpacity(0.1),
          ),
        ],
        shape: BoxShape.circle,
        image: image,
      ),
      child: child,
    );
  }
}
