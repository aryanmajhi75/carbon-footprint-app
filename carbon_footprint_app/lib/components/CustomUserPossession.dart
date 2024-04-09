import 'package:carbon_footprint_app/components/CustomContainer.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomPossession extends StatefulWidget {
  String name;
  String model;
  String uniqueNum;
  int yearsOld;
  String type;

  CustomPossession({
    super.key,
    required this.model,
    required this.name,
    required this.uniqueNum,
    required this.yearsOld,
    required this.type,
  });

  @override
  State<CustomPossession> createState() => _CustomPossessionState();
}

class _CustomPossessionState extends State<CustomPossession> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return CustomContainer(
      height: screenHeight * 0.3,
      width: screenWidth * 0.9,
      // color: DTprimary().onContainer,
      color: DTprimary().onBody,
      borderCol: const Color(0xFFEEB004),
      containerChild: Padding(
        padding: ComponentData().defPad / 2,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widget.type == "vehicle"
                    ? Image.asset(
                        "assets/icons/vehicle.png",
                        color: const Color(0xFFEEB004),
                      )
                    : Image.asset(
                        "assets/icons/appliance.png",
                        color: const Color(0xFFEEB004),
                      ),
                Gap(screenWidth * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Model",
                      style: TextStyle(
                        color: DTprimary().white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.model,
                      style: TextStyle(
                        color: DTprimary().white,
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        color: DTprimary().white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: DTprimary().white,
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Color(0xFFEEB004),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Identification\nNumber",
                      style: TextStyle(
                        color: DTprimary().white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.uniqueNum,
                      style: TextStyle(
                        color: DTprimary().white,
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Text(
                  widget.yearsOld.toString(),
                  style: TextStyle(
                    color: DTprimary().white,
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
