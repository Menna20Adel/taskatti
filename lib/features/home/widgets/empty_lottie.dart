import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Lottie.asset(AssetImages.emptyLottie),
          Text(
            'You don\'t have any tasks yet!',
            style: smallStyle(color: AppColors.black, fontSize: 14.5),
          ),
          Text(
            'Add new tasks to make your days productive.',
            style: smallStyle(color: AppColors.black, fontSize: 14.5),
          ),
        ],
      ),
    );
  }
}
