import 'package:carbon_footprint_app/components/CustomContainer.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class You extends StatefulWidget {
  const You({super.key});

  @override
  State<You> createState() => _YouState();
}

class _YouState extends State<You> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 5,
        backgroundColor: DTsecondary().onNavbarIconBg,
        child: Icon(
          Icons.add_rounded,
          color: DTprimary().onBody,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: ComponentData().defPad,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/icons/profile.png",
                    height: 100,
                    width: 100,
                  ),
                  Gap(screenHeight * 0.01),
                  Text(
                    "Hi Aryan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CustomContainer(
                height: screenHeight * 0.35,
                width: screenWidth * 0.9,
                color: DTprimary().onContainer,
                containerChild: Padding(
                  padding: ComponentData().defPad,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Bio",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      Divider(
                        endIndent: 20,
                        indent: 20,
                        thickness: 2,
                        color: DTprimary().onBody,
                      ),
                      Text(
                        "Gender : Male",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Age : 35",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "User Diet",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      Divider(
                        endIndent: 20,
                        indent: 20,
                        thickness: 2,
                        color: DTprimary().onBody,
                      ),
                      Text(
                        "Meat Comsumption : Sometimes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Dairy Consumption : Sometimes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(screenHeight * 0.01),
              Divider(
                endIndent: 10,
                indent: 10,
                thickness: 3,
                color: DTprimary().onContainer,
              ),
              Text(
                "Your Vehicles",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              CustomContainer(
                height: screenHeight * 0.2,
                width: screenWidth * 0.9,
                color: DTprimary().onContainer,
                containerChild: Column(
                  children: [
                    Row(
                      children: [
                        Placeholder(
                          fallbackHeight: screenHeight * 0.2,
                          fallbackWidth: screenWidth * 0.45,
                        ),
                        Gap(screenWidth * 0.03),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Model",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "XMA",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(
                              endIndent: 5,
                              indent: 5,
                              thickness: 2,
                              color: Colors.white,
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "TATA NEXON",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
