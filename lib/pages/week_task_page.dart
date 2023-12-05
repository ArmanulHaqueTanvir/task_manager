import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/pages/add_task_page.dart';
import 'package:task_manager/widgets/task_bar.dart';
import 'package:task_manager/widgets/titleNsubtitle.dart';

class WeekTaskPage extends StatelessWidget {
  final DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  WeekTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
            const TitleNSubtitle(
              title: "ToDO",
              subtitle: "Your pending/upcoming tasks",
            ),
            const Gap(10),
            _taskController.taskList != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _taskController.taskList.length,
                      itemBuilder: (_, index) {
                        Task task = _taskController.taskList[index];
                        print(_taskController.taskList.length);
                        return GestureDetector(
                          onTap: () {
                            // _taskController
                            //     .deleteTasks(_taskController.taskList[index]);
                          },
                          child: TaskBar(
                            title: task.title.toString(),
                            subtitle: task.description.toString(),
                            time: task.startTime.toString(), date: '',
                            // date: task.startDate.toString(),
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Container(
                      height: 100,
                      color: Colors.black,
                    ),
                  ),
            const TitleNSubtitle(
              title: "Completed",
              subtitle: "Your completed tasks",
            ),
          ],
        ),
      ),
    );
  }
}
