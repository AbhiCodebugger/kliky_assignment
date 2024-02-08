import 'package:flutter/material.dart';
import 'package:kliky_assignment/common/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget buildHeader(
  BuildContext context, {
  required String title,
  required VoidCallback onTap,
  Widget? widget,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: onTap, icon: const Icon(Icons.arrow_back_ios_new)),
        Text(
          title,
          style: kHeadingStyle,
        ),
        widget ?? const SizedBox(),
      ],
    ),
  );
}

Widget buildCommonWidget({required String title, required Widget richText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: kMediumTextStyle),
      richText,
    ],
  );
}

Widget buildCircularIndicator({
  required String text,
  required double percent,
  Widget? centerWidget,
}) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: CircularPercentIndicator(
      radius: 10,
      backgroundColor: Colors.grey.shade200,
      center: centerWidget ?? const SizedBox(),
      footer: Text(
        text,
        style: ksmallTextStyle.copyWith(fontSize: 10),
      ),
      percent: percent,
      backgroundWidth: 2,
      lineWidth: 2,
      progressColor: Colors.green,
      circularStrokeCap: CircularStrokeCap.round,
    ),
  );
}
