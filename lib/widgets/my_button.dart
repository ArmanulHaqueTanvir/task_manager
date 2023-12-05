import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(left: 5, right: 5),
      padding: const EdgeInsets.all(5),
      width: size,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: fontColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
