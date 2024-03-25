import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskatti/core/functions/routing.dart';
import 'package:taskatti/core/services/local_storage.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/core/widgets/custom_btn.dart';
import 'package:taskatti/features/add_task/data/task_model.dart';
import 'package:taskatti/features/add_task/widgets/custom_text_field.dart';
import 'package:taskatti/features/home/view/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key, this.model});
  final TaskModel? model;

  @override
  State<AddTaskView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddTaskView> {
  var date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  var startTime = DateFormat('HH:mm').format(DateTime.now());
  var endTime = DateFormat('HH:mm')
      .format(DateTime.now().add(const Duration(minutes: 30)));
  int color = 0;
  var titleController = TextEditingController();
  var noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          centerTitle: true,
          title: Text(
            'Add Task',
            style: titleStyle(context, color: AppColors.blue),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                CustomTextField(
                  title: 'Title',
                  hintText: 'Enter title here',
                  controller: titleController,
                ),

                //note
                CustomTextField(
                  title: 'Note',
                  hintText: 'Enter note here',
                  maxLines: 4,
                  controller: noteController,
                ),

                //date
                CustomTextField(
                  readOnly: true,
                  title: 'Date',
                  hintText: date,
                  hintColor: theme.onSurface,
                  suffix: const Icon(Icons.date_range),
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now()
                                .add(const Duration(days: 365))
                                .year))
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          date = DateFormat('dd/MM/yyyy').format(value);
                        });
                      }
                    });
                  },
                ),

                Row(
                  children: [
                    //start time
                    Expanded(
                        child: CustomTextField(
                      readOnly: true,
                      title: 'Start Time',
                      hintText: startTime,
                      hintColor: theme.onSurface,
                      suffix: const Icon(Icons.watch_later_outlined),
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              startTime = value.format(context);
                            });
                          }
                        });
                      },
                    )),
                    const Gap(10),

                    //end time
                    Expanded(
                        child: CustomTextField(
                      readOnly: true,
                      title: 'End Time',
                      hintText: endTime,
                      hintColor: theme.onSurface,
                      suffix: const Icon(Icons.watch_later_outlined),
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              endTime = value.format(context);
                            });
                          }
                        });
                      },
                    )),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Color',
                          style: titleStyle(context),
                        ),
                        //colors
                        Row(
                            children: List.generate(
                                3,
                                (index) => Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            color = index;
                                          });
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: index == 0
                                              ? AppColors.blue
                                              : index == 1
                                                  ? AppColors.pinkishRed
                                                  : AppColors.orange,
                                          child: index == color
                                              ? Icon(
                                                  Icons.check,
                                                  color: AppColors.white,
                                                )
                                              : const SizedBox(),
                                        ),
                                      ),
                                    )))
                      ],
                    ),
                    CustomButton(
                        width: 150,
                        title: 'Create Task',
                        onPressed: () {
                          String id =
                              '${titleController.text}${DateTime.now()}';
                          AppLocalStorage.cacheTask(
                              id,
                              TaskModel(
                                  id: id,
                                  title: titleController.text,
                                  note: noteController.text,
                                  date: date,
                                  startTime: startTime,
                                  endTime: endTime,
                                  color: color,
                                  isComplete: false));
                          navigateWithReplacment(context, const HomeView());
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
