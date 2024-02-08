import 'package:flutter/material.dart';
import 'package:kliky_assignment/common/app_colors.dart';
import 'package:kliky_assignment/common/common_widget.dart';

class HeartVitalScreen extends StatelessWidget {
  const HeartVitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          buildHeader(
            context,
            title: "Heart & Vitals",
            widget: const Icon(Icons.more_horiz),
            onTap: () => Navigator.pop(context),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/heart.jpg",
                            height: 50,
                          ),
                        )),
                    Text("Preceding 7 Days HR", style: kMediumTextStyle),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: size.height * 0.2,
                  width: size.width,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 50,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        Text("Average", style: kMediumTextStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 50,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        Text("Min", style: kMediumTextStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 50,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        Text("Max", style: kMediumTextStyle),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Health Notification",
                          style: kMediumTextStyle,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "40",
                                style: kHeadingStyle.copyWith(fontSize: 50),
                                children: [
                              TextSpan(
                                text: ' Recorded',
                                style: ksmallTextStyle,
                              ),
                            ])),
                        Text(
                          'Low Heart Rate Alert',
                          style: ksmallTextStyle,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
