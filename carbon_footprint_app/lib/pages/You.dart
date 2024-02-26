import 'package:carbon_footprint_app/components/CustomContainer.dart';
import 'package:carbon_footprint_app/components/CustomExpansionTile.dart';
import 'package:carbon_footprint_app/components/CustomUserDataCard.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/dataClasses/expansionListData.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';
import 'package:carbon_footprint_app/dbHelper/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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

  String id = "nULL";
  String name = "nULL";
  String model = "nULL";
  String chassisNum = "nULL";
  int yearsOld = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  elevation: 10,
                  backgroundColor: DTprimary().onContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  children: [
                    TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: const InputDecoration(
                        label: Text(
                          "Enter Vehicle Name",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                          ),
                          // style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                          // username = value;
                        });
                      },
                      keyboardType: TextInputType.name,
                    ),
                    Gap(screenHeight * 0.01),
                    TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: const InputDecoration(
                        label: Text(
                          "Enter Vehicle Model",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                          ),
                          // style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          model = value;
                          // username = value;
                        });
                      },
                      keyboardType: TextInputType.name,
                    ),
                    Gap(screenHeight * 0.01),
                    TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: const InputDecoration(
                        label: Text(
                          "Enter Chassis Number",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                          ),
                          // style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          chassisNum = value;
                          // username = value;
                        });
                      },
                      keyboardType: TextInputType.name,
                    ),
                    Gap(screenHeight * 0.01),
                    TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: const InputDecoration(
                        label: Text(
                          "How old is the Vehicle?",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                          ),
                          // style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          yearsOld = int.parse(value);
                          // username = value;
                        });
                      },
                      keyboardType: TextInputType.name,
                    ),
                    Gap(screenHeight * 0.01),
                    IconButton(
                      onPressed: () {
                        id = "majhiaryan13@gmail.com";
                        UserVehicleData vehicleData = UserVehicleData(
                          id: id,
                          name: name,
                          model: model,
                          chassisNum: chassisNum,
                          yearsOld: yearsOld,
                        );
                        print(vehicleData.id);
                        print(vehicleData.name);
                        print(vehicleData.model);
                        print(vehicleData.chassisNum);
                        print(vehicleData.yearsOld);
                        insertUserVehicleData(vehicleData);
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.check_rounded,
                        color: DTprimary().onIconCol,
                      ),
                    )
                  ],
                );
              });
        },
        elevation: 5,
        backgroundColor: DTsecondary().onNavbarIconBg,
        child: Icon(
          Icons.add,
          color: DTprimary().onBody,
        ),
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
                const Text(
                  "Aryan's",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
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
                const Text(
                  "Vehicles",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Gap(screenHeight * 0.01),
                CustomContainer(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.9,
                  color: DTprimary().onContainer,
                  containerChild: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: ComponentData().defPad,
                            child: Placeholder(
                              fallbackHeight: screenHeight * 0.15,
                              fallbackWidth: screenHeight * 0.15,
                            ),
                          ),
                          Gap(screenWidth * 0.03),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Model",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "XMA",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                endIndent: 5,
                                indent: 5,
                                thickness: 2,
                                color: Colors.white,
                              ),
                              Text(
                                "Name",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "TATA NEXON",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
