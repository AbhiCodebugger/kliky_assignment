import 'package:flutter/material.dart';
import 'package:kliky_assignment/common/app_colors.dart';

class CustomColoredBox extends StatelessWidget {
  const CustomColoredBox({
    super.key,
    required this.size,
    required this.color,
    required this.title,
    required this.richText,
    required this.subtitle,
  });

  final Size size;
  final Color color;
  final String title;
  final Widget richText;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height * 0.16,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: kMediumTextStyle.copyWith(color: Colors.white),
            ),
            richText,
            Text(
              subtitle,
              style: ksmallTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
