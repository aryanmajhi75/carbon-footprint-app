import 'dart:async';
import 'dart:developer';

import 'package:air_quality/air_quality.dart';
import 'package:carbon_footprint_app/components/CustomContainer.dart';
import 'package:carbon_footprint_app/components/CustomSnackbar.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

class _HomeState extends State<Home> {
  final String _aqiToken = "6b96a07ff45c1dcc3931d81e109506673c44e728";
  late AirQuality _airQuality;
  AppState _state = AppState.NOT_DOWNLOADED;
  late List<AirQualityData> _data = [];

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  Color aqiColorIndi = const Color(0xffFFFFFF);

  @override
  void initState() {
    _airQuality = AirQuality(_aqiToken);
    // _data = [];
    super.initState();
  }

  checkGps(double screenWidth) async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          CustomSnackbar.show(
            context,
            "Location permissions are denied",
            DTprimary().error,
            "assets/icons/warning.png",
            screenWidth,
          );
          // print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          CustomSnackbar.show(
            context,
            "Location permissions are permanently denied",
            DTprimary().error,
            "assets/icons/warning.png",
            screenWidth,
          );
          // print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        getLocation();
      }
    } else {
      CustomSnackbar.show(
        context,
        "Turn on GPS location!",
        DTprimary().error,
        "assets/icons/warning.png",
        screenWidth,
      );
    }
  }

  Future getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    log("Inside getLocation(1) Longitude : ${position.longitude.toString()}");
    log("Inside getLocation(1) Latitude  : ${position.latitude.toString()}");

    setState(() {
      long = position.longitude.toString();
      lat = position.latitude.toString();
    });

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    if (lat != "" && long != "") {
      getAQI();
    }

    // StreamSubscription<Position> positionStream =
    //     Geolocator.getPositionStream(locationSettings: locationSettings)
    //         .listen((Position position) {
    //   log("Inside getLocation(2) Longitude : ${position.longitude.toString()}");
    //   log("Inside getLocation(2) Latitude :${position.latitude.toString()}");

    //   setState(() {
    //     long = position.longitude.toString();
    //     lat = position.latitude.toString();
    //   });
    // });
  }

  Future getAQI() async {
    // _data = [];

    setState(() {
      _state = AppState.DOWNLOADING;
    });

    AirQualityData feedFromGeoLocation = await _airQuality.feedFromGeoLocation(
      double.parse(lat),
      double.parse(long),
    );
    setState(() {
      _data.add(feedFromGeoLocation);
      log("feedFromGeoLocation : ${feedFromGeoLocation.toString()}");
      _state = AppState.FINISHED_DOWNLOADING;
      getAqiColor();
    });
  }

  getAqiColor() {
    if (_data[0].airQualityIndex <= 50 && _data[0].airQualityIndex >= 0) {
      setState(() {
        aqiColorIndi = DTprimary().good;
      });
    }

    if (_data[0].airQualityIndex <= 100 && _data[0].airQualityIndex > 50) {
      DTprimary().moderate;
    }

    if (_data[0].airQualityIndex <= 150 && _data[0].airQualityIndex >= 101) {
      setState(() {
        aqiColorIndi = DTprimary().unhealthySG;
      });
    }

    if (_data[0].airQualityIndex <= 200 && _data[0].airQualityIndex >= 151) {
      setState(() {
        aqiColorIndi = DTprimary().unhealthy;
      });
    }

    if (_data[0].airQualityIndex <= 300 && _data[0].airQualityIndex >= 201) {
      setState(() {
        aqiColorIndi = DTprimary().vUnhealthy;
      });
    }

    if (_data[0].airQualityIndex <= 300 && _data[0].airQualityIndex >= 201) {
      setState(() {
        aqiColorIndi = DTprimary().hazardous;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: ComponentData().defPad / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gap(screenHeight * 0.03),

            Gap(screenHeight * 0.03),
            SizedBox(
              height: screenHeight * 0.4,
              width: screenWidth * 0.9,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  CircularPercentIndicator(
                    radius: screenWidth * 0.4,
                    lineWidth: 13.0,
                    animation: true,
                    percent: 0.7,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: DTsecondary().onCircularLoader,
                    progressColor: DTprimary().onCircularLoader,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "250 K",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/earth.png"),
                            Gap(screenHeight * 0.01),
                            const Text(
                              "KgCO2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.3,
                    left: screenWidth * 0.75,
                    child: FloatingActionButton(
                      onPressed: () {
                        CustomSnackbar.show(
                            context,
                            "refreshing...",
                            DTprimary().onIconCol,
                            "assets/icons/uncertain.png",
                            screenWidth);
                      },
                      child: Image.asset("assets/icons/refresh.png"),
                    ),
                  ),
                ],
              ),
            ),
            Gap(screenWidth * 0.03),
            CustomContainer(
              height: screenHeight * 0.12,
              width: screenWidth,
              borderCol: DTprimary().onContainer,
              color: DTprimary().onContainer,
              containerChild: Row(
                children: [
                  Gap(screenWidth * 0.01),
                  CustomContainer(
                    height: screenHeight * 0.1,
                    width: screenHeight * 0.1,
                    borderCol: DTprimary().onBody,
                    color: DTprimary().onBody,
                    containerChild: Image.asset(
                      "assets/icons/aqi.png",
                    ),
                  ),
                  Gap(screenWidth * 0.02),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(screenWidth * 0.01),
                      SizedBox(
                        height: screenHeight * 0.03,
                        width: screenWidth * 0.66,
                        child: _data.isNotEmpty
                            ? Text(
                                _data[0].place,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: DTprimary().white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(""),
                      ),
                      Gap(screenWidth * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomContainer(
                            height: screenHeight * 0.06,
                            width: screenWidth * 0.48,
                            borderCol: aqiColorIndi,
                            color: Colors.transparent,
                            containerChild: Padding(
                              padding: ComponentData().defPad / 2,
                              child: Center(
                                child: _data.isNotEmpty
                                    ? Text(
                                        " AQI  :: ${_data[0].airQualityIndex}",
                                        maxLines: 2,
                                        // overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: DTprimary().white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(
                                        "",
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: DTprimary().error,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                // : LinearProgressIndicator(
                                //     borderRadius: const BorderRadius.all(
                                //         Radius.circular(20)),
                                //     color: DTprimary().onIconCol,
                                //   ),
                              ),
                            ),
                          ),
                          Gap(screenWidth * 0.01),
                          FloatingActionButton(
                            backgroundColor: DTprimary().onBody,
                            onPressed: () async {
                              CustomSnackbar.show(
                                context,
                                "please wait...",
                                DTprimary().onIconCol,
                                "assets/icons/uncertain.png",
                                screenWidth,
                              );
                              if (long != "" && lat != "") {
                                getAQI();
                                // getAqiColor();
                              } else {
                                await checkGps(screenWidth);

                                // getAqiColor();
                              }
                              // log("Long : $long");
                              // log("Lati : $lat");
                              // getAQI(lat, long);
                            },
                            child: Image.asset(
                              "assets/icons/location.png",
                              color: DTprimary().onIconCol,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(screenHeight * 0.02),
            CustomContainer(
              height: screenHeight * 0.12,
              width: screenWidth,
              borderCol: DTprimary().onContainer,
              color: DTprimary().onContainer,
              containerChild: Row(
                children: [
                  Gap(screenWidth * 0.02),
                  CustomContainer(
                    height: screenHeight * 0.1,
                    width: screenHeight * 0.1,
                    borderCol: DTprimary().onBody,
                    color: DTprimary().onBody,
                    containerChild: Image.asset(
                      "assets/icons/soothingenv.png",
                    ),
                  ),
                  Gap(screenWidth * 0.02),
                  CustomContainer(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.65,
                    borderCol: DTprimary().onBody,
                    color: Colors.transparent,
                    containerChild: Padding(
                      padding: ComponentData().defPad / 2,
                      child: Text(
                        "more than 45% of people in your area",
                        maxLines: 2,
                        // overflow: TextOverflow.clip,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: DTprimary().white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
