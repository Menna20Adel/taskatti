import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatti/core/constants/assets_images.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';

class EmptyLottie extends StatefulWidget {
  const EmptyLottie({super.key});

  @override
  State<EmptyLottie> createState() => _EmptyLottieState();
}

class _EmptyLottieState extends State<EmptyLottie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AssetImages.emptyLottie),
        const Gap(10),
        Text(
          'You don\'t have any tasks yoday!',
          style: smallStyle(color: AppColors.black),
        ),
      ],
    );
  }
}
