// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/utils/dimentions.dart';

class TaskBar extends StatelessWidget {
  final String title, subtitle, time, date;
  final Color? color;
  DateTime nowTime = DateTime.now();

  bool? isCompleted;
  void Function(bool?)? onChanged;
  TaskBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.date,
    this.onChanged,
    this.color,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimention.height10 / 2),
      padding: EdgeInsets.only(
        left: Dimention.height10 / 1.5,
        right: Dimention.height10 / 1.5,
        top: Dimention.height10 / 2,
        bottom: Dimention.height10 / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: false,
                onChanged: onChanged,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimention.font20 - 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(Dimention.height10 / 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w400,
                      fontSize: Dimention.font20 - 4,
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimention.font20 - 2,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: Dimention.font20 - 6,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
