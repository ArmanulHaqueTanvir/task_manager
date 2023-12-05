// import 'package:get/get.dart';
// import 'package:task_manager/pages/home_page.dart';

// class RouterHealper {
//   static const String initial = "/";
//   static const String addTaskPage = "/addTaskPage";

//   static String getInitial() => initial;
//   static String getAddTaskPage(int pageId) => "$addTaskPage?pageId=$pageId";

//   static List<GetPage> routes = [
//     GetPage(
//       name: initial,
//       page: () => const MyHomePage(),
//     ),
//     GetPage(
//       name: addTaskPage,
//       page: () {
//         var pageId = Get.parameters['pageId'];
//         return getAddTaskPage(String.parse(pageId!));
//       },
//       transition: Transition.rightToLeft,
//     ),
//   ];
// }
