import 'package:flutter/material.dart';

class TabHead extends StatelessWidget {
  final String name;
  const TabHead({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
