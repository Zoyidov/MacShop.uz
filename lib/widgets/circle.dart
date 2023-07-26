import 'package:flutter/material.dart';

class Circles extends StatelessWidget {
  const Circles({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
          color: color,
      ),
    );
  }
}
