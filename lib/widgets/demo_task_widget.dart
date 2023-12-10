import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/utils/dimentions.dart';
import 'package:task_manager/widgets/task_bar.dart';

import '../model/task_model.dart';

class DemoTaskWidget extends StatelessWidget {
  DemoTaskWidget({super.key, required this.dayName, required this.taskList});

  final _taskController = Get.put(TaskController());

  final String dayName;
  final List<Task?> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          Task task = _taskController.taskList[index];
          // return ListTile(
          //   title: Text(taskList[index]?.title ?? ''),
          // );

          return Column(
            children: [
              Row(children: [
                Container(
                  height: 20,
                  width: 5,
                  color: Colors.cyan,
                ),
                Gap(Dimention.height10 / 2 + 3),
                Text(
                  dayName,
                  style: TextStyle(
                    fontSize: Dimention.font20 - 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              TaskBar(
                title: task.title!,
                date: task.selectedDate.toString(),
                subtitle: task.startTime.toString(),
                color: Colors.grey,
                time: task.startTime.toString(),
              ),
            ],
          );
        },
      ),
    );
  }
}
