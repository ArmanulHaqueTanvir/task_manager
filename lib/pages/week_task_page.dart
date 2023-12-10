import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/pages/add_task_page.dart';
import 'package:task_manager/utils/dimentions.dart';
import 'package:task_manager/widgets/task_bar.dart';
import 'package:task_manager/widgets/week_head.dart';

class WeekTaskPage extends StatelessWidget {
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
    DateTimeRange range = DateTimeRange(
      start: DateTime(2023, 12, 09),
      end: DateTime(2023, 12, 15),
    );

    final startDate = range.start;
    final endDate = range.end;

    var start = " ${startDate.year}-${startDate.month}-${startDate.day}";
    String end = " ${endDate.year}-${endDate.month}-${endDate.day}";
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
            // WeekHead(),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: Dimention.height20,
                  color: Colors.grey[800],
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
                Icon(
                  Icons.arrow_forward_ios,
                  size: Dimention.height20,
                  color: Colors.grey[800],
                ),
              ],
            ),

            Gap(Dimention.height20 / 2),

            Expanded(
              child: ListView.builder(
                itemCount: _taskController.taskList.length,
                itemBuilder: (_, index) {
                  Task task = _taskController.taskList[index];

                  var _dateFormate = DateFormat('EEEE')
                      .format(DateTime.parse(task.upcomingDate!));
                  var date = DateFormat('EEEE, dd-MMM-yyyy')
                      .format(DateTime.parse(task.upcomingDate!));
                  // Suppose
                  // if (task.upcommingDate == selectedDate){
                  // return YOUR TASK WIDGET})
                  // add your selected day name & there all task in task list, design as your need.

                  // return Container(
                  //   height: 300,
                  //   child: DemoTaskWidget(
                  //     dayName: date,
                  //     taskList: _taskController.taskList,
                  //   ),
                  // );

                  for (var day in days) {
                    print({'Date_Format': task.selectedDate});
                    print({'Day': day});
                    if (day == _dateFormate) {
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
                                  _dateFormate,
                                  // DateFormat('EEEE, dd-MMM-yyyy').format(
                                  //     DateTime.parse(task.upcomingDate!)),
                                  style: TextStyle(
                                    fontSize: Dimention.font20 - 4,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            // Gap(Dimention.height10),
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
                    } else if (day != _dateFormate) {
                      //
                      TaskBar(
                        title: "No Task Today",
                        subtitle: '',
                        time: '',
                        date: '',
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
