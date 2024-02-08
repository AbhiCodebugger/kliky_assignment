import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kliky_assignment/common/app_colors.dart';
import 'package:kliky_assignment/common/common_widget.dart';
import 'package:kliky_assignment/presentation/bloc/health_bloc.dart';
import 'package:kliky_assignment/presentation/view/heart_detail_screen.dart';
import 'package:kliky_assignment/presentation/view/heart_vitals_screen.dart';
import 'package:kliky_assignment/widget/colored_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HealthBloc>().add(FetchHealthDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: BlocConsumer<HealthBloc, HealthState>(
          listener: (context, state) {
            if (state is HealthErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
            if (state is HealthSucessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Category Fetched"),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is HealthLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HealthErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is HealthSucessState) {
              int completedDays = state.entity.dailyGoals
                      ?.toJson()
                      .values
                      .where((data) => data['goal'] == true)
                      .length ??
                  0;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Text(
                                'Your Daily \nHealth Monitor',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(18),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Icon(Icons.menu),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        buildTopContainer(size, state),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomColoredBox(
                              size: size,
                              color: kBlueBoxColor,
                              title: "Steps",
                              subtitle: "Today",
                              richText: RichText(
                                text: TextSpan(
                                  text: state.entity.steps.toString(),
                                  style: kHeadingStyle.copyWith(
                                      fontSize: 36, color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: ' Steps',
                                      style: ksmallTextStyle,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            CustomColoredBox(
                              size: size,
                              color: kBlackBoxColor,
                              title: "Last Sleep",
                              subtitle: "Asleep",
                              richText: RichText(
                                  text: TextSpan(
                                      text: state.entity.lastSleep
                                          .toString()
                                          .substring(0, 1),
                                      style: kHeadingStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                      children: [
                                    TextSpan(
                                      text: ' h ',
                                      style: ksmallTextStyle,
                                    ),
                                    TextSpan(
                                      text: state.entity.lastSleep
                                          .toString()
                                          .substring(1),
                                      style: kHeadingStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' m',
                                      style: ksmallTextStyle,
                                    )
                                  ])),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 2,
                              width: 30,
                              margin: const EdgeInsets.only(top: 4, bottom: 2),
                              color: Colors.black,
                            ),
                            Container(
                              height: 2,
                              width: 20,
                              margin: const EdgeInsets.only(bottom: 8),
                              color: Colors.black,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Your Activity Goals',
                                  style: kHeadingStyle),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Your Daily Goals',
                                                style: kMediumTextStyle),
                                            Text('Last 7 Days',
                                                style: ksmallTextStyle),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HeartDetailScreen()));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                                Icons.arrow_outward_rounded),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              text: "$completedDays/7",
                                              style: kHeadingStyle.copyWith(
                                                  fontSize: 36,
                                                  color: kBlueBoxColor),
                                              children: [
                                                TextSpan(
                                                  text: ' Achieved',
                                                  style:
                                                      ksmallTextStyle.copyWith(
                                                    color: kBlueBoxColor,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        if (state.entity.dailyGoals != null)
                                          ...state.entity.dailyGoals!
                                              .toJson()
                                              .entries
                                              .map((entry) {
                                            String day = entry.key;
                                            bool goal = entry.value['goal'];
                                            double percent =
                                                entry.value['percent'];
                                            return buildCircularIndicator(
                                              centerWidget: goal
                                                  ? const Icon(
                                                      Icons.check,
                                                      color: Colors.black,
                                                      size: 10,
                                                    )
                                                  : null,
                                              text: day[0].toUpperCase(),
                                              percent: percent,
                                            );
                                          }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'You Hit your Weekly Target',
                                              style: kMediumTextStyle,
                                            ),
                                            Text(
                                              'Oct 19 - 25',
                                              style: ksmallTextStyle,
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HeartVitalScreen(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                                Icons.arrow_outward_rounded),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No Data'));
            }
          },
        ),
      ),
    );
  }

  buildTopContainer(Size size, HealthSucessState state) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * 0.16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Heart Rate',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                RichText(
                    text: TextSpan(
                        text: state.entity.heartRate.toString(),
                        style: kHeadingStyle.copyWith(fontSize: 50),
                        children: [
                      TextSpan(
                        text: 'BPM',
                        style: ksmallTextStyle,
                      )
                    ])),
                Text(
                  'Last Measurement',
                  style: ksmallTextStyle,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/heart-rate.png',
            height: size.height * 0.12,
          ),
        ],
      ),
    );
  }
}
