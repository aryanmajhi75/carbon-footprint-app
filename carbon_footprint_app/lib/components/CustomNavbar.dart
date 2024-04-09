import 'dart:developer';

import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/pages/Eco.dart';
import 'package:carbon_footprint_app/pages/Home.dart';
import 'package:carbon_footprint_app/pages/Stat.dart';
import 'package:carbon_footprint_app/pages/UserDataForm.dart';
import 'package:carbon_footprint_app/pages/You.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  // void _navigation(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  @override
  void initState() {
    var authdata = Hive.box("authData");
    // hegqhj@gmail.com
    // authdata.delete("id");
    if (authdata.get("id") == null) {
      setState(() {
        idPresent = false;
      });
    }

    log("Id :  ${authdata.get("id")}");
    super.initState();
  }

  final List<Widget> _pages = const [
    Home(),
    Stat(),
    Eco(),
    You(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: ComponentData().defRad,
          topRight: ComponentData().defRad,
        ),
        child: NavigationBar(
          elevation: 0,
          onDestinationSelected: (int index) {
            setState(() {
              if (idPresent == true) {
                _selectedIndex = index;
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserDataForm()));
              }
            });
          },
          selectedIndex: _selectedIndex,
          animationDuration: const Duration(seconds: 2),
          height: 74,
          destinations: [
            NavigationDestination(
              selectedIcon: Container(
                decoration: BoxDecoration(
                  color: DTprimary().onNavbarIconBg,
                  borderRadius: BorderRadius.circular(22),
                ),
                height: 70,
                width: 70,
                child: Image.asset("assets/icons/Home_selected.png"),
              ).animate(
                effects: [
                  const FlipEffect(
                    curve: Curves.bounceInOut,
                  ),
                ],
              ),
              icon: Image.asset("assets/icons/Home.png"),
              label: "Home",
            ),
            NavigationDestination(
              selectedIcon: Container(
                decoration: BoxDecoration(
                  color: DTprimary().onNavbarIconBg,
                  borderRadius: BorderRadius.circular(22),
                ),
                height: 70,
                width: 70,
                child: Image.asset("assets/icons/Stat_selected.png"),
              ).animate(
                effects: [
                  const FlipEffect(
                    curve: Curves.bounceInOut,
                  ),
                ],
              ),
              icon: Image.asset("assets/icons/Stat.png"),
              label: "Stat",
            ),
            NavigationDestination(
              selectedIcon: Container(
                decoration: BoxDecoration(
                  color: DTprimary().onNavbarIconBg,
                  borderRadius: BorderRadius.circular(22),
                ),
                height: 70,
                width: 70,
                child: Image.asset("assets/icons/Eco_selected.png"),
              ).animate(
                effects: [
                  const FlipEffect(
                    curve: Curves.bounceInOut,
                  ),
                ],
              ),
              icon: Image.asset("assets/icons/Eco.png"),
              label: "Eco",
            ),
            NavigationDestination(
              selectedIcon: Container(
                decoration: BoxDecoration(
                  color: DTprimary().onNavbarIconBg,
                  borderRadius: BorderRadius.circular(22),
                ),
                height: 70,
                width: 70,
                child: Image.asset("assets/icons/You_selected.png"),
              ).animate(
                effects: [
                  const FlipEffect(
                    curve: Curves.bounceInOut,
                  ),
                ],
              ),
              icon: Image.asset("assets/icons/You.png"),
              label: "You",
            ),
          ],
        ),
      ),
    );
  }
}
