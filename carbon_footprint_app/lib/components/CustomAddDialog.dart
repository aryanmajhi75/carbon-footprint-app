import 'dart:developer';

import 'package:carbon_footprint_app/components/CustomSnackbar.dart';
import 'package:carbon_footprint_app/components/CustomTextfield.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';
import 'package:carbon_footprint_app/dbHelper/insertData/applianceUserData.dart';
import 'package:carbon_footprint_app/dbHelper/insertData/vehicleUserData.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class customAddDialog extends StatefulWidget {
  String type;
  String name;
  String model;
  String uniqueNumber;
  String old;
  customAddDialog({
    required this.type,
    required this.model,
    required this.name,
    required this.old,
    required this.uniqueNumber,
    super.key,
  });

  @override
  State<customAddDialog> createState() => _customAddDialogState();
}

class _customAddDialogState extends State<customAddDialog> {
  late TextEditingController idController = TextEditingController(text: "");
  late TextEditingController nameController = TextEditingController(text: "");
  late TextEditingController modelController = TextEditingController(text: "");
  late TextEditingController chassisController =
      TextEditingController(text: "");
  late TextEditingController oldController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.8,
      width: screenWidth * 0.9,
      child: SimpleDialog(
        alignment: Alignment.center,
        elevation: 10,
        title: const Text("Vehicle Details"),
        titlePadding: const EdgeInsets.all(5),
        titleTextStyle: TextStyle(
          fontFamily: "Quicksand",
          color: DTprimary().white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        backgroundColor: DTprimary().onContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
          bottom: 5,
        ),
        children: [
          CustomTextfield(
            type: "vehicle",
            icon: widget.type == "vehicle"
                ? Icon(
                    Icons.directions_bike_rounded,
                    color: DTprimary().onIconCol,
                  )
                : Icon(
                    Icons.lightbulb,
                    color: DTprimary().onIconCol,
                  ),
            label: widget.name,
            textController: nameController,
          ),
          Gap(screenHeight * 0.01),
          CustomTextfield(
            type: "",
            icon: widget.type == "vehicle"
                ? Icon(
                    Icons.directions_bike_rounded,
                    color: DTprimary().onIconCol,
                  )
                : Icon(
                    Icons.lightbulb,
                    color: DTprimary().onIconCol,
                  ),
            label: widget.model,
            textController: modelController,
          ),
          Gap(screenHeight * 0.01),
          CustomTextfield(
            type: "chassisNum",
            icon: widget.type == "vehicle"
                ? Icon(
                    Icons.directions_bike_rounded,
                    color: DTprimary().onIconCol,
                  )
                : Icon(
                    Icons.lightbulb,
                    color: DTprimary().onIconCol,
                  ),
            label: widget.uniqueNumber,
            textController: chassisController,
          ),
          Gap(screenHeight * 0.01),
          CustomTextfield(
            type: "yearsOld",
            icon: widget.type == "vehicle"
                ? Icon(
                    Icons.directions_bike_rounded,
                    color: DTprimary().onIconCol,
                  )
                : Icon(
                    Icons.lightbulb,
                    color: DTprimary().onIconCol,
                  ),
            label: widget.old,
            textController: oldController,
          ),
          Gap(screenHeight * 0.03),
          IconButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(DTprimary().onIconCol),
                fixedSize: MaterialStatePropertyAll(
                  Size(screenWidth * 0.5, screenHeight * 0.1),
                )),
            padding: const EdgeInsets.all(10),
            visualDensity: VisualDensity.comfortable,
            onPressed: () {
              var box = Hive.box("authdata");
              String id = box.get("id");
              if (widget.type == "vehicle") {
                UserVehicleData vehicleData = UserVehicleData(
                  id: id,
                  name: nameController.text,
                  model: modelController.text,
                  chassisNum: chassisController.text,
                  yearsOld: int.parse(oldController.text),
                );
                insertUserVehicleData(vehicleData);
              } else {
                log(id);
                log(nameController.text);
                log(modelController.text);
                log(oldController.text);

                UserApplianceData applianceData = UserApplianceData(
                  id: id,
                  name: nameController.text,
                  model: modelController.text,
                  serialNum: chassisController.text,
                  yearsOld: int.parse(oldController.text),
                );
                insertUserApplianceData(applianceData);
              }
              CustomSnackbar.show(
                context,
                "added successfully!",
                DTprimary().onIconCol,
                "assets/icons/success.png",
                screenWidth,
              );
              Navigator.of(context).pop();
            },
            icon: Image.asset(
              "assets/icons/check.png",
              height: 40,
              width: 40,
            ),
          ),
          Gap(screenHeight * 0.02),
        ],
      ),
    );
  }
}
