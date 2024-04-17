import "package:carbon_footprint_app/components/CustomContainer.dart";
import "package:carbon_footprint_app/components/CustomMobilityTile.dart";
import "package:carbon_footprint_app/constants.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:gap/gap.dart";

class Stat extends StatefulWidget {
  const Stat({super.key});

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  LineChartBarData get list1 => LineChartBarData(
        color: const Color(0xFF048AF8),
        barWidth: 2,
        isCurved: true,
        spots: list1Data,
      );
  LineChartBarData get list2 => LineChartBarData(
        color: const Color(0xFFF80404),
        barWidth: 2,
        isCurved: true,
        spots: list2Data,
      );

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: const Color(0xFFF80404),
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + 0.2,
          toY: pilates + 0.2 + quickWorkout,
          color: const Color(0xFF04F8EC),
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + 0.2 + quickWorkout + 0.2,
          toY: pilates + 0.2 + quickWorkout + 0.2 + cycling,
          color: const Color(0xFF048AF8),
          width: 5,
        ),
      ],
    );
  }

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: ComponentData().defPad,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(screenHeight * 0.02),
                  const Text(
                    "Mobility History",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Gap(screenHeight * 0.02),
                  Center(
                    child: CustomMobilityTile(
                      height: screenHeight,
                      width: screenWidth,
                    ),
                  ),
                  Gap(screenHeight * 0.02),
                  CustomContainer(
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.9,
                    borderCol: DTprimary().onContainer,
                    color: DTprimary().onContainer,
                    containerChild: Padding(
                      padding: ComponentData().defPad,
                      child: SizedBox(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.9,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
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
                    ),
                  ),
                  Gap(screenHeight * 0.02),
                  const Text(
                    "Model Paramter Comparison",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Gap(screenHeight * 0.02),
                  Center(
                    child: CustomContainer(
                      height: screenHeight * 0.4,
                      width: screenWidth * 0.9,
                      borderCol: DTprimary().onContainer,
                      color: DTprimary().onContainer,
                      containerChild: Padding(
                        padding: ComponentData().defPad,
                        child: LineChart(
                          // curve: Easing.legacyAccelerate,
                          // duration: Duration(seconds: 2),
                          LineChartData(
                            maxX: 6,
                            maxY: 750,
                            minX: 0,
                            minY: 0,
                            titlesData: FlTitlesData(
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const style = TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white,
                                    );
                                    return Text(
                                      value.toInt().toString(),
                                      style: style,
                                    );
                                  },
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const style = TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white,
                                    );
                                    String text;
                                    switch (value) {
                                      case 1:
                                        text = 'JAN';
                                        break;
                                      case 2:
                                        text = 'FEB';
                                        break;
                                      case 3:
                                        text = 'MAR';
                                        break;
                                      case 4:
                                        text = 'APR';
                                        break;
                                      case 5:
                                        text = 'MAY';
                                        break;
                                      case 6:
                                        text = 'JUN';
                                        break;
                                      default:
                                        return Container();
                                    }
                                    return Text(
                                      text,
                                      style: style,
                                    );
                                  },
                                ),
                              ),
                            ),
                            lineBarsData: [
                              list1,
                              list2,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(screenHeight * 0.02),
                  const Text(
                    "Monthly Footprint",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Gap(screenHeight * 0.02),
                  CustomContainer(
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.9,
                    borderCol: DTprimary().onContainer,
                    color: DTprimary().onContainer,
                    containerChild: Padding(
                      padding: ComponentData().defPad,
                      child: BarChart(
                        BarChartData(
                          titlesData: FlTitlesData(
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const style = TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.white,
                                  );
                                  return Text(
                                    value.ceilToDouble().toString(),
                                    style: style,
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 20,
                                getTitlesWidget: (value, meta) {
                                  const style = TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.white,
                                  );
                                  String text;
                                  switch (value) {
                                    case 1:
                                      text = 'JAN';
                                      break;
                                    case 2:
                                      text = 'FEB';
                                      break;
                                    case 3:
                                      text = 'MAR';
                                      break;
                                    case 4:
                                      text = 'APR';
                                      break;
                                    case 5:
                                      text = 'MAY';
                                      break;
                                    case 6:
                                      text = 'JUN';
                                      break;
                                    default:
                                      return Container();
                                  }
                                  return Text(
                                    text,
                                    style: style,
                                  );
                                },
                              ),
                            ),
                          ),
                          barGroups: [
                            generateGroupData(1, 2, 5, 1.7),
                            generateGroupData(2, 1.3, 3.1, 2.8),
                            generateGroupData(3, 3.1, 4, 3.1),
                            generateGroupData(4, 0.8, 3.3, 3.4),
                            generateGroupData(5, 2, 5.6, 1.8),
                            generateGroupData(6, 1.3, 3.2, 2),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap(screenHeight * 0.02),
                  const Text(
                    "Monthly Footprint",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Gap(screenHeight * 0.02),
                ],
              ),
            ),
          ),
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
