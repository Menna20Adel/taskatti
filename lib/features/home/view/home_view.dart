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
import 'package:taskatti/features/home/widgets/home_header.dart';
import 'package:taskatti/features/add_task/widgets/task_container.dart';

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
                        style: titleStyle(),
                      ),
                      Text(
                        'Today',
                        style: titleStyle(),
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
                width: 90,
                height: 120,
                initialSelectedDate: DateTime.now(),
                monthTextStyle: smallStyle(color: AppColors.black),
                dayTextStyle: smallStyle(color: AppColors.black),
                dateTextStyle: titleStyle(fontSize: 26),
                selectionColor: AppColors.blue,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    _selectedValue =
                        DateFormat('dd/MM/yyyy').format(DateTime.now());
                  });
                },
              ),
              const Gap(15),

              //list of tasks
              Expanded(
                  child: ValueListenableBuilder(
                valueListenable: Hive.box<TaskModel>('task').listenable(),
                builder: (context, value, child) {
                  List<TaskModel> tasks = [];
                  for (var element in value.values) {
                    if (element.date == _selectedValue) {
                      tasks.add(element);
                    }
                  }
                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TaskContainer(
                          model: tasks[index],
                        );
                      });
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
