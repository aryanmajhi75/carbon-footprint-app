import 'package:carbon_footprint_app/components/CustomContainer.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: ComponentData().defPad,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(screenHeight * 0.03),
            FloatingActionButton(
              onPressed: () {},
              child: Image.asset("assets/icons/refresh.png"),
            ),
            Gap(screenHeight * 0.03),
            CircularPercentIndicator(
              radius: screenWidth * 0.4,
              lineWidth: 13.0,
              animation: true,
              percent: 0.7,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: DTsecondary().onCircularLoader,
              progressColor: DTprimary().onCircularLoader,
              center: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "250 K",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "KgCO2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Gap(screenHeight * 0.03),
            CustomContainer(
              height: screenHeight * 0.12,
              width: screenWidth * 0.9,
              color: DTprimary().onContainer,
              containerChild: Row(
                children: [
                  Gap(screenWidth * 0.02),
                  CustomContainer(
                    height: screenHeight * 0.1,
                    width: screenHeight * 0.1,
                    color: DTprimary().onBody,
                    containerChild: Image.asset(
                      "assets/icons/soothingenv.png",
                    ),
                  ),
                  Gap(screenWidth * 0.02),
                  CustomContainer(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.6,
                    color: Colors.transparent,
                    containerChild: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "more than 45% of people in your area",
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
