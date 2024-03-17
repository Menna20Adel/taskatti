import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatti/core/constants/assets_images.dart';
import 'package:taskatti/core/functions/routing.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/core/widgets/custom_btn.dart';
import 'package:taskatti/features/home/view/add_task_view.dart';
import 'package:taskatti/features/home/widgets/date_container.dart';
import 'package:taskatti/features/home/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              //header
              const HomeHeader(),
              const Gap(15),

              //add task
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'March 15, 2024\nToday',
                    style: titleStyle(),
                  ),
                  CustomButton(
                      width: 140,
                      title: '+ Add Task',
                      onPressed: () {
                        navigateTo(context, const AddTaskView());
                      })
                ],
              ),
              const Gap(15),

              //date
              Row(
                children: [
                  Date(
                    color: AppColors.blue,
                    num: '15',
                    day: 'Fri',
                    fontColor: AppColors.white,
                  ),
                  const Gap(5),
                  const Date(num: '16', day: 'Sat'),
                  const Gap(5),
                  const Date(num: '17', day: 'Sun'),
                  const Gap(5),
                  const Date(num: '18', day: 'Mon'),
                ],
              ),

              //lottie
              Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
