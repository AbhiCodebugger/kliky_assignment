import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:kliky_assignment/common/app_colors.dart';
import 'package:kliky_assignment/common/common_widget.dart';

class HeartDetailScreen extends StatelessWidget {
  const HeartDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data = [-3.0, 8.0, -10.0, 15.0, -8.0, 8.0, -6.0, 6.0, -0.5, -7.0, 7.0];
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          buildHeader(
            context,
            title: "Heart Rate Details",
            widget: null,
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
                    const Text("Heart Rate",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    const Spacer(),
                    const Icon(Icons.more_horiz)
                  ],
                ),
                const SizedBox(height: 10),
                RichText(
                    text: const TextSpan(
                        text: "99-112",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        children: [
                      TextSpan(
                        text: ' BPM',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ])),
                const Text(
                  "Average Today",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: size.height * 0.2,
                  width: size.width,
                  child: Sparkline(
                    lineColor: Colors.red,
                    enableGridLines: true,
                    data: data,
                  ),
                ),
                SizedBox(
                  height: 24,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      int hour = 6 + index * 2;
                      String time = '$hour AM';
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(time,
                            style: kMediumTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            )),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCommonWidget(
                      title: "Average",
                      richText: RichText(
                          text: TextSpan(
                              text: "69",
                              style: kHeadingStyle.copyWith(
                                fontSize: 26,
                              ),
                              children: [
                            TextSpan(
                              text: ' BPM',
                              style: ksmallTextStyle,
                            ),
                          ])),
                    ),
                    buildCommonWidget(
                      title: "Max",
                      richText: RichText(
                          text: TextSpan(
                              text: "78",
                              style: kHeadingStyle.copyWith(
                                fontSize: 26,
                              ),
                              children: [
                            TextSpan(
                              text: ' BPM',
                              style: ksmallTextStyle,
                            ),
                          ])),
                    ),
                    buildCommonWidget(
                      title: "Min",
                      richText: RichText(
                          text: TextSpan(
                              text: "60",
                              style: kHeadingStyle.copyWith(
                                fontSize: 26,
                              ),
                              children: [
                            TextSpan(
                              text: ' BPM',
                              style: ksmallTextStyle,
                            ),
                          ])),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      margin:
                          const EdgeInsets.only(left: 12, right: 12, top: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Awake",
                            style: kMediumTextStyle,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "60",
                                  style: kHeadingStyle.copyWith(fontSize: 26),
                                  children: [
                                TextSpan(
                                  text: ' BPM',
                                  style: ksmallTextStyle,
                                ),
                              ])),
                        ],
                      ),
                    );
                  }))
        ],
      )),
    );
  }
}
