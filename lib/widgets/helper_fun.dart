// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_manager/controller/task_controller.dart';

// class HelperFunction {

//    final TaskController _taskController = Get.put(TaskController());
//   DateTime _selectedDate = DateTime.now();
//   String _endTime = "9:21";
//   String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController timeController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   static  _validateData() {
//     if (titleController.text.isNotEmpty &&
//         descriptionController.text.isNotEmpty) {
// // add to data base
//       Get.back();
//       _addTaskToDB();
//       // _taskController.addTask();
//       Get.snackbar(
//         "Successfully",
//         "Successfully Added",
//         duration: const Duration(seconds: 1),
//         isDismissible: true,
//       );
//     } else if (titleController.text.isEmpty ||
//         descriptionController.text.isEmpty) {
//       //
//       Get.snackbar(
//         "Required",
//         "All fields are required",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color.fromARGB(255, 206, 66, 56),
//         icon: const Icon(Icons.warning, color: Colors.white),
//         colorText: Colors.white,
//         duration: const Duration(seconds: 1),
//       );
//     }
//   }
// }