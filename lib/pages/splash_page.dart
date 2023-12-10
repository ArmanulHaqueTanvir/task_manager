import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/pages/home_page.dart';
import 'package:task_manager/utils/dimentions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    final _taskController = Get.put(TaskController());
    _taskController.getTasks();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );

    Timer(
      const Duration(seconds: 2),
      () => Get.to(const MyHomePage()),
    );

    _loadResources();
  }

  // @override
  // void dispose() async {
  //   // TODO: implement dispose
  //   return super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.purple,
            ),
            Gap(Dimention.height20),
            const Text(
              "Loading...",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
