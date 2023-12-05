import 'package:flutter/material.dart';
import 'package:task_manager/pages/month_task_page.dart';
import 'package:task_manager/pages/today_task_page.dart';
import 'package:task_manager/pages/week_task_page.dart';
import 'package:task_manager/widgets/tab_head.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // bottomNavigationBar: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //   ),
        //   margin: EdgeInsets.all(10),
        //   child: BottomNavigationBar(
        //     items: const [
        //       BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.note,
        //           size: 30,
        //           color: Colors.black45,
        //         ),
        //         label: "Tasks",
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.home,
        //           size: 30,
        //           color: Colors.black45,
        //         ),
        //         label: "Routine",
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.home,
        //           size: 30,
        //           color: Colors.black45,
        //         ),
        //         label: "Home",
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.home,
        //           size: 30,
        //           color: Colors.black45,
        //         ),
        //         label: "Study Log",
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.home,
        //           size: 30,
        //           color: Colors.black45,
        //         ),
        //         label: "More",
        //       ),
        //     ],
        //   ),
        // ),
        appBar: AppBar(
          title: const Text(
            'TASK',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                  // height: 40,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: const Color(0xFFededff),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                            spreadRadius: 1,
                          )
                        ]),
                    tabs: const [
                      TabHead(
                        name: "Today",
                      ),
                      TabHead(
                        name: "Week",
                      ),
                      TabHead(
                        name: "Month",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    TodayTaskPage(),
                    WeekTaskPage(),
                    const MonthTaskPage(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:task_manager/controller/task_controller.dart';
// import 'package:task_manager/model/task_model.dart';
// import 'package:task_manager/pages/add_task_page.dart';
// import 'package:task_manager/widgets/task_bar.dart';
// import 'package:task_manager/widgets/titleNsubtitle.dart';

// class TodayTaskPage extends StatelessWidget {
//   TodayTaskPage({super.key});
//   final DateTime _selectedDate = DateTime.now();
//   final _taskController = Get.put(TaskController());
//   var notifyHealper;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFF6b30e0),
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//           size: 30,
//           weight: 100,
//         ),
//         onPressed: () async {
//           await Get.to(const AddTaskPage(), transition: Transition.fade);
//           _taskController.getTasks();
//         },
//       ),
//       backgroundColor: const Color(0xFFededff),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const TitleNSubtitle(
//               title: "ToDO",
//               subtitle: "Your pending/upcoming tasks",
//             ),
//             const Gap(10),
//             Expanded(
//               child: Obx(
//                 () {
//                   return Container(
//                     color: Colors.red,
//                     child: ListView.builder(
//                       itemCount: _taskController.taskList.length,
//                       itemBuilder: (_, index) {
//                         Task task = _taskController.taskList[index];
//                         print(_taskController.taskList.length);
//                         return GestureDetector(
//                           onTap: () {
//                             // _taskController
//                             //     .deleteTasks(_taskController.taskList[index]);
//                           },
//                           child: TaskBar(
//                             title: task.title.toString(),
//                             subtitle: task.note.toString(),
//                             time: task.startTime.toString(),
//                             date: task.startDate.toString(),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const TitleNSubtitle(
//               title: "Completed",
//               subtitle: "Your completed tasks",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
