import 'package:flutter/material.dart';
import 'package:task_manager/pages/month_task_page.dart';
import 'package:task_manager/pages/today_task_page.dart';
import 'package:task_manager/pages/week_task_page.dart';
import 'package:task_manager/utils/dimentions.dart';
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
          toolbarHeight: Dimention.height20 * 2,
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
