import 'package:carbon_footprint_app/components/CustomTextfield.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';
import 'package:carbon_footprint_app/dbHelper/insertData/applianceUserUsage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomAddUsage extends StatefulWidget {
  String brandName;
  String type;
  CustomAddUsage({
    super.key,
    required this.brandName,
    required this.type,
  });

  @override
  State<CustomAddUsage> createState() => _CustomAddUsageState();
}

class _CustomAddUsageState extends State<CustomAddUsage> {
  late TextEditingController brandnameController =
      TextEditingController(text: "");
  late TextEditingController typeController = TextEditingController(text: "");
  double _hours = 0;

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
            type: "usage",
            icon: Icon(
              Icons.electric_bolt_rounded,
              color: DTprimary().onIconCol,
            ),
            label: widget.brandName,
            textController: brandnameController,
          ),
          Gap(screenHeight * 0.01),
          CustomTextfield(
            type: "usage",
            icon: Icon(
              Icons.electric_bolt_rounded,
              color: DTprimary().onIconCol,
            ),
            label: widget.type,
            textController: typeController,
          ),
          Gap(screenHeight * 0.01),
          Text(
            "Hours of usage",
            style: TextStyle(
              fontFamily: "Quicksand",
              color: DTprimary().white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Slider(
            min: 0,
            max: 24,
            value: _hours,
            divisions: 24,
            activeColor: DTprimary().onIconCol,
            label: '${_hours.round()}',
            onChanged: (value) {
              setState(() {
                _hours = value;
              });
            },
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
              ApplianceUsage doc = ApplianceUsage(
                id: id,
                brandName: brandnameController.text,
                type: typeController.text,
                hours: _hours.toInt(),
              );
              // print(
              //     "${doc.brandName} : ${doc.hours} : ${doc.type} : ${doc.id}");
              insertUserApplianceUsage(doc);
              Navigator.pop(context);
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
