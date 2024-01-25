import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/pages/add_task_page.dart';
import 'package:task_manager/utils/dimentions.dart';
import 'package:task_manager/widgets/task_bar.dart';
import 'package:task_manager/widgets/weekChangeBtn.dart';

class WeekTaskPage extends StatelessWidget {
  //
  final DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());

  WeekTaskPage({super.key});

  List days = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  @override
  Widget build(BuildContext context) {
    //

    DateTime now = DateTime.now();

    DateTime startOfWeek = DateTime.utc(now.year, now.month, now.day);
    int daysUntilSaturday = DateTime.saturday - startOfWeek.weekday;
    startOfWeek = startOfWeek.add(Duration(days: daysUntilSaturday));

    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));

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
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
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
      backgroundColor: const Color(0xFFededff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gap(Dimention.height10 /),

            // Weak custom head
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                weekChangeBtn(
                  icon: Icons.arrow_back_ios,
                  onTap: () {},
                ),
                Column(
                  children: [
                    Text(
                      "Saturday - Friday",
                      style: TextStyle(
                        fontSize: Dimention.font20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(Dimention.height10 / 2 - 3),
                    Text(
                      // "09-Dec-2023 to 15-Dec-2023",
                      "${startDate.year}-${startDate.month}-${startDate.day} to ${endDate.year}-${endDate.month}-${endDate.day}",
                      style: TextStyle(
                        fontSize: Dimention.font20 / 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                weekChangeBtn(
                  icon: Icons.arrow_forward_ios,
                  onTap: () {},
                ),
              ],
            ),

            Gap(Dimention.height20 / 2),

            Expanded(
              child: ListView.builder(
                itemCount: _taskController.taskList.length,
                itemBuilder: (_, index) {
                  Task task = _taskController.taskList[index];

                  // var _dayFormate = DateFormat('EEEE')
                  //     .format(DateTime.parse(task.upcomingDate!));

                  var date = DateFormat('EEEE, dd-MMM-yyyy')
                      .format(DateTime.parse(task.upcomingDate!));

                  if (DateTime.parse(task.upcomingDate!).isAfter(startDate) &&
                      DateTime.parse(task.upcomingDate!).isBefore(endDate)) {
                    return GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Column(
                        children: [
                          Gap(Dimention.height10),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 5,
                                color: Colors.cyan,
                              ),
                              Gap(Dimention.height10 / 2 + 3),
                              Text(
                                date,
                                style: TextStyle(
                                  fontSize: Dimention.font20 - 4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TaskBar(
                            onChanged: (p0) {
                              _taskController.isCompleted = true;
                            },
                            date: task.selectedDate.toString(),
                            title: task.title.toString(),
                            subtitle: task.startTime.toString(),
                            color: Colors.grey,
                            time: task.startTime.toString(),
                          ),
                        ],
                      ),
                    );
                  } else {
                    TaskBar(
                      onChanged: (p0) {
                        _taskController.isCompleted = true;
                      },
                      date: task.selectedDate.toString(),
                      title: "No Tasks Available",
                      subtitle: task.startTime.toString(),
                      color: Colors.grey,
                      time: task.startTime.toString(),
                    );
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
