import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/utils/dimentions.dart';

// ignore: must_be_immutable
class TextFieldWithTitle extends StatelessWidget {
  final String title, hint;
  final Widget? widget;
  TextEditingController? controller;
  TextFieldWithTitle({
    super.key,
    required this.title,
    required this.hint,
    this.widget,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: Dimention.font20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(6),
        Container(
          padding:
              const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  autocorrect: true,
                  controller: controller,
                  decoration: InputDecoration(
                      suffixIcon: widget,
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: Dimention.font20 - 4,
                      )),
                  style: TextStyle(
                    fontSize: Dimention.font20 - 2,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
