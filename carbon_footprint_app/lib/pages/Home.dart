import 'package:carbon_footprint_app/components/CustomContainer.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

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
      child: Column(
        children: [
          Gap(screenHeight * 0.2),
          Row(
            children: [
              Gap(screenHeight * 0.02),
              FloatingActionButton(
                onPressed: () {},
                child: Image.asset("assets/icons/refresh.png"),
              ),
            ],
          ),
          Gap(screenHeight * 0.03),
          Stack(
            children: [
              Container(
                height: screenHeight * 0.35,
                width: screenHeight * 0.35,
                color: Colors.transparent,
                child: CircularProgressIndicator(
                  backgroundColor: DTsecondary().onCircularLoader,
                  value: 85 * 0.01,
                  valueColor:
                      AlwaysStoppedAnimation(DTprimary().onCircularLoader),
                  strokeWidth: 15,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Positioned(
                top: screenHeight * 0.1,
                left: screenWidth * 0.15,
                child: Column(
                  children: [
                    Text(
                      "250 K",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
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
            ],
          ),
          Gap(screenHeight * 0.03),
          CustomContainer(
            height: 100,
            width: 390,
            color: DTprimary().onContainer,
            containerChild: Row(
              children: [
                Gap(screenWidth * 0.02),
                CustomContainer(
                  height: 65,
                  width: 65,
                  color: DTprimary().onBody,
                  containerChild: Image.asset(
                    "assets/icons/soothingenv.png",
                  ),
                ),
                Gap(screenWidth * 0.02),
                CustomContainer(
                  height: 90,
                  width: 280,
                  color: Colors.transparent,
                  containerChild: Text(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
