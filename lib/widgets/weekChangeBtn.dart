import 'package:flutter/material.dart';
import 'package:task_manager/utils/dimentions.dart';

class weekChangeBtn extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;

  weekChangeBtn({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: Dimention.height20,
        color: Colors.grey[800],
      ),
    );
  }
}
