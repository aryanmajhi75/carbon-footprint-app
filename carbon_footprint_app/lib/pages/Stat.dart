import "package:carbon_footprint_app/components/CustomContainer.dart";
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: ComponentData().defPad,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(screenHeight * 0.02),
                Text(
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
                Text(
                  "Monthly Footprint",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Gap(screenHeight * 0.02),
                CustomContainer(
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.9,
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
                Text(
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
    );
  }
}
