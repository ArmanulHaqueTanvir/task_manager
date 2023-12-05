// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/pages/add_task_page.dart';
import 'package:task_manager/widgets/task_bar.dart';
import 'package:task_manager/widgets/titleNsubtitle.dart';

class TodayTaskPage extends StatelessWidget {
  TodayTaskPage({super.key});
  final DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  //  DateTime upcomingFixedTime = DateTime(2023, 12, 31, 12, 0);
  //  DateTime upcomingFixedTime = _taskController.taskList.;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF6b30e0),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
            weight: 100,
          ),
          onPressed: () async {
            await Get.to(const AddTaskPage(), transition: Transition.fade);
            _taskController.getTasks();
          },
        ),
      ),
      backgroundColor: const Color(0xFFededff),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleNSubtitle(
                title: "ToDO",
                subtitle: "Your pending/upcoming tasks",
              ),
              const Gap(10),
              _taskController.taskList != null
                  ? SizedBox(
                      height: 300,
                      child: Obx(
                        () {
                          return ListView.builder(
                            itemCount: _taskController.taskList.length,
                            itemBuilder: (_, index) {
                              Task task = _taskController.taskList[index];
                              DateTime upcomingFixedTime =
                                  DateTime.parse(task.initDate!);
                              Duration differenceBetween =
                                  upcomingFixedTime.difference(_selectedDate);
                              String differenceString =
                                  formatDuration(differenceBetween);
                              return GestureDetector(
                                onTap: () {
                                  _taskController.deleteTasks(
                                      _taskController.taskList[index]);
                                },
                                child: TaskBar(
                                  onChanged: (p0) {
                                    _taskController.isCompleted = true;
                                  },

                                  date: task.selectedDate.toString(),
                                  title: task.title.toString(),
                                  subtitle: differenceString.toString(),
                                  color: Colors.grey,
                                  time: task.startTime.toString(),

                                  // date: task.startDate.toString(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Container(
                        height: 100,
                        child: Image.asset('assets/empty_cart.png'),
                      ),
                    ),
              const Gap(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleNSubtitle(
                    title: "Completed",
                    subtitle: "Your completed tasks",
                  ),
                  const Gap(20),
                  _taskController.isCompleted == true
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: _taskController.taskList.length,
                            itemBuilder: (_, index) {
                              Task task = _taskController.taskList[index];
                              DateTime upcomingFixedTime =
                                  task.selectedDate as DateTime;
                              Duration difference =
                                  upcomingFixedTime.difference(_selectedDate);

                              print(_taskController.taskList.length);
                              return GestureDetector(
                                onTap: () {
                                  _taskController.deleteTasks(
                                      _taskController.taskList[index]);
                                },
                                child: TaskBar(
                                  // onChanged: (p0) {
                                  //   _taskController.isCompleted = true;
                                  // },
                                  date: task.selectedDate.toString(),
                                  title: task.title.toString(),
                                  subtitle: difference.toString(),
                                  time: task.startTime.toString(),
                                  // date: task.startDate.toString(),
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Container(
                            height: 100,
                            child: Image.asset('assets/empty_box.png'),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    return '${duration.inDays} days, ${duration.inHours.remainder(24)} hours, ${duration.inMinutes.remainder(60)} minutes';
  }
}
