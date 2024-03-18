import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/features/add_task/data/task_model.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key, required this.model});
  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: model.color == 0
              ? AppColors.blue
              : model.color == 1
                  ? AppColors.red
                  : AppColors.orange,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: bodyStyle(color: AppColors.white),
              ),
              const Gap(8),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.white,
                    size: 14,
                  ),
                  const Gap(5),
                  Text(
                    '${model.startTime} : ${model.endTime}',
                    style: smallStyle(color: AppColors.white, fontSize: 14),
                  ),
                ],
              ),
              const Gap(8),
              Text(
                'Iwill do this Task',
                style: smallStyle(color: AppColors.white),
              )
            ],
          ),
          const Spacer(),
          Container(
            height: 90,
            width: 1,
            color: AppColors.white,
          ),
          const Gap(10),
          RotatedBox(
              quarterTurns: 3,
              child: Text(
                model.isComplete ? 'COMPLETED' : 'TODO',
                style: smallStyle(color: AppColors.white),
              ))
        ],
      ),
    );
  }
}
