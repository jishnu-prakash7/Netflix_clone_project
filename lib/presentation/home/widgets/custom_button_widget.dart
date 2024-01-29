import 'package:flutter/material.dart';
import 'package:netflix_clone_new/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.icon,
    this.iconSize = 28,
    this.textSize = 17,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        )
      ],
    );
  }
}
