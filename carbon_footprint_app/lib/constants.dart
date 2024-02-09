import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// const DTprimary = Color(0xff000000);
// const DTsecondary = Color(0xff2AA95D);

// const LTprimary = Color(0xff000000);
// const LTsecondary = Color(0xff2AA95D);

//primary color when in dark mode
class DTprimary {
  Color onContainer = const Color(0xff312F2F);
  Color onBody = const Color(0xff000000);
  Color onCircularLoader = const Color(0xff2AA95D);
  Color onNavbar = const Color(0xff2AA95D);
  Color onNavbarIconCol = const Color(0xff2AA95D);
  Color onNavbarIconBg = const Color(0xff000000);
  Color onIconCol = const Color(0xff2AA95D);
}

//secondary color when in dark mode
class DTsecondary {
  Color onContainer = const Color(0xff312F2F);
  Color onCircularLoader = const Color(0xff312F2F);
  Color onNavbar = const Color(0xff000000);
  Color onNavbarIconCol = const Color(0xff000000);
  Color onNavbarIconBg = const Color(0xff2AA95D);
  Color onIconBgCol = const Color(0xff312F2F);
}

//primary color when in light mode
class LTprimary {
  Color onContainer = const Color(0xff312F2F);
  Color onBody = const Color(0xff000000);
  Color onCircularLoader = const Color(0xff2AA95D);
  Color onNavbar = const Color(0xff2AA95D);
  Color onNavbarIconCol = const Color(0xff2AA95D);
  Color onNavbarIconBg = const Color(0xff2AA95D);
  Color onIconCol = const Color(0xff2AA95D);
}

//secondary color when in light mode
class LTsecondary {
  Color onContainer = const Color(0xff312F2F);
  Color onCircularLoader = const Color(0xff312F2F);
  Color onNavbar = const Color(0xff000000);
  Color onNavbarIconCol = const Color(0xff000000);
  Color onNavbarIconBg = const Color(0xff2AA95D);
  Color onIconBgCol = const Color(0xff312F2F);
}

class ComponentData {
  EdgeInsetsGeometry defPad = const EdgeInsets.all(20);
  Radius defRad = const Radius.circular(22);
}

List<FlSpot> list1Data = [
  const FlSpot(1, 460),
  const FlSpot(2, 350),
  const FlSpot(3, 670),
  const FlSpot(4, 520),
  const FlSpot(5, 180),
  const FlSpot(6, 90),
];

List<FlSpot> list2Data = [
  const FlSpot(1, 300),
  const FlSpot(2, 290),
  const FlSpot(3, 250),
  const FlSpot(4, 260),
  const FlSpot(5, 260),
  const FlSpot(6, 40),
];
