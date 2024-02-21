import 'package:carbon_footprint_app/constants.dart';
import 'package:flutter/material.dart';

class CustomUserDataCard extends StatefulWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String data1;
  final String data2;
  const CustomUserDataCard({
    super.key,
    required this.subtitle1,
    required this.subtitle2,
    required this.data1,
    required this.data2,
    required this.title,
  }) : super();

  @override
  State<CustomUserDataCard> createState() => _CustomUserDataCardState();
}

class _CustomUserDataCardState extends State<CustomUserDataCard> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.1,
      width: screenWidth * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: DTprimary().onIconCol,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.title != "Consumption"
                  ? RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              Column(
                children: [
                  Text(
                    "${widget.subtitle1} : ${widget.data1}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${widget.subtitle2} : ${widget.data2}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
