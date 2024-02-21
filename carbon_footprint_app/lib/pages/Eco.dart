import 'package:carbon_footprint_app/components/CustomContainer.dart';
import 'package:carbon_footprint_app/components/CustomHList.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/dataClasses/listTileData.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Eco extends StatefulWidget {
  const Eco({super.key});

  @override
  State<Eco> createState() => _EcoState();
}

class _EcoState extends State<Eco> {
  List<listTileData> homeList = [
    listTileData(
      'Tidbyt',
      'assets/images/tidbyt.png',
      'assets/icons/moreinfo.png',
    ),
    listTileData(
      'Watch Roll Iron',
      'assets/images/watchrolliron.png',
      'assets/icons/moreinfo.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: ComponentData().defPad,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(screenHeight * 0.02),
              CustomContainer(
                height: screenHeight * 0.15,
                width: screenWidth * 0.9,
                color: DTprimary().onContainer,
                containerChild: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
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
                        "250K KgCO2",
                        style: TextStyle(
                          color: Color(0xffFC0505),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
              SizedBox(
                height: screenHeight * 0.25,
                width: screenWidth,
                child: CustomHList(
                  ListChildren: homeList,
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
              SizedBox(
                height: screenHeight * 0.25,
                width: screenWidth,
                child: CustomHList(
                  ListChildren: homeList,
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
              SizedBox(
                height: screenHeight * 0.25,
                width: screenWidth,
                child: CustomHList(
                  ListChildren: homeList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
