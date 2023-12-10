import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/pages/splash_page.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // getPages: RouterHealper.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
