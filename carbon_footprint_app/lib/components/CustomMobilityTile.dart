import "package:carbon_footprint_app/constants.dart";
import "package:fl_chart/fl_chart.dart";
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
  int touchedIndex = 0;

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: DTprimary().Pie1,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/walking.png',
              size: widgetSize,
              borderColor: DTprimary().onBody,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: DTprimary().Pie2,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/running.png',
              size: widgetSize,
              borderColor: DTprimary().onBody,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: DTprimary().Pie3,
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/vehicle.png',
              size: widgetSize,
              borderColor: DTprimary().onBody,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: DTprimary().Pie4,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/distance.png',
              size: widgetSize,
              borderColor: DTprimary().onBody,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: DTprimary().onIconCol,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      height: widget.height * 0.5,
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
            Gap(widget.height * 0.02),
            SizedBox(
              height: widget.height * 0.2,
              width: widget.width * 0.9,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: showingSections(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.asset, {
    required this.size,
    required this.borderColor,
  });
  final String asset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image.asset(asset),
      ),
    );
  }
}
