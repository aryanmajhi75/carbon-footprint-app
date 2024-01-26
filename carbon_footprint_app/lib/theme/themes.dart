import "package:carbon_footprint_app/constants.dart";
import "package:flutter/material.dart";

//Theme settingsfor dark theme
ThemeData darkMode = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: DTprimary().onBody,
  fontFamily: 'Quicksand',
  textTheme: TextTheme(
      // displayMedium: TextStyle(
      //   color: spotifyWhite,
      //   decoration: TextDecoration.none,
      //   fontSize: 14,
      //   overflow: TextOverflow.ellipsis,
      //   fontFamily: 'Quicksand',
      //   fontWeight: FontWeight.w600,
      // ),
      ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: DTprimary().onNavbar,
    elevation: 5,
    height: 74,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    indicatorColor: DTsecondary().onNavbarIconBg,
  ),
  iconTheme: const IconThemeData(
    size: 43,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: DTsecondary().onIconBgCol,
    focusColor: DTprimary().onIconCol,
  ),
);

//Theme settingsfor dark theme
ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    background: LTprimary().onBody,
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
      // displayMedium: TextStyle(
      //   color: spotifyWhite,
      //   decoration: TextDecoration.none,
      //   fontSize: 14,
      //   overflow: TextOverflow.ellipsis,
      //   fontFamily: 'Quicksand',
      //   fontWeight: FontWeight.w600,
      // ),
      ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: DTprimary().onNavbar,
    elevation: 5,
    unselectedIconTheme: IconThemeData(
      color: LTsecondary().onNavbarIconCol,
      size: 30,
    ),
    selectedIconTheme: IconThemeData(
      size: 30,
      color: LTprimary().onNavbarIconBg,
    ),
    type: BottomNavigationBarType.fixed,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      // overlayColor: MaterialStatePropertyAll(
      //   ,
      // ),
      iconColor: MaterialStatePropertyAll(LTprimary().onIconCol),
      // foregroundColor: MaterialStatePropertyAll(spotifyGreen),
      visualDensity: VisualDensity.comfortable,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: LTsecondary().onIconBgCol,
    focusColor: DTprimary().onIconCol,
  ),
);
