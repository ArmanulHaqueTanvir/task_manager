import 'package:get/get.dart';
import 'package:task_manager/database/db_helper.dart';
import 'package:task_manager/model/task_model.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;
  bool isCompleted = false;

  Future<int?> addTaskToDB({required Task task}) async {
    return await DBHelper.insert(task);
  }

  Future<void> addTask({Task? task}) async {
    return taskList.add(task!);
    // getTasks();
  }

  void getTasks() async {
    List<Map<String, Object?>>? tasks = await DBHelper.query();
    if (tasks != null) {
      taskList.assignAll(tasks.map((data) => Task.fromJSON(data)).toList());
    } else {
      print('No tasks found or an error occurred while fetching tasks');
    }
  }

  void deleteTasks(Task task) async {
    var val = await DBHelper.delete(task);
    print(val);
    getTasks();
  }

  void markTaskasComplete(int id) async {
    DBHelper.update(id);
    getTasks();
  }
}
