import 'package:flutter/material.dart';
import 'package:task_manager/utils/dimentions.dart';

class TitleNSubtitle extends StatelessWidget {
  final String title, subtitle;
  const TitleNSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
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
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: Dimention.font20 - 4,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
