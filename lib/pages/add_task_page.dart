// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/utils/dimentions.dart';
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
  // ALl controller variables here....
  final TaskController _taskController = Get.put(TaskController());
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  // Date time all variables
  DateTime _selectedDate = DateTime.now();
  // String _endTime = "9:21";
  var _startTime = DateFormat.jm().format(DateTime.timestamp());
  DateTime upcomingDateFormate = DateTime.now();

  bool priority = false;

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
        toolbarHeight: Dimention.height20 * 2,
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
              Gap(Dimention.height20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: TextFieldWithTitle(
                      title: "Remind Me",
                      hint: "$_selectedRemind min before",
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
              Gap(Dimention.height20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Repeat",
                    style: TextStyle(
                      fontSize: Dimention.font20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(Dimention.height10),
                  Row(
                    children: [
                      myButton(
                        size: Dimention.width30 * 3,
                        bgcolor: const Color(0xff6b30e0),
                        fontColor: Colors.white,
                        text: "Once",
                      ),
                      myButton(
                        size: Dimention.width30 * 3,
                        bgcolor: Colors.white,
                        fontColor: Colors.black,
                        text: "Daily",
                      ),
                      myButton(
                        size: Dimention.width30 * 3,
                        bgcolor: Colors.white,
                        fontColor: Colors.black,
                        text: "Custom",
                      ),
                    ],
                  )
                ],
              ),
              Gap(Dimention.height10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Priority",
                    style: TextStyle(
                      fontSize: Dimention.font20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(Dimention.height10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: myButton(
                          size: Dimention.width30 * 3,
                          bgcolor: const Color(0xff6b30e0),
                          fontColor: Colors.white,
                          text: "Normal",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            priority = true;
                          });
                        },
                        child: myButton(
                          size: Dimention.width30 * 3,
                          bgcolor: Colors.white,
                          fontColor: Colors.black,
                          text: "High",
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Gap(Dimention.height30 + Dimention.height20),
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
                    child: myButton(
                      size: Dimention.height30 * 5,
                      bgcolor: const Color(0xff6b30e0),
                      fontColor: Colors.white,
                      text: "Save",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: myButton(
                      size: Dimention.height30 * 5,
                      fontColor: const Color(0xff6b30e0),
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
        selectedDate: DateFormat('dd-MMM-yyyy').format(_selectedDate),
        startTime: _startTime,
        remind: _selectedRemind,
        isCompleted: 0,
        upcomingDate: DateFormat('yyyy-MM-dd HH:mm')
            .format(DateTime.parse(_selectedDate.toString())),
        // priority: priority,
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
        _selectedDate = _pickerDate!;
      });
      _pickerDate = DateTime.parse(upcomingDateFormate.toString());
    } else {
      const Text("MM/dd/yyyy");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    try {
      String pickedTime = await _showTimePicker();
      // ignore: no_leading_underscores_for_local_identifiers
      String _formatedTime = await pickedTime;
      if (pickedTime == null) {
      } else if (isStartTime == true) {
        setState(() {
          _startTime = _formatedTime.toString();
        });
        _formatedTime = upcomingDateFormate.toString();
      }
    } catch (e) {
      print(e);
    }
  }

  _showTimePicker() async {
    return await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}
