import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/core/widgets/custom_btn.dart';
import 'package:taskatti/features/home/widgets/custom_text_field.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Task',
            style: titleStyle(color: AppColors.blue),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                'Title',
                style: titleStyle(),
              ),
              const CustomTextField(label: 'Enter title here'),
              const Gap(15),

              //note
              Text(
                'Note',
                style: titleStyle(),
              ),
              const CustomTextField(label: 'Enter note here'),
              const Gap(15),

              //date
              Text(
                'Date',
                style: titleStyle(),
              ),
              CustomTextField(
                label: '10/30/2023',
                suffix: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.date_range)),
              ),
              const Gap(15),

              //time
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: titleStyle(),
                      ),
                      CustomTextField(
                        label: '02:30 AM',
                        suffix: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.timer)),
                      ),
                    ],
                  )),
                  const Gap(10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: titleStyle(),
                      ),
                      CustomTextField(
                        label: '02:45 AM',
                        suffix: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.timer)),
                      ),
                    ],
                  )),
                ],
              ),

              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: titleStyle(),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.blue,
                          ),
                          const Gap(10),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.pink,
                          ),
                          const Gap(10),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.orange,
                          ),
                        ],
                      )
                    ],
                  ),
                  CustomButton(
                      width: 150, title: 'Create Task', onPressed: () {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
