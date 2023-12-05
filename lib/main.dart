import 'package:flutter/material.dart';
import 'package:task_manager/database/db_helper.dart';
import 'package:task_manager/task_manager_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  // await GetStorage.init();
  runApp(
    const TaskManagerApp(),
  );
}
