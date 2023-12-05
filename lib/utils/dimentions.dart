import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimention extends ChangeNotifier {
  // static double screenHeight = MediaQuery.of(context).size.height;

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // Home page page view controller
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 6.03;

  // Different heights for different pagess..
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;
  // static double height50 = screenHeight / 42.2;

  // Different heights for different pagess..
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 42.2;
  static double width50 = screenHeight / 42.2;

  // Different font sizes for different pagess
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  static double radius10 = screenHeight / 84.4;
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // Icons size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.16;

  // List view components sizes..
  static double listViewImage = screenWidth / 3.25;
  static double listViewTxtContainer = screenWidth / 3.9;

  // Popular foood Details page components sizes
  static double popularFoodImageSize = screenHeight / 2.4;
}
