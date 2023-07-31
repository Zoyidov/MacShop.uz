import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';


class CustomCircularProgressIndicator extends StatelessWidget {
  final double? strokeWidth;

  const CustomCircularProgressIndicator({
    super.key,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (strokeWidth == 4.0 || strokeWidth == null) {
      return CupertinoActivityIndicator(
        radius: 20,
        color: Colors.white,
      );
    } else {
      return CupertinoActivityIndicator(
        radius: 20,
        color: Colors.white,
      );
    }
  }
}
