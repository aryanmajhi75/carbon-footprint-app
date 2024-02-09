import 'package:carbon_footprint_app/components/CustomContainer.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Eco extends StatefulWidget {
  const Eco({super.key});

  @override
  State<Eco> createState() => _EcoState();
}

class _EcoState extends State<Eco> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: ComponentData().defPad,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(screenHeight * 0.02),
            CustomContainer(
              height: 110,
              width: 390,
              color: DTprimary().onContainer,
              containerChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your footprint is : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "20K KgCO2",
                    style: TextStyle(
                      color: Color(0xffFC0505),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(screenHeight * 0.02),
            const Text(
              "Reduce footprint at home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.01),
                child: Row(
                  children: [
                    CustomContainer(
                      height: 160,
                      width: 280,
                      color: const Color(0xffD9D9D9),
                      containerChild: Padding(
                        padding: EdgeInsets.all(screenHeight * 0.01),
                        child: Row(
                          children: [
                            const Placeholder(
                              fallbackHeight: 142,
                              fallbackWidth: 142,
                            ),
                            Gap(screenHeight * 0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.25,
                                  child: const Text(
                                    maxLines: 2,
                                    "Tidbyt",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {},
                                  shape: const CircleBorder(),
                                  child:
                                      Image.asset("assets/icons/moreinfo.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(screenWidth * 0.03),
                    CustomContainer(
                      height: 160,
                      width: 280,
                      color: const Color(0xffD9D9D9),
                      containerChild: Padding(
                        padding: EdgeInsets.all(screenHeight * 0.01),
                        child: Row(
                          children: [
                            const Placeholder(
                              fallbackHeight: 142,
                              fallbackWidth: 142,
                            ),
                            Gap(screenHeight * 0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.25,
                                  child: const Text(
                                    maxLines: 2,
                                    "Watch Roll Iron",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {},
                                  shape: const CircleBorder(),
                                  child:
                                      Image.asset("assets/icons/moreinfo.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(screenHeight * 0.02),
            const Text(
              "Reduce footprint on the go",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.01),
                child: Row(
                  children: [
                    CustomContainer(
                      height: 160,
                      width: 280,
                      color: const Color(0xffD9D9D9),
                      containerChild: Padding(
                        padding: EdgeInsets.all(screenHeight * 0.01),
                        child: Row(
                          children: [
                            const Placeholder(
                              fallbackHeight: 142,
                              fallbackWidth: 142,
                            ),
                            Gap(screenHeight * 0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.25,
                                  child: const Text(
                                    maxLines: 2,
                                    "Tata Nexon EV",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {},
                                  shape: const CircleBorder(),
                                  child:
                                      Image.asset("assets/icons/moreinfo.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(screenWidth * 0.03),
                    CustomContainer(
                      height: 160,
                      width: 280,
                      color: const Color(0xffD9D9D9),
                      containerChild: Padding(
                        padding: EdgeInsets.all(screenHeight * 0.01),
                        child: Row(
                          children: [
                            const Placeholder(
                              fallbackHeight: 142,
                              fallbackWidth: 142,
                            ),
                            Gap(screenHeight * 0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.25,
                                  child: const Text(
                                    maxLines: 2,
                                    "Ather 450X EV",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {},
                                  shape: const CircleBorder(),
                                  child:
                                      Image.asset("assets/icons/moreinfo.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(screenHeight * 0.02),
            const Text(
              "Reduce footprint from appliances",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.01),
                child: Row(
                  children: [
                    CustomContainer(
                      height: 160,
                      width: 280,
                      color: const Color(0xffD9D9D9),
                      containerChild: Padding(
                        padding: EdgeInsets.all(screenHeight * 0.01),
                        child: Row(
                          children: [
                            const Placeholder(
                              fallbackHeight: 142,
                              fallbackWidth: 142,
                            ),
                            Gap(screenHeight * 0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.25,
                                  child: const Text(
                                    "Beko Washing Machine",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {},
                                  shape: const CircleBorder(),
                                  child:
                                      Image.asset("assets/icons/moreinfo.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(screenWidth * 0.03),
                    CustomContainer(
                      height: 160,
                      width: 280,
                      color: const Color(0xffD9D9D9),
                      containerChild: Padding(
                        padding: EdgeInsets.all(screenHeight * 0.01),
                        child: Row(
                          children: [
                            const Placeholder(
                              fallbackHeight: 142,
                              fallbackWidth: 142,
                            ),
                            Gap(screenHeight * 0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.25,
                                  child: const Text(
                                    maxLines: 2,
                                    "LG Eco Refrigerator",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {},
                                  shape: const CircleBorder(),
                                  child:
                                      Image.asset("assets/icons/moreinfo.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
