import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskatti/core/functions/routing.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/core/widgets/custom_btn.dart';
import 'package:taskatti/features/add_task/data/task_model.dart';
import 'package:taskatti/features/add_task/presentation/view/add_task_view.dart';
import 'package:taskatti/features/home/widgets/empty_lottie.dart';
import 'package:taskatti/features/home/widgets/home_header.dart';
import 'package:taskatti/features/home/widgets/task_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _selectedValue = DateFormat('dd/MM/yyyy').format(DateTime.now());
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

              //today date and add task btn
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: titleStyle(context),
                      ),
                      Text(
                        'Today',
                        style: titleStyle(context),
                      ),
                    ],
                  ),
                  CustomButton(
                      width: 145,
                      title: '+ Add Task',
                      onPressed: () {
                        navigateTo(context, const AddTaskView());
                      })
                ],
              ),
              const Gap(15),

              //date timeline
              DatePicker(
                DateTime.now(),
                height: 120,
                width: 90,
                initialSelectedDate: DateTime.now(),
                monthTextStyle: smallStyle(context),
                dayTextStyle: smallStyle(context),
                dateTextStyle: titleStyle(context, fontSize: 26),
                selectionColor: AppColors.blue,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    _selectedValue = DateFormat('dd/MM/yyyy').format(date);
                  });
                },
              ),
              const Gap(15),

              //list of tasks
              Expanded(
                  child: ValueListenableBuilder<Box<TaskModel>>(
                valueListenable: Hive.box<TaskModel>('task').listenable(),
                builder: (context, Box<TaskModel> box, child) {
                  List<TaskModel> tasks = [];
                  for (var element in box.values) {
                    if (element.date == _selectedValue) {
                      tasks.add(element);
                    }
                  }
                  if (tasks.isEmpty) {
                    return const Center(child: EmptyLottie());
                  }

                  return ListView.separated(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          padding: const EdgeInsets.all(10),
                          color: AppColors.green,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: AppColors.white,
                              ),
                              const Gap(5),
                              Text(
                                'Complete',
                                style:
                                    smallStyle(context, color: AppColors.white),
                              )
                            ],
                          ),
                        ),
                        secondaryBackground: Container(
                          padding: const EdgeInsets.all(10),
                          color: AppColors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.delete,
                                color: AppColors.white,
                              ),
                              const Gap(5),
                              Text(
                                'Delete',
                                style:
                                    smallStyle(context, color: AppColors.white),
                              )
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            box.put(
                                tasks[index].id,
                                TaskModel(
                                    id: tasks[index].id,
                                    title: tasks[index].title,
                                    note: tasks[index].note,
                                    date: tasks[index].date,
                                    startTime: tasks[index].startTime,
                                    endTime: tasks[index].endTime,
                                    color: 3,
                                    isComplete: true));
                          }
                        },
                        child: TaskContainer(
                          model: tasks[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(10),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
