import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatti/core/constants/assets_images.dart';
import 'package:taskatti/core/functions/routing.dart';
import 'package:taskatti/core/services/local_storage.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/features/home/view/home_view.dart';
import 'package:taskatti/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool isUpload = AppLocalStorage.getCachedData('isUpload') ?? false;
    Future.delayed(const Duration(seconds: 5), () {
      navigateWithReplacment(
          context, (isUpload) ? const HomeView() : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset(AssetImages.splashLottie),
        Text('Taskatii',
            style:
                bodyStyle(context, fontSize: 22, fontWeight: FontWeight.w500)),
        const Gap(10),
        Text('It\'s Time To Get Organized',
            style: smallStyle(context, color: AppColors.grey)),
      ]),
    ));
  }
}
