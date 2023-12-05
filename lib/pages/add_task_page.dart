// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/widgets/my_button.dart';
import 'package:task_manager/widgets/text_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({
    super.key,
  });

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:21";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String initDate = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<int> remiderMeList = <int>[
    5,
    10,
    15,
    20,
    25,
    30,
  ];
  int _selectedRemind = 5;

  List<String> remiderType = <String>[
    'Notification',
    'Call',
    'Mail',
  ];
  String remider_type = "Mail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f7),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xfff2f2f7),
        title: const Text(
          "Create a new task",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldWithTitle(
                controller: titleController,
                title: "Task Title",
                hint: "Write your task in minimal words",
              ),
              const Gap(10),
              TextFieldWithTitle(
                controller: descriptionController,
                title: "Description (optional)",
                hint: "You can write here task details.\n But it’s optional",
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: TextFieldWithTitle(
                      controller: dateController,
                      widget: IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: () {
                          setState(() {
                            _getdateFromUser();
                          });
                        },
                      ),
                      title: "Start Date",
                      hint: DateFormat('dd-MMM-yyyy').format(_selectedDate),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: TextFieldWithTitle(
                      controller: timeController,
                      widget: IconButton(
                        icon: const Icon(Icons.access_alarm),
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                      ),
                      title: "Start Time",
                      hint: _startTime,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: TextFieldWithTitle(
                      title: "Remind Me",
                      hint: "$_selectedRemind minutes before",
                      widget: DropdownButton(
                        onChanged: (value) {
                          setState(() {
                            _selectedRemind = int.parse(value!);
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 32,
                        elevation: 4,
                        underline: Container(height: 0),
                        items: remiderMeList
                            .map<DropdownMenuItem<String>>((int value) {
                          return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: TextFieldWithTitle(
                      title: "Remind Type",
                      hint: remider_type,
                      widget: DropdownButton(
                        onChanged: (String? value) {
                          setState(() {
                            remider_type = value!;
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 32,
                        elevation: 4,
                        underline: Container(height: 0),
                        items: remiderType
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Repeat",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(10),
                  Row(
                    children: [
                      myButton(
                        size: 100,
                        bgcolor: Color(0xff6b30e0),
                        fontColor: Colors.white,
                        text: "Once",
                      ),
                      myButton(
                        size: 100,
                        bgcolor: Colors.white,
                        fontColor: Colors.black,
                        text: "Daily",
                      ),
                      myButton(
                        size: 100,
                        bgcolor: Colors.white,
                        fontColor: Colors.black,
                        text: "Custom",
                      ),
                    ],
                  )
                ],
              ),
              const Gap(10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Priority",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(7),
                  Row(
                    children: [
                      myButton(
                        size: 100,
                        bgcolor: Color(0xff6b30e0),
                        fontColor: Colors.white,
                        text: "Normal",
                      ),
                      myButton(
                        size: 100,
                        bgcolor: Colors.white,
                        fontColor: Colors.black,
                        text: "High",
                      ),
                    ],
                  )
                ],
              ),
              const Gap(50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _validateData();
                        _taskController.getTasks();
                      });
                      // _taskController.addTask();
                    },
                    child: const myButton(
                      size: 150,
                      bgcolor: Color(0xff6b30e0),
                      fontColor: Colors.white,
                      text: "Save",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const myButton(
                      size: 150,
                      fontColor: Color(0xff6b30e0),
                      bgcolor: Colors.white,
                      text: "Cancel",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateData() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      _addTaskToDB(); // add data to Database
      Get.back();

      Get.snackbar(
        "Successfully",
        "Successfully Added",
        duration: const Duration(seconds: 1),
        isDismissible: true,
      );
    } else if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      //
      Get.snackbar(
        "Required",
        "All fields are required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 206, 66, 56),
        icon: const Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
        duration: const Duration(seconds: 1),
      );
    }
  }

  _addTaskToDB() async {
    int? value = await _taskController.addTaskToDB(
      task: Task(
        title: titleController.text,
        description: descriptionController.text,
        selectedDate: DateFormat('dd-MMM-yyyy').format(DateTime.now()),
        startTime: _startTime,
        remind: _selectedRemind,
        isCompleted: 0,
        initDate: initDate,
      ),
    );
  }

  _getdateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      const Text("MM/dd/yyyy");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    // ignore: no_leading_underscores_for_local_identifiers
    dynamic _formatedTime = await pickedTime;

    if (pickedTime == null) {
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    }
  }

  _showTimePicker() async {
    return await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}
