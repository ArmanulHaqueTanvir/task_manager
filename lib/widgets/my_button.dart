import 'package:flutter/material.dart';
import 'package:task_manager/utils/dimentions.dart';

class myButton extends StatelessWidget {
  final double size;
  final Color bgcolor, fontColor;
  final String text;
  const myButton({
    super.key,
    required this.size,
    required this.bgcolor,
    required this.fontColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimention.height10 / 2, right: Dimention.height10 / 2),
      padding: EdgeInsets.all(Dimention.height10 / 2),
      width: size,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Dimention.font20 - 2,
          color: fontColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
