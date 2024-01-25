// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/pages/add_task_page.dart';
import 'package:task_manager/utils/dimentions.dart';
import 'package:task_manager/widgets/task_bar.dart';
import 'package:task_manager/widgets/titleNsubtitle.dart';

class TodayTaskPage extends StatelessWidget {
  TodayTaskPage({super.key});
  final DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    DateTime startOfWeek = DateTime.utc(now.year, now.month, now.day);
    int daysUntilSaturday = DateTime.saturday - startOfWeek.weekday;
    startOfWeek = startOfWeek.add(Duration(days: daysUntilSaturday));

    DateTime endOfWeek = startOfWeek.add(Duration(days: daysUntilSaturday));

    DateTimeRange range = DateTimeRange(start: startOfWeek, end: endOfWeek);

    final startDate = range.start;
    final endDate = range.end;

// ---------------------

    List<Task> filteredTasks = _taskController.taskList
        .where((task) =>
            DateTime.parse(task.upcomingDate!).isAfter(startDate) &&
            DateTime.parse(task.upcomingDate!).isBefore(endDate))
        .toList();
    return Scaffold(
      floatingActionButton: Container(
        height: Dimention.height30 * 2,
        width: Dimention.height30 * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF6b30e0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
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
              SizedBox(
                height: Dimention.height30 * 10,
                child: Obx(
                  () {
                    return ListView.builder(
                      itemCount: _taskController.taskList.length,
                      itemBuilder: (_, index) {
                        Task task = _taskController.taskList[index];

                        if (DateTime.parse(task.upcomingDate!).isAtSameMomentAs(
                            DateTime.parse(DateFormat('yyyy-MM-dd HH:mm')
                                .format(DateTime.now())))) {
                          // DateFormat('yyyy-MM-dd HH:mm')
                          GestureDetector(
                            onTap: () {
                              _taskController
                                  .deleteTasks(_taskController.taskList[index]);
                            },
                            child: TaskBar(
                              onChanged: (p0) {
                                _taskController.isCompleted = true;
                              },
                              date: task.selectedDate.toString(),
                              title: task.title.toString(),
                              subtitle: task.startTime.toString(),
                              color: Colors.grey,
                              time: task.startTime.toString(),
                            ),
                          );
                        } else {
                          const Center(
                            child: Text(
                              "No Tasks Today",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          );
                        }

                        return Container();
                      },
                    );
                  },
                ),
              ),
              Gap(Dimention.height30),
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
                                  date: task.selectedDate.toString(),
                                  title: task.title.toString(),
                                  subtitle: difference.toString(),
                                  time: task.startTime.toString(),
                                ),
                              );
                            },
                          ),
                        )
                      : Column(
                          children: [
                            Gap(Dimention.height10),
                            Center(
                              child: SizedBox(
                                height: Dimention.height30 * 6,
                                child:
                                    Image.asset('assets/images/empty_cart.png'),
                              ),
                            ),
                            Gap(Dimention.height10),
                            const Text(
                              "You have no completed tasks yet",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            )
                          ],
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
