import 'dart:developer';

import 'package:carbon_footprint_app/components/CustomAddUsage.dart';
import 'package:carbon_footprint_app/components/CustomExpansionTile.dart';
import 'package:carbon_footprint_app/components/CustomSnackbar.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/dataClasses/expansionListData.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';
import 'package:carbon_footprint_app/dbHelper/getData/applianceUserUsage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyUsage extends StatefulWidget {
  const MyUsage({super.key});

  @override
  State<MyUsage> createState() => _MyUsageState();
}

class _MyUsageState extends State<MyUsage> {
  List<ApplianceUsage> listOfUsage = [];
  String userid = "";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DTprimary().onBody,
        leading: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: DTprimary().onBody,
          child: Image.asset(
            "assets/icons/goback.png",
            height: 50,
            color: DTprimary().white,
          ),
        ),
        actions: [
          FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              side: BorderSide(
                color: DTprimary().white,
              ),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAddUsage(
                      brandName: "brand name",
                      type: "type of product",
                    );
                  });

              // Navigator.pop(context);
            },
            backgroundColor: DTprimary().onBody,
            label: Row(
              children: [
                Image.asset(
                  "assets/icons/add.png",
                  height: 20,
                  color: DTprimary().white,
                ),
                Gap(screenHeight * 0.01),
                Text(
                  "Add Usage",
                  style: TextStyle(color: DTprimary().white),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = Hive.box('authdata');
          userid = box.get('id');
          // setState(() async {
          listOfUsage = await getUserApplianceUsage(userid);
          log(listOfUsage.toString());
          // });
        },
        child: Image.asset("assets/icons/refresh.png"),
      ),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight * 0.6,
          width: screenWidth,
          child: FutureBuilder(
            // initialData: listOfUsage,
            future: getUserApplianceUsage(userid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  !snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    color: DTprimary().onIconCol,
                  ),
                );
              }
              if (snapshot.connectionState != ConnectionState.done &&
                  snapshot.hasError) {
                log(snapshot.error.toString());
                CustomSnackbar.show(
                  context,
                  "Error : ${snapshot.error}",
                  DTprimary().error,
                  "assets/icons/warning.png",
                  screenWidth,
                );
                return Center(
                  child: CircularProgressIndicator(color: DTprimary().error),
                );
              }
              return ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.vertical,
                  padding: ComponentData().defPad / 2,
                  itemCount: listOfUsage.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: CustomExpansionTile(
                        heading: listOfUsage[index].brandName,
                        items: [
                          ExpansionListData("Type", listOfUsage[index].type),
                          ExpansionListData("Hours used",
                              listOfUsage[index].hours.toString()),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
