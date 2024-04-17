import "package:carbon_footprint_app/constants.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:gap/gap.dart";

class CustomMobilityTile extends StatefulWidget {
  double height;
  double width;

  CustomMobilityTile({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<CustomMobilityTile> createState() => _CustomMobilityTileState();
}

class _CustomMobilityTileState extends State<CustomMobilityTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: DTprimary().onIconCol,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      height: widget.height * 0.25,
      width: widget.width * 0.9,
      child: Padding(
        padding: ComponentData().defPad / 2,
        child: Column(
          children: [
            Gap(widget.height * 0.01),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 2,
                      color: DTprimary().onContainer,
                    ),
                  ),
                  height: widget.height * 0.1,
                  width: widget.width * 0.41,
                  padding: ComponentData().defPad / 4,
                  child: Row(
                    children: [
                      Container(
                        padding: ComponentData().defPad,
                        height: widget.height * 0.08,
                        decoration: BoxDecoration(
                          color: DTprimary().onContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/walking.png",
                          color: DTprimary().onIconCol,
                        ),
                      ),
                      Gap(widget.width * 0.01),
                      Text("data")
                    ],
                  ),
                ),
                Gap(widget.width * 0.01),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 2,
                      color: DTprimary().onContainer,
                    ),
                  ),
                  height: widget.height * 0.1,
                  width: widget.width * 0.41,
                  padding: ComponentData().defPad / 4,
                  child: Row(
                    children: [
                      Container(
                        padding: ComponentData().defPad,
                        height: widget.height * 0.08,
                        decoration: BoxDecoration(
                          color: DTprimary().onContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/running.png",
                          color: DTprimary().onIconCol,
                        ),
                      ),
                      Gap(widget.width * 0.01),
                      Text("data")
                    ],
                  ),
                ),
              ],
            ),
            Gap(widget.height * 0.01),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 2,
                      color: DTprimary().onContainer,
                    ),
                  ),
                  height: widget.height * 0.1,
                  width: widget.width * 0.41,
                  padding: ComponentData().defPad / 4,
                  child: Row(
                    children: [
                      Container(
                        height: widget.height * 0.08,
                        padding: ComponentData().defPad,
                        decoration: BoxDecoration(
                          color: DTprimary().onContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/vehicle.png",
                          color: DTprimary().onIconCol,
                        ),
                      ),
                      Gap(widget.width * 0.01),
                      Text("data")
                    ],
                  ),
                ),
                Gap(widget.width * 0.01),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 2,
                      color: DTprimary().onContainer,
                    ),
                  ),
                  height: widget.height * 0.1,
                  width: widget.width * 0.41,
                  padding: ComponentData().defPad / 4,
                  child: Row(
                    children: [
                      Container(
                        padding: ComponentData().defPad,
                        height: widget.height * 0.08,
                        decoration: BoxDecoration(
                          color: DTprimary().onContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/distance.png",
                          color: DTprimary().onIconCol,
                        ),
                      ),
                      Gap(widget.width * 0.01),
                      Text("data")
                    ],
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
