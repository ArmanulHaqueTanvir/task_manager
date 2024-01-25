// ignore_for_file: must_be_immutable, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/model/task_model.dart';

import '../utils/dimentions.dart';

class WeekHead extends StatelessWidget {
  WeekHead({
    super.key,
  });
  final _taskController = Get.put(TaskController());

  // DateTimeRange range = DateTimeRange(
  //   start: DateTime(2023, 12, 09),
  //   end: DateTime(2023, 12, 15),
  // );

  @override
  Widget build(BuildContext context) {
    // DateTimeRange calculateWeekRange() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = DateTime.utc(now.year, now.month, now.day);
    int daysUntilSaturday = DateTime.saturday - startOfWeek.weekday;
    startOfWeek = startOfWeek.add(Duration(days: daysUntilSaturday));

    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));

    DateTimeRange range = DateTimeRange(start: startOfWeek, end: endOfWeek);
    // }

// -------------------

    // DateTimeRange range = DateTimeRange(
    //   start: DateTime(2023, 12, 09),
    //   end: DateTime(2023, 12, 15),
    // );

    final startDate = range.start;
    final endDate = range.end;

    var start = "${startDate.year}-${startDate.month}-${startDate.day}";
    String end = " ${endDate.year}-${endDate.month}-${endDate.day}";
// ----------------
    List<Task> filteredTasks = _taskController.taskList
        .where((task) =>
            DateTime.parse(task.upcomingDate!).isAfter(startDate) &&
            DateTime.parse(task.upcomingDate!).isBefore(endDate))
        .toList();

    // Task task = _taskController.taskList[index];

    // DateTime startFormate =
    //     DateTime.parse(DateFormat('dd-MMM-yyyy').format(startDate));
    // DateTime endFormate =
    //     DateTime.parse(DateFormat('dd-MMM-yyyy').format(endDate));
    return Row(
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
    );
  }
}
