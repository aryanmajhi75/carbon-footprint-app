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
  Radius defRad = const Radius.circular(22);
}
