import 'package:carbon_footprint_app/components/CustomAddDialog.dart';
import 'package:carbon_footprint_app/components/CustomExpansionTile.dart';
import 'package:carbon_footprint_app/components/CustomSnackbar.dart';
import 'package:carbon_footprint_app/components/CustomUserPossession.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/dataClasses/expansionListData.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';
import 'package:carbon_footprint_app/dbHelper/getData/applianceUserData.dart';
import 'package:carbon_footprint_app/dbHelper/getData/vehicleUserData.dart';
import 'package:carbon_footprint_app/pages/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class You extends StatefulWidget {
  const You({super.key});

  @override
  State<You> createState() => _YouState();
}

class _YouState extends State<You> {
  final List<ExpansionListData> _bioList = [
    ExpansionListData(
      "Gender",
      "Male",
    ),
    ExpansionListData(
      "Age",
      "23",
    ),
  ];

  final List<ExpansionListData> _dietList = [
    ExpansionListData(
      "Meat",
      "Sometimes",
    ),
    ExpansionListData(
      "Milk",
      "Sometimes",
    ),
  ];

  bool isVehicle = false;
  bool isHomeAppliance = false;
  String userid = "";

  List<UserGeneralData> listOfUserData = [];
  List<UserVehicleData> listOfUserVehicleData = [];
  List<UserApplianceData> listOfUserApplianceData = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add_rounded),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: DTprimary().onIconCol,
          backgroundColor: DTsecondary().onContainer,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.close_rounded),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: DTprimary().onBody,
          backgroundColor: DTprimary().error,
          shape: const CircleBorder(),
        ),
        distance: 65,
        type: ExpandableFabType.up,
        pos: ExpandableFabPos.right,
        children: [
          FloatingActionButton.extended(
            heroTag: null,
            label: Text(
              "Add Vehicle",
              style: TextStyle(
                color: DTprimary().white,
              ),
            ),
            icon: Icon(
              Icons.directions_car_filled_rounded,
              color: DTprimary().onIconCol,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return customAddDialog(
                      type: "vehicle",
                      model: "vehicle model",
                      name: "vehicle name",
                      old: "how old is the vehicle?",
                      uniqueNumber: "chassis number",
                    );
                  });
            },
          ),
          FloatingActionButton.extended(
            label: Text(
              "Add Appliances",
              style: TextStyle(
                color: DTprimary().white,
              ),
            ),
            icon: Icon(
              Icons.lightbulb,
              color: DTprimary().onIconCol,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return customAddDialog(
                      type: "appliance",
                      model: "model name",
                      name: "appliance name",
                      old: "how old is the appliance?",
                      uniqueNumber: "serial number",
                    );
                  });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: ComponentData().defPad,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        color: DTprimary().white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Visibility(
                      visible: idPresent == true ? true : false,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.all(15),
                          ),
                          side: MaterialStatePropertyAll(
                            BorderSide(
                              color: DTprimary().error,
                              width: 2,
                            ),
                          ),
                          alignment: Alignment.center,
                          visualDensity: VisualDensity.comfortable,
                          backgroundColor: MaterialStatePropertyAll(
                            DTprimary().onBody,
                          ),
                        ),
                        onPressed: () {
                          var authdata = Hive.box("authData");
                          authdata.delete("id");
                          if (authdata.get("id") == null) {
                            setState(() {
                              idPresent = false;
                            });
                          }
                          CustomSnackbar.show(
                            context,
                            "logged out",
                            DTprimary().error,
                            "assets/icons/uncertain.png",
                            screenWidth,
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const Home(),
                          //   ),
                          // );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/logout.png",
                              height: 30,
                              width: 30,
                              color: DTprimary().error,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                color: DTprimary().error,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: CustomExpansionTile(
                    heading: "Bio",
                    items: _bioList,
                  ),
                ),
                Gap(screenHeight * 0.01),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: CustomExpansionTile(
                    heading: "Diet",
                    items: _dietList,
                  ),
                ),
                Gap(screenHeight * 0.01),
                Row(
                  children: [
                    ChoiceChip(
                      shape: RoundedRectangleBorder(
                          borderRadius: isVehicle
                              ? const BorderRadius.all(Radius.circular(10))
                              : const BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(
                              width: 2,
                              color: isVehicle
                                  ? DTprimary().onIconCol
                                  : DTprimary().onBody)),
                      showCheckmark: false,
                      pressElevation: 15,
                      selected: isVehicle,
                      label: Text(
                        "vehicle(s)",
                        style: TextStyle(color: DTprimary().onCircularLoader),
                      ),
                      visualDensity: VisualDensity.comfortable,
                      avatar: Image.asset(
                        "assets/icons/vehicle.png",
                        color: DTprimary().onCircularLoader,
                      ),
                      elevation: 10,
                      onSelected: (value) async {
                        setState(() {
                          isVehicle = value;
                          isHomeAppliance = !value;
                        });
                        var box = Hive.box('authdata');
                        userid = box.get('id');
                        listOfUserVehicleData =
                            await getUserVehicleData(userid);

                        // print("clicked $value");
                      },
                      color: MaterialStatePropertyAll(DTprimary().onBody),
                    ),
                    Gap(screenHeight * 0.01),
                    ChoiceChip(
                      // backgroundColor: DTprimary().onIconCol,
                      shape: RoundedRectangleBorder(
                          borderRadius: isHomeAppliance
                              ? const BorderRadius.all(Radius.circular(10))
                              : const BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(
                              width: 2,
                              color: isHomeAppliance
                                  ? DTprimary().onIconCol
                                  : DTprimary().onBody)),
                      showCheckmark: false,
                      pressElevation: 15,
                      selected: isHomeAppliance,
                      label: Text(
                        "appliance(s)",
                        style: TextStyle(color: DTprimary().onCircularLoader),
                      ),
                      visualDensity: VisualDensity.comfortable,
                      avatar: Image.asset(
                        "assets/icons/appliance.png",
                        color: DTprimary().onCircularLoader,
                      ),
                      elevation: 10,
                      onSelected: (value) async {
                        setState(() {
                          isHomeAppliance = value;
                          isVehicle = !value;
                        });
                        var box = Hive.box('authdata');
                        userid = box.get('id');
                        listOfUserApplianceData =
                            await getUserApplianceData(userid);
                      },
                      color: MaterialStatePropertyAll(DTprimary().onBody),
                    ),
                  ],
                ),
                Gap(screenHeight * 0.02),
                SizedBox(
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.9,
                  child: FutureBuilder(
                    future: isVehicle == true
                        ? getUserVehicleData(userid)
                        : getUserApplianceData(userid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                              color: DTprimary().onIconCol),
                        );
                      } else if (snapshot.hasError) {
                        CustomSnackbar.show(
                          context,
                          "Error : ${snapshot.error}",
                          DTprimary().error,
                          "assets/icons/warning.png",
                          screenWidth,
                        );
                        return Center(
                          child: CircularProgressIndicator(
                              color: DTprimary().error),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: isVehicle == true
                              ? listOfUserVehicleData.length
                              : listOfUserApplianceData.length,
                          itemBuilder: (context, index) {
                            return isVehicle == true
                                ? Padding(
                                    padding: ComponentData().defPad / 4,
                                    child: CustomPossession(
                                      type: "vehicle",
                                      model: listOfUserVehicleData[index].model,
                                      name: listOfUserVehicleData[index].name,
                                      uniqueNum: listOfUserVehicleData[index]
                                          .chassisNum,
                                      yearsOld:
                                          listOfUserVehicleData[index].yearsOld,
                                    ),
                                  )
                                : Padding(
                                    padding: ComponentData().defPad / 4,
                                    child: CustomPossession(
                                      type: "appliance",
                                      model:
                                          listOfUserApplianceData[index].model,
                                      name: listOfUserApplianceData[index].name,
                                      uniqueNum: listOfUserApplianceData[index]
                                          .serialNum,
                                      yearsOld: listOfUserApplianceData[index]
                                          .yearsOld,
                                    ),
                                  );
                          },
                          shrinkWrap: false,
                          scrollDirection: Axis.vertical,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
