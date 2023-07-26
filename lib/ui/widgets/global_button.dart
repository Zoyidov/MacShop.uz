import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 10),
              blurRadius: 30,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.white),
        ),
      ),
    );
  }
}
